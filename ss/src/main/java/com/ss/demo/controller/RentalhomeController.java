package com.ss.demo.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;
import com.ss.demo.domain.PageMaker;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.Rentalhome_PayVO;
import com.ss.demo.domain.Rentalhome_ReviewVO;
import com.ss.demo.domain.Rentalhome_Review_ReportVO;
import com.ss.demo.domain.Rentalhome_RoomVO;
import com.ss.demo.domain.Rentalhome_SearchVO;
import com.ss.demo.domain.UserVO;
import com.ss.demo.service.PayService;
import com.ss.demo.service.RentalhomeService;
import com.sun.org.apache.xerces.internal.impl.xpath.regex.ParseException;

@Controller
@RequestMapping(value="/rentalhome")
public class RentalhomeController {
	
	@Autowired
	private RentalhomeService rentalhomeService;

	@Autowired
	private PayService payService;

	@Autowired
	private PageMaker pageMaker;
	
	private String api_key = "0830272243640038";
	private String api_secret = "BMWpjpF1BImo7FTOambSUusQAq8JjK2jWTLw5Q0JMNGSfD14w4mOcP88KRN9bAGnzLzeTb1kbENSTpi8";
	private IamportClient client = new IamportClient(api_key, api_secret);
	
	@RequestMapping(value="/rentalhomeMain.do")
	public String rentalhomeMain(Model model, Rentalhome_SearchVO searchVO, HttpSession session){
		
		if(session.getAttribute("login") != null) {
			UserVO loginVO = (UserVO)session.getAttribute("login");
			searchVO.setuNo(loginVO.getuNo());
		}
		if(searchVO.getSort() == null || searchVO.getSort() == "") {
			
			searchVO.setSort("review");
		}
		if(searchVO.getMax_price() ==  0) {
			
			searchVO.setMax_price(1000000);
		}
		if(searchVO.getCurrentPage() ==  0) {
			searchVO.setCurrentPage(1);
		}
		System.out.println(searchVO.toString());

		List<RentalhomeVO> list = rentalhomeService.selectAll(searchVO);
		model.addAttribute("list", list);
		for(int i=0; i<list.size(); i++) {
				System.out.println(list.get(i).getDupl_count());
			
		}
		int totalCount = rentalhomeService.select_rentalhome_count();
		
		pageMaker.setCri(searchVO);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker.toString());
		model.addAttribute("pageMaker", pageMaker);
		
		model.addAttribute("searchVO", searchVO);
//		System.out.println(list.get(list.size()-1).getLogical_name());
		return "rentalhome/rentalhomeMain";
	}
	
	@RequestMapping(value="/rentalhomeView.do")
	public String rentalhomeView(
			Model model, int rentalhome_idx, Rentalhome_LikeVO likeVO, Rentalhome_SearchVO searchVO, HttpServletRequest req
			){
		RentalhomeVO rentalhomeVO = rentalhomeService.selectOneByIdx(rentalhome_idx);
		model.addAttribute("rentalhomeVO", rentalhomeVO);
		
		List<RentalhomeVO> list_rentalhome_attach = rentalhomeService.selectAll_rentalhome_attach(rentalhome_idx);
		model.addAttribute("attach", list_rentalhome_attach);

		List<Rentalhome_RoomVO> list_rentalhome_room_attach = rentalhomeService.selectAll_room_attach();
		model.addAttribute("attach_room", list_rentalhome_room_attach);
		
		List<Rentalhome_RoomVO> list = rentalhomeService.selectAll_room(searchVO);
		model.addAttribute("list", list);
		System.out.println(searchVO.toString());
		int like_count = rentalhomeService.select_like(rentalhome_idx);
		model.addAttribute("like_count", like_count);

		model.addAttribute("searchVO", searchVO);
		
		if (req.getSession().getAttribute("login") != null) {
	        UserVO loginVO = (UserVO) req.getSession().getAttribute("login");
	        likeVO.setUno(loginVO.getuNo());
	        int like_dupl = rentalhomeService.dupl_like(likeVO);
	        model.addAttribute("like_dupl", like_dupl);
		}else {
			model.addAttribute("like_dupl", 0);
		}
		
		if(rentalhomeService.select_review_count(rentalhome_idx) > 0) {
			Rentalhome_ReviewVO reviewVO = rentalhomeService.select_review_avg(rentalhome_idx);
			reviewVO.setCount(rentalhomeService.select_review_count(rentalhome_idx));
			model.addAttribute("reviewVO", reviewVO);
			
			List<Rentalhome_ReviewVO> reviewVO_list = rentalhomeService.selectAll_review(rentalhome_idx);
			model.addAttribute("reviewVO_list", reviewVO_list);
			for(Rentalhome_ReviewVO item : reviewVO_list) {
				item.setWdate(item.getWdate().split(" ")[0]);
			}
		}
		
		return "rentalhome/rentalhomeView";
	}

	@RequestMapping(value="/rentalhomeWrite.do", method=RequestMethod.GET)
	public String rentalhomeWrite(){
		
		return "rentalhome/rentalhomeWrite";
	}

	@RequestMapping(value="/rentalhomeWrite.do", method=RequestMethod.POST)
	public String rentalhomeWrite(
			RentalhomeVO rentalhomeVO,
			@RequestParam("multiFile") List<MultipartFile> multiFileList,
			HttpServletRequest request,
			HttpSession session
			){
		UserVO loginVO = (UserVO)session.getAttribute("login");
		rentalhomeVO.setuNo(loginVO.getuNo());
		int value = rentalhomeService.insert(rentalhomeVO);
		
		if( multiFileList.get(0).isEmpty() )
		{
			return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+rentalhomeVO.getRentalhome_idx();
		}
		
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources/upload");
		
		File file = new File(path);
		// 경로에 폴더가 없으면 폴더를 생성
		if(!file.exists()){
			file.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() +  etc;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		
		System.out.println("fileList: " + fileList);
		boolean flag = true;
		// 파일업로드
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				
				rentalhomeVO.setLogical_name(fileList.get(i).get("originFile"));
				rentalhomeVO.setPhysical_name(fileList.get(i).get("changeFile"));
				
				if(flag) {
					rentalhomeVO.setThumbnail("Y");
					flag = false;
				}else {
					rentalhomeVO.setThumbnail("N");
				}
				System.out.println("rentalhomeVO 썸네일: " + rentalhomeVO.getThumbnail());
				int value2 = rentalhomeService.insert_file(rentalhomeVO);
			}
			
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (Exception e) {
			System.out.println("다중 파일 업로드 실패");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			
			e.printStackTrace();
		}
		
		return "redirect:/rentalhome/rentalhomeMain.do";
	}

	@RequestMapping(value="/rentalhomeModify.do", method=RequestMethod.GET)
	public String rentalhomeModify(int rentalhome_idx, Model model){
		
		RentalhomeVO rentalhomeVO = rentalhomeService.selectOneByIdx(rentalhome_idx);
		model.addAttribute("rentalhomeVO", rentalhomeVO);
		
		List<RentalhomeVO> list_rentalhome_attach = rentalhomeService.selectAll_rentalhome_attach(rentalhome_idx);
		model.addAttribute("attach", list_rentalhome_attach);
		
		
		return "rentalhome/rentalhomeModify";
	}
	
	@RequestMapping(value="/rentalhomeModify.do", method=RequestMethod.POST)
	public String rentalhomeModify(
			RentalhomeVO rentalhomeVO,
			@RequestParam("multiFile") List<MultipartFile> multiFileList,
			HttpServletRequest request){
		int value = rentalhomeService.update(rentalhomeVO);
		System.out.println("multiFileList:" + multiFileList);
		
		if( multiFileList.get(0).isEmpty() )
		{
			return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+rentalhomeVO.getRentalhome_idx();
		}
		
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources/upload");
		
		File file = new File(path);
		// 경로에 폴더가 없으면 폴더를 생성
		if(!file.exists()){
			file.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() +  etc;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		
		System.out.println("fileList: " + fileList);
		// 파일업로드
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				
				rentalhomeVO.setLogical_name(fileList.get(i).get("originFile"));
				rentalhomeVO.setPhysical_name(fileList.get(i).get("changeFile"));
				rentalhomeVO.setThumbnail("N");
				System.out.println("rentalhomeVO 썸네일: " + rentalhomeVO.getThumbnail());
				
				int value2 = rentalhomeService.insert_file(rentalhomeVO);
			}
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (Exception e) {
			System.out.println("다중 파일 업로드 실패");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			
			e.printStackTrace();
		}
		return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+rentalhomeVO.getRentalhome_idx();
	}

	@RequestMapping(value="/rentalhomeDelete.do", method=RequestMethod.POST)
	public String rentalhomeDelete(int rentalhome_idx){
		
		int value = rentalhomeService.delete_rentalhome(rentalhome_idx);
		return "redirect:/rentalhome/rentalhomeMain.do";
	}

	@RequestMapping(value="/rentalhomeWrite_room.do", method=RequestMethod.GET)
	public String rentalhomeWrite_room(int rentalhome_idx, Model model){
		RentalhomeVO rentalhomeVO = rentalhomeService.selectOneByIdx(rentalhome_idx);
		model.addAttribute("rentalhomeVO", rentalhomeVO);
		return "rentalhome/rentalhomeWrite_room";
	}

	@RequestMapping(value="/rentalhomeWrite_room.do", method=RequestMethod.POST)
	public String rentalhomeWrite_room(
			Rentalhome_RoomVO roomVO,
			@RequestParam("multiFile") List<MultipartFile> multiFileList,
			HttpServletRequest request){
		int value = rentalhomeService.insert_room(roomVO);
		
		if( multiFileList.get(0).isEmpty() )
		{
			return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+roomVO.getRentalhome_idx();
		}
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources/upload");
		
		File file = new File(path);
		// 경로에 폴더가 없으면 폴더를 생성
		if(!file.exists()){
			file.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile =UUID.randomUUID().toString() + etc;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		
		System.out.println("fileList: " + fileList);
		boolean flag = true;
		// 파일업로드
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				
				roomVO.setLogical_name(fileList.get(i).get("originFile"));
				roomVO.setPhysical_name(fileList.get(i).get("changeFile"));
				
				if(flag) {
					roomVO.setThumbnail("Y");
					flag = false;
				}else {
					roomVO.setThumbnail("N");
				}
				System.out.println("roomVO 썸네일: " + roomVO.getThumbnail());
				int value2 = rentalhomeService.insert_room_file(roomVO);
			}
			
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (Exception e) {
			System.out.println("다중 파일 업로드 실패");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			
			e.printStackTrace();
		}
		
		return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+roomVO.getRentalhome_idx();
	}

	@RequestMapping(value="/rentalhomeModify_room.do", method=RequestMethod.GET)
	public String rentalhomeModify_room(Rentalhome_RoomVO roomVO, Model model){
		RentalhomeVO rentalhomeVO = rentalhomeService.selectOneByIdx(roomVO.getRentalhome_idx());
		model.addAttribute("rentalhomeVO", rentalhomeVO);
		
		Rentalhome_RoomVO roomVO_ = rentalhomeService.selectOneByIdx_room(roomVO.getRoom_idx());
		model.addAttribute("roomVO", roomVO_);
		
		List<Rentalhome_RoomVO> roomVO_attach = rentalhomeService.selectAll_room_attach_ByIdx(roomVO.getRoom_idx());
		model.addAttribute("attach", roomVO_attach);
		
		return "rentalhome/rentalhomeModify_room";
	}
	
	@RequestMapping(value="/rentalhomeModify_room.do", method=RequestMethod.POST)
	public String rentalhomeModify_room(
			Rentalhome_RoomVO roomVO,
			@RequestParam("multiFile") List<MultipartFile> multiFileList,
			HttpServletRequest request){
		System.out.println(roomVO.toString());
		int value = rentalhomeService.update_room(roomVO);
		
		if( multiFileList.get(0).isEmpty() )
		{
			return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+roomVO.getRentalhome_idx();
		}
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources/upload");
		
		File file = new File(path);
		// 경로에 폴더가 없으면 폴더를 생성
		if(!file.exists()){
			file.mkdirs();
		}
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile =UUID.randomUUID().toString() + etc;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		
		// 파일업로드
		try {
			for(int i = 0; i < multiFileList.size(); i++) {
				File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				
				roomVO.setLogical_name(fileList.get(i).get("originFile"));
				roomVO.setPhysical_name(fileList.get(i).get("changeFile"));
				roomVO.setThumbnail("N");
				
				int value2 = rentalhomeService.insert_room_file(roomVO);
			}
			
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (Exception e) {
			System.out.println("다중 파일 업로드 실패");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) {
				new File(path + "\\" + fileList.get(i).get("changeFile")).delete();
			}
			e.printStackTrace();
		}
		
		return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+roomVO.getRentalhome_idx();
	}

	@RequestMapping(value="/rentalhomeDelete_room.do", method=RequestMethod.POST)
	public String rentalhomeDelete_room(Rentalhome_RoomVO roomVO){
		int value = rentalhomeService.delete_room(roomVO.getRoom_idx());
		rentalhomeService.update_review_status(roomVO.getRoom_idx());
		return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+roomVO.getRentalhome_idx();
	}
	
	@RequestMapping(value="/rentalhomeThumbnail.do", method=RequestMethod.POST)
	@ResponseBody
	public void rentalhomeThumbnail(RentalhomeVO rentalhomeVO){
		
		int value1 = rentalhomeService.init_attach_thumbmail(rentalhomeVO.getRentalhome_idx());
		
		int value2 = rentalhomeService.attach_thumbmail(rentalhomeVO.getAttach_idx());
		
		
	}

	@RequestMapping(value="/rentalhomeDelete_attach.do", method=RequestMethod.POST)
	@ResponseBody
	public void rentalhomeDelete_room_attach(int attach_idx){
		System.out.println("111");
		int value = rentalhomeService.delete_attach(attach_idx);
	}

	@RequestMapping(value="/insert_like.do", method=RequestMethod.POST)
	@ResponseBody
	public int insert_like(Rentalhome_LikeVO likeVO, HttpServletRequest req) {
		if(req.getSession().getAttribute("login") == null) {
			return -1;
		}
		
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		likeVO.setUno(loginVO.getuNo());
		if(rentalhomeService.dupl_like(likeVO) == 0) {
			rentalhomeService.insert_like(likeVO);
			System.out.println("좋아요 등록 성공");
			
			return rentalhomeService.select_like(likeVO.getRentalhome_idx());
		}else {
			System.out.println("좋아요 중복");
			return 0;
		}
	}

	@RequestMapping(value="/delete_like.do", method=RequestMethod.POST)
	@ResponseBody
	public int delete_like(Rentalhome_LikeVO likeVO, HttpServletRequest req) {
		if(req.getSession().getAttribute("login") == null) {
			return -1;
		}
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		likeVO.setUno(loginVO.getuNo());
		if(rentalhomeService.dupl_like(likeVO) > 0) {
			rentalhomeService.delete_like(likeVO);
			System.out.println("좋아요 취소");
			return rentalhomeService.select_like(likeVO.getRentalhome_idx());
		}else {
			System.out.println("좋아요를 누르지 않았습니다.");
			return 0;
		}
	}

	@RequestMapping(value="/room_thumbnail.do", method=RequestMethod.POST)
	@ResponseBody
	public void room_thumbnail(Rentalhome_RoomVO roomVO) {
		System.out.println("1: " + roomVO.getRoom_idx());
		System.out.println("2: " + roomVO.getAttach_idx());
		rentalhomeService.init_attach_room_thumbmail(roomVO.getRoom_idx()); // 썸네일 N
		rentalhomeService.room_attach_thumbmail(roomVO.getAttach_idx()); // 썸네일 등록
	}

	@RequestMapping(value="/room_attach_delete.do", method=RequestMethod.POST)
	@ResponseBody
	public void room_attach_delete(int attach_idx) {
		rentalhomeService.room_attach_delete(attach_idx); // 객실에 등록된 이미지 삭제
	}

	@RequestMapping(value="/rentalhome_room_attach_ByIdx.do")
	@ResponseBody
	public List<Rentalhome_RoomVO> rentalhome_room_attach_ByIdx(int room_idx) {
		List<Rentalhome_RoomVO> list = rentalhomeService.selectAll_room_attach_ByIdx(room_idx);
		return list;
	}
	
	@RequestMapping(value="/rentalhomeReserve.do", method=RequestMethod.GET)
	public String rentalhomeReserve(int room_idx, String name, Rentalhome_SearchVO searchVO, Model model){
		System.out.println(searchVO.toString());
		Rentalhome_RoomVO roomVO = rentalhomeService.selectOneByIdx_room(room_idx);
		model.addAttribute("roomVO", roomVO);
		// 숙소 이름
		model.addAttribute("name", name);
		model.addAttribute("searchVO", searchVO);
		
		return "rentalhome/rentalhomeReserve";
	}
	
	@RequestMapping(value="/rentalhome_review_write.do", method=RequestMethod.POST)
	@Transactional
	public String rentalhome_review_write(Rentalhome_ReviewVO reviewVO, String reserve_number){
		System.out.println(reviewVO.toString());
		System.out.println("reserve_number: "+ reserve_number);
		
		rentalhomeService.insert_review(reviewVO);
		
		rentalhomeService.update_pay_reviewYN(reserve_number);
		
		
		return "redirect:/rentalhome/rentalhomeReserveInfo.do?reserve_number="+reserve_number;
	}
	
	@RequestMapping(value="/iamport.do", method=RequestMethod.POST)
	@ResponseBody
	public void iamport(
			@RequestParam("imp_uid") String imp_uid,
			@RequestParam("merchant_uid") String merchant_uid
			) {
		System.out.println("imp_uid:" + imp_uid);
		System.out.println("merchant_uid:" + merchant_uid);
		System.out.println("컨트롤러 진입");
	}
	
	@RequestMapping(value = "iamport_verify/{imp_uid}.do", method = RequestMethod.POST)
	@ResponseBody
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
		System.out.println("imp_uid: " + imp_uid);
		return client.paymentByImpUid(imp_uid);
	}
	
	@RequestMapping(value ="complete.do", method = RequestMethod.POST)
	@ResponseBody
	public int paymentComplete(
		HttpSession session
		// @RequestBody JSON으로 전송된 데이터를	 JAVA객체로 변환
		,@RequestBody Rentalhome_PayVO rentalhome_payVO) throws Exception {
		System.out.println(rentalhome_payVO.toString());
		String token = payService.getToken();
	
		// 결제 완료된 금액
		String amount = payService.paymentInfo(rentalhome_payVO.getPay_idx(), token);
	
		int res = 1;
	
		System.out.println("rentalhome_payVO.getPrice(): "+rentalhome_payVO.getPrice());
		System.out.println("Long.parseLong(amount): "+Long.parseLong(amount));
		if (rentalhome_payVO.getPrice() != Long.parseLong(amount)) {
			res = 0;
			// 결제 취소
			payService.paymentCancel(token, rentalhome_payVO.getPay_idx(), amount);
			return res;
		}
		try{
			UserVO loginVO = (UserVO)session.getAttribute("login");
			rentalhome_payVO.setUno(loginVO.getuNo());
			rentalhomeService.insert_pay(rentalhome_payVO);
			rentalhomeService.update_point_minus(rentalhome_payVO);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println("결제 실패");
			res = 0;
		}
		return res;
		 
	}
	
	@RequestMapping(value="/rentalhomeReserveInfo.do", method=RequestMethod.GET)
	public String rentalhomeReserveInfo(String reserve_number, Model model){
		System.out.println("reserve_number: "+reserve_number);
		Rentalhome_PayVO payVO = rentalhomeService.selectOneByReserve_number(reserve_number);
		System.out.println(payVO.toString());
		model.addAttribute("payVO", payVO);
		
		Rentalhome_RoomVO roomVO = rentalhomeService.selectOneByIdx_room(payVO.getRoom_idx());
		model.addAttribute("roomVO", roomVO);
		return "rentalhome/rentalhomeReserveInfo";
	}

	@RequestMapping(value="/rentalhomeReserveList.do", method=RequestMethod.GET)
	public String rentalhomeReserveList(Model model, HttpServletRequest req){
		if(req.getSession().getAttribute("login") == null){
			 return "redirect:/User/userLogin.do";
		}
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		List<Rentalhome_PayVO> list = rentalhomeService.selectAll_reserve(loginVO.getuNo());
		for(int i=0; i <list.size(); i++) {
			list.get(i).setPay_date(list.get(i).getPay_date().split(" ")[0]);
		}
		
		model.addAttribute("list", list);
		return "rentalhome/rentalhomeReserveList";
	}

	@RequestMapping(value="/rentalhome_pay_cancel.do", method=RequestMethod.POST)
	@ResponseBody
	public boolean rentalhome_pay_cancel(@RequestParam("merchant_uid")String reserve_number) throws ParseException, IOException, Exception{
		
		Rentalhome_PayVO payVO = rentalhomeService.selectOneByReserve_number(reserve_number);
		
		// 현재 날짜 얻기
		LocalDateTime currentDate = LocalDateTime.now();
		// 원하는 형식으로 날짜 포맷팅
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formattedDate = currentDate.format(formatter);
		System.out.println("formattedDate: "+ formattedDate);
		System.out.println("payVO.getPay_status(): "+ payVO.getPay_status());
		// ㅑ오늘 날짜가 예약 시작일을 지났을 경우 또는 이미 환불을 받은 경우
		if( formattedDate.compareTo(payVO.getStart_date()) >= 0 || payVO.getPay_status() == "paid") {
			return false;
		}

		String token = payService.getToken();
		String amount = payService.paymentInfo(payVO.getPay_idx(), token);
		System.out.println("reserve_number: "+ reserve_number);
		
		payService.paymentCancel(token, payVO.getPay_idx(), amount);
		
		// LocalDateTime을 java.sql.Timestamp로 변환
		Timestamp timestamp = Timestamp.valueOf(currentDate);
		System.out.println("currentDate: " + currentDate);
		System.out.println("Timestamp: " + timestamp);
		
		payVO.setRefund_date(timestamp);
		payVO.setPay_status("refund");
		rentalhomeService.update_pay_refund(payVO);
		rentalhomeService.update_point_plus(payVO);

		return true;
	}
	@RequestMapping(value="rentalhome_review_delete.do", method=RequestMethod.POST)
	public String rentalhome_review_delete(int review_idx, int rentalhome_idx) {
		System.out.println("review_idx: " + review_idx);
		System.out.println("rentalhome_idx: " + rentalhome_idx);
		
		rentalhomeService.delete_review(review_idx);
		return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+rentalhome_idx;
	} 

	@RequestMapping(value="update_review.do", method=RequestMethod.POST)
	public String update_review(Rentalhome_ReviewVO reviewVO, int rentalhome_idx) {
		System.out.println(reviewVO.toString());
		System.out.println("rentalhome_idx" + rentalhome_idx);
		
		rentalhomeService.update_review(reviewVO);
		return "redirect:/rentalhome/rentalhomeView.do?rentalhome_idx="+rentalhome_idx;
	} 
	@RequestMapping(value="insert_review_report.do", method=RequestMethod.POST)
	@ResponseBody
	public void insert_review_report(Rentalhome_Review_ReportVO reportVO, HttpServletRequest req) {
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		reportVO.setuNo(loginVO.getuNo());
		System.out.println(reportVO.toString());
		
		rentalhomeService.insert_review_report(reportVO);
	}
	
	
}
