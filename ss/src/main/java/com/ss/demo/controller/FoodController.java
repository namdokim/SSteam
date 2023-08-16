package com.ss.demo.controller;

import java.io.File;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ss.demo.domain.Criteria;
import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.Food_LikeVO;
import com.ss.demo.domain.PageMaker;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.Rentalhome_LikeVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.domain.UserVO;
import com.ss.demo.service.FoodService;

@Controller
@RequestMapping(value="/food")
public class FoodController 
{
	@Autowired
	private FoodService foodService;
	@Autowired
	private PageMaker pageMaker;
	
	// ======================================================================================== [1] 맛집 메인 페이지 
	
	
	
	// [1] 메인 페이지 -> 맛집 List, 페이징
	@RequestMapping(value="/foodMain.do")
	public String foodMain(Model model ,SearchVO searchVO, HttpServletRequest request)
	{
		if( request.getSession().getAttribute("login") != null) {
			UserVO loginVO = (UserVO) request.getSession().getAttribute("login");
			searchVO.setuNo(loginVO.getuNo());
		}
		
		String type = null;
		FoodVO vo = new FoodVO();
		vo.setLType(type);
		
		List<FoodVO> list = foodService.list(searchVO);
		model.addAttribute("list", list);
		
		int totalCount = foodService.select_food_count();
		pageMaker.setCri(searchVO);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker.toString());
		model.addAttribute("pageMaker", pageMaker);

		return "food/foodMain";
	}
	
	// [1] 메인 페이지 -> 식당 등록 
	@RequestMapping(value="/foodMainWrite.do")
	public String foodMainWrite() { return "food/foodMainWrite"; }

	// [1] 메인 페이지 -> 식당 첨부 파일 등록 
	@RequestMapping(value="/foodMainWrite.do",method=RequestMethod.POST)
	public String foodMainWrite( FoodVO vo, @RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest req) 
	{
		// vo.setuNo(1);
		int value = foodService.insert(vo);
		System.out.println(vo.toString());
		System.out.println("multiFileList : " + multiFileList);	// 받아온 것 출력 확인
		
		// path 가져오기 (윈도우)
		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		File file = new File(path);
		if(!file.exists()){ file.mkdirs(); }	// 경로에 폴더가 없으면 폴더를 생성
		
		// List 타입인 fileList 변수를 선언하고 => 그 초기값으로 ArrayList를 할당함.
		// fileList는 Map 객체들을 요소로 갖는 List. 
		// fileList 변수에 새로운 ArrayList 객체를 생성하여 할당함. 
		// ArrayList란? 크기를 동적으로 변경할 수 있는 '배열'을 구현한 자료구조. 
		// 결론적으로, fileList에 Map 객체들을 추가하면서 데이터를 저장하고
		// 여러개의 Map 객체들을 관리하고 활용할 수 있음. 
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) 
		{
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + etc;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		System.out.println("fileList: " + fileList);
		
		// 파일업로드
		boolean flag = true;	
		
		try 
		{
			for(int i = 0; i < multiFileList.size(); i++) 
			{
				//File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));	//윈도우 
				//File uploadFile = new File(path + "/" + fileList.get(i).get("changeFile"));		//맥	
				File uploadFile = new File(path + File.separator + fileList.get(i).get("changeFile"));

				multiFileList.get(i).transferTo(uploadFile);
				
				vo.setFood_attach_logical_name(fileList.get(i).get("originFile"));
				vo.setFood_attach_physical_name(fileList.get(i).get("changeFile"));
				
				if(flag) { vo.setThumbnail("Y"); flag = false; }
				else	 { vo.setThumbnail("N"); }
				
				System.out.println("foodVO 썸네일: " + vo.getThumbnail());
				int value2 = foodService.insert_file(vo);
			}
			System.out.println("다중 파일 업로드 성공!");
			
			
		} catch (Exception e) 
		{	
			System.out.println("다중 파일 업로드 실패");
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) 
			{
				//new File(path + "\\" + fileList.get(i).get("changeFile")).delete();	//윈도
				new File(path + File.separator + fileList.get(i).get("changeFile")).delete();
			}
			e.printStackTrace();
		}
		return "redirect:/food/foodView.do?fNo="+vo.getfNo();
	}
	
	// [1] 메인 페이지 -> [GET] 메인 수정
	@RequestMapping(value="/foodMainModify.do",method=RequestMethod.GET)
	public String modify(int fNo, Model model) 
	{
		FoodVO vo = foodService.selectOneByFno(fNo);
		model.addAttribute("vo", vo);
		
		List<FoodVO> list_food_attach = foodService.selectAll_food_attach(fNo);
		model.addAttribute("attach", list_food_attach);
		
		return "food/foodMainModify";
	}
	
	// [1] 메인 페이지 -> [POST] 메인 수정 
	@RequestMapping(value="/foodMainModify.do", method=RequestMethod.POST)
	public String modify( FoodVO foodVO, @RequestParam("multiFile") List<MultipartFile> multiFileList, HttpServletRequest request)
	{
		//System.out.println(foodVO.toString());
		int result = foodService.update(foodVO);
		System.out.println("multiFileList : " + multiFileList);	// 받아온것 출력 확인
		
		// path 가져오기
		String path = request.getSession().getServletContext().getRealPath("resources/upload");
		File file = new File(path);
		if(!file.exists()){ file.mkdirs(); } // 경로에 폴더가 없으면 폴더를 생성
		
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) 
		{
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + etc;
			
			Map<String, String> map = new HashMap<>();
			map.put("originFile", originFile);
			map.put("changeFile", changeFile);
			
			fileList.add(map);
		}
		System.out.println("fileList: " + fileList);

		// 파일업로드
		try 
		{
			for(int i = 0; i < multiFileList.size(); i++) 
			{
				//File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));	//윈도우 	
				//File uploadFile = new File(path + "/" + fileList.get(i).get("changeFile"));	//맥 
				File uploadFile = new File(path + File.separator + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				
				foodVO.setFood_attach_logical_name(fileList.get(i).get("originFile"));
				foodVO.setFood_attach_physical_name(fileList.get(i).get("changeFile"));
				foodVO.setThumbnail("N");
				
				System.out.println("foodVO 썸네일: " + foodVO.getThumbnail());
				
				if( multiFileList.size() > 0 ) { 
					int value2 = foodService.insert_file(foodVO); 
				}
			}
			System.out.println("다중 파일 업로드 성공!");
			
		} catch (Exception e) 
		{
			System.out.println("다중 파일 업로드 실패");
			
			// 만약 업로드 실패하면 파일 삭제
			for(int i = 0; i < multiFileList.size(); i++) 
			{ new File(path + File.separator + fileList.get(i).get("changeFile")).delete(); }
			e.printStackTrace();
		}
		return "redirect:foodView.do?fNo="+foodVO.getfNo();
	}
	
	// [1] 메인 페이지 -> 글 삭제 
		@RequestMapping(value="/delete.do",method=RequestMethod.POST)
		public void delete(int fNo,HttpServletResponse res) throws IOException 
		{
			int result = foodService.delete(fNo);
			
			res.setContentType("text/html;charset=UTF-8");
			PrintWriter pw = res.getWriter();
			
			if(result>0) { pw.append("<script>alert('삭제되었습니다.');location.href='foodMain.do';</script>"); }
			else { pw.append("<script>alert('삭제되지 않았습니다.');location.href='foodMain.do';</script>"); }

			pw.flush();
		}
		
		
		
		
		
	// ======================================================================================== [2] 맛집 뷰 페이지 
	
	// [2] 뷰 페이지 -> 식당 상세 화면 
	@RequestMapping(value="/foodView.do")
	public String foodView(int fNo,Model model ,Food_LikeVO likeVO, HttpServletRequest req)
//	public String foodView(int fNo,Model model ,Food_LikeVO likeVO, HttpServletRequest req)
	{
		FoodVO vo = foodService.selectOneByFno(fNo);
		model.addAttribute("vo",vo);
		
		List<FoodVO> list = foodService.listMenu(fNo);
		model.addAttribute("list", list);
		
		List<FoodVO> listAttach = foodService.selectListByFno(fNo);
		model.addAttribute("listAttach", listAttach);

		List<FoodReviewVO> listReview = foodService.list();
		model.addAttribute("listReview", listReview);
		
//		int like_count = foodService.select_like(fNo);
//		System.out.println("like_count: "+like_count);
//		model.addAttribute("like_count", like_count);
//		
		if (req.getSession().getAttribute("login") != null) {
	        UserVO loginVO = (UserVO) req.getSession().getAttribute("login");
	        likeVO.setuNo(loginVO.getuNo());
	        int like_dupl = foodService.dupl_like(likeVO);
	        model.addAttribute("like_dupl", like_dupl);
		}else {
			int like_dupl = -1;
			model.addAttribute("like_dupl", like_dupl);
		}
//		
		return "food/foodView";
	}
	
	// [2] 뷰 페이지 -> [GET] 메뉴 등록 
	@RequestMapping(value="/foodMenuWrite.do")
	public String foodMenuWrite(FoodVO vo ,Model model)
	{
		model.addAttribute("vo",vo);
		return "food/foodMenuWrite"; 
	}
		
	
	// [2] 뷰 페이지 -> [POST] 메뉴 등록
	@RequestMapping(value="/foodMenuWrite.do",method=RequestMethod.POST)
	public String foodMenuWrite(FoodVO foodVO,HttpServletRequest req) 
	{
		HttpSession session = req.getSession();
		int result = foodService.insertMenu(foodVO);
		System.out.println(foodVO.toString());
		return "redirect:foodView.do?fNo="+foodVO.getfNo();
	}
	
	
	// [2] 뷰 페이지 -> 첨부 파일 모달창 (썸네일 변경,첨부 파일 삭제) 
	@RequestMapping(value="/foodThumbnail.do", method=RequestMethod.POST)
	public String foodThumbnail(FoodVO foodVO)
	{
		try{ int value1 = foodService.init_attach_thumbmail(foodVO.getfNo()); }
		catch(Exception e) { e.printStackTrace(); }
		
		int value2 = foodService.attach_thumbmail(foodVO.getFood_attach_number());

		return "redirect:/food/foodView.do?fNo="+foodVO.getfNo();
	}

	// [2] 뷰 페이지 -> 첨부 파일 사진 삭제  
	@RequestMapping(value="/foodDelete_attach.do", method=RequestMethod.POST)
	public String foodDelete_room_attach(int food_attach_number, int fNo)
	{
		int value = foodService.delete_attach(food_attach_number);
		
		return "redirect:/food/foodView.do?fNo="+fNo;
	}
	
	// [2] 뷰 페이지 -> 좋아요 기능 구현 
	@RequestMapping(value="/insert_like.do")
	@ResponseBody
	public int insert_like(Food_LikeVO likeVO, HttpServletRequest req) {
		if ( req.getSession().getAttribute("login")== null) {
			return 0;
		}
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		likeVO.setuNo(loginVO.getuNo());
		if(foodService.dupl_like(likeVO) == 0) {
			foodService.insert_like(likeVO);
			System.out.println("좋아요 등록 성공");
			return 1;
		}else {
			System.out.println("좋아요 중복");
			return 0;
		}
	}

	@RequestMapping(value="/delete_like.do")
	@ResponseBody
	public int delete_like(Food_LikeVO likeVO, HttpServletRequest req) {
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		likeVO.setuNo(loginVO.getuNo());
		if(foodService.dupl_like(likeVO) > 0) {
			foodService.delete_like(likeVO);
			System.out.println("좋아요 취소");
			return foodService.select_like(likeVO.getfNo());
		}else {
			System.out.println("좋아요를 누르지 않았습니다.");
			return 0;
		}
	}
	
	
	// ======================================================================================== [3] 맛집 리뷰 페이지 
	
	// [3] 뷰 페이지 (리뷰) -> 리뷰 등록 -> Ajax  
	@RequestMapping(value="/insert_foodreview.do")
	@ResponseBody
	public FoodReviewVO insert_foodreview(FoodReviewVO foodreviewVO,HttpServletRequest req) 
	{
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		foodreviewVO.setuNo(loginVO.getuNo()); 
		
		foodService.insert(foodreviewVO);
		FoodReviewVO foodreviewVO2 = foodService.selectOneByFRno(foodreviewVO.getFood_review_number());
		
		System.out.println(foodreviewVO.toString());
		return foodreviewVO2;
	}
	
	// [3] 뷰 페이지 -> 리뷰 -> 글 삭제   
	@RequestMapping(value="/foodReviewDelete.do" ,method=RequestMethod.POST)
	public String foodReviewDelete(int food_review_number, int fNo)
	{
		int value = foodService.delete_foodreview(food_review_number);
		return "redirect:/food/foodView.do?fNo="+fNo;
	}
		
	// [3] 뷰 페이지 -> 리뷰 -> 글 수정 
	@RequestMapping(value="/foodReviewModify.do" ,method=RequestMethod.POST)
	@ResponseBody 
	public void foodReviewModify(FoodReviewVO foodreviewVO)
	{
		System.out.println(foodreviewVO.toString());
		int value = foodService.modify_foodreview(foodreviewVO);
	}
}