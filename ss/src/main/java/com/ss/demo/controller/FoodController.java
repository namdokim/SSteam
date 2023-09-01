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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ss.demo.domain.FoodReviewVO;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.Food_LikeVO;
import com.ss.demo.domain.Food_ReportVO;
import com.ss.demo.domain.Food_Review_ReportVO;
import com.ss.demo.domain.PageMaker;
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
		
		// -> 메인화면에서 평점을 소수점 첫째자리까지 [형변환]!!! ***  
		List<FoodVO> list = foodService.selectAll(searchVO);
		for (int i =0; i<list.size(); i++) {
				double avg = Math.round(list.get(i).getAvg() * 10.0) / 10.0;
				list.get(i).setAvg(avg);
		}
		model.addAttribute("list", list);
		
		int totalCount = foodService.select_food_count();
		pageMaker.setCri(searchVO);
		pageMaker.setTotalCount(totalCount);
		System.out.println(pageMaker.toString());
		model.addAttribute("pageMaker", pageMaker);
		model.addAttribute("searchVO",searchVO);
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

		if( multiFileList.get(0).isEmpty() )
		{
			return "redirect:/food/foodView.do?fNo="+vo.getfNo();	
		}
		
		System.out.println("multiFileList : " + multiFileList);	// 받아온 것 출력 확인
// 식당 첨부파일 시작 		
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
// 식당 첨부파일 끝 			
	
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

		if( multiFileList.get(0).isEmpty() )
		{
			return "redirect:/food/foodMain.do?fNo="+foodVO.getfNo();	
		}
		
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
	public String foodView(int fNo,Model model ,Food_LikeVO likeVO, HttpServletRequest req, FoodReviewVO foodreviewVO)
	{
		FoodVO vo = foodService.selectOneByFno(fNo);
		model.addAttribute("vo",vo);
		
		List<FoodVO> list = foodService.selectAllMenu(fNo);
		model.addAttribute("list", list);
		
		List<FoodVO> listAttach = foodService.selectListByFno(fNo);
		model.addAttribute("listAttach", listAttach);

		List<FoodReviewVO> listReview = foodService.list(fNo);
		model.addAttribute("listReview", listReview);

		double roundedGrade = 0;
		try{
			double avgReview = foodService.selectAvg_foodreview(fNo);
			roundedGrade = Math.round(avgReview * 10.0) / 10.0;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		// 1. 전체 리뷰 개수  
		foodreviewVO.setCount_all(foodService.selectAllCount_foodreview(fNo));		
		
		// 2. 5점에 대한 리뷰 개수 
		
		foodreviewVO.setFood_review_grade(5);
		foodreviewVO.setCount_good(foodService.selectCount_foodreview(foodreviewVO));	
		
		// 3. 3점에 대한 리뷰 개수 
		foodreviewVO.setFood_review_grade(3);
		foodreviewVO.setCount_soso(foodService.selectCount_foodreview(foodreviewVO));

		// 4. 1점에 대한 리뷰 개수 
		foodreviewVO.setFood_review_grade(1);
		foodreviewVO.setCount_bad(foodService.selectCount_foodreview(foodreviewVO));
		
		// 5. 좋아요 개수 
		int countLike= foodService.select_like(fNo);
		
		// 6. 조회수 증가  
		foodService.increment_hit(fNo);
		
		model.addAttribute("roundedGrade",roundedGrade);
		model.addAttribute("countLike",countLike);
		model.addAttribute("foodreviewVO",foodreviewVO);
		
		if (req.getSession().getAttribute("login") != null) {
	        UserVO loginVO = (UserVO) req.getSession().getAttribute("login");
	        likeVO.setuNo(loginVO.getuNo());
	        int like_dupl = foodService.dupl_like(likeVO);
	        model.addAttribute("like_dupl", like_dupl);
		}else {
			int like_dupl = -1;
			model.addAttribute("like_dupl", like_dupl);
		}
		
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
	public String foodMenuWrite(FoodVO foodVO) 
	{
		System.out.println(foodVO.toString());
		
		foodVO.getFood_menu_name();
		foodVO.getFood_menu_price();
		System.out.println(foodVO.getFood_menu_name());
		System.out.println(foodVO.getFood_menu_price());
		
		String[] nameSplit = foodVO.getFood_menu_name().split(",");
		String[] priceSplit = foodVO.getFood_menu_price().split(",");
		for(int i =0; i<nameSplit.length; i++) {
			System.out.println(nameSplit[i]);
			System.out.println(priceSplit[i]);
			
			foodVO.setFood_menu_name(nameSplit[i]);
			foodVO.setFood_menu_price(priceSplit[i]);
		
			int value = foodService.insertMenu(foodVO);
		}
		

		
//		String str = foodVO.toString();
//		System.out.println(str);
//		String[] strSplit = str.split(",");
		
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
			return foodService.select_like(likeVO.getfNo());
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
	
	@RequestMapping(value="/delete_menu.do", method=RequestMethod.POST)
	@ResponseBody
	public void delete_menu(int food_menu_number) {
		int value = foodService.delete_menu(food_menu_number);
	}
	
	// 식당 신고
	@RequestMapping(value="/insert_report.do")
	@ResponseBody
	public void insert_report(Food_ReportVO food_reportVO, HttpServletRequest req ) {
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		food_reportVO.setuNo(loginVO.getuNo());
		System.out.println(food_reportVO.toString());
		int value = foodService.insert_report(food_reportVO);
	}

	// 리뷰 신고
	@RequestMapping(value="/insert_review_report.do")
	@ResponseBody
	public void insert_reveiw_report(Food_Review_ReportVO food_review_reportVO ,HttpServletRequest req ) {
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		food_review_reportVO.setuNo(loginVO.getuNo());
		int value = foodService.insert_review_report(food_review_reportVO);
	}
	
	// ======================================================================================== [3] 맛집 리뷰 페이지 
	
	// [3] 뷰 페이지 (리뷰) -> 리뷰 등록 -> Ajax  
	@RequestMapping(value="/insert_foodreview.do")
	@ResponseBody
	public FoodReviewVO insert_foodreview(FoodReviewVO foodreviewVO,HttpServletRequest req) 
	{
		UserVO loginVO = (UserVO)req.getSession().getAttribute("login");
		// -> 이걸 하는 이유는 foodreviewVO에 uNo 없으니까 , setuNo 를 통해서 세팅을 하는데,
		// -> loginVO.getuNo()를 통해서 가져온다. (-> int형)
		// -> loginVO 변수는 UserVO 타입인데, 세션에서 값을 가져올 때 타입을 맞추기 위해 
		// -> (UserVO)로 강제 형변환을 해준다. 
		// -> 매개변수에 HttpServletRequest req 를 받아서, req를 써서, .getSession() 메소드를 호출해서 
		// -> 세션을 가져오고, 세션의 getAttribute를 통해 키값이 "login"인 정보를 가져와서 loginVO에 저장. 
		foodreviewVO.setuNo(loginVO.getuNo()); 
		
		System.out.println(foodreviewVO.getFood_review_number());
		foodService.insert(foodreviewVO);
		FoodReviewVO foodreviewVO2 = foodService.selectOneByFRno(foodreviewVO.getFood_review_number());
		
		System.out.println(foodreviewVO2.toString());
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
	public FoodReviewVO foodReviewModify(FoodReviewVO foodreviewVO)
	{
		System.out.println(foodreviewVO.toString());
		int value = foodService.modify_foodreview(foodreviewVO);
		foodreviewVO = foodService.selectOneByFRno(foodreviewVO.getFood_review_number());
		double avg_ = foodService.selectAvg_foodreview(foodreviewVO.getfNo());
		double avg = Math.round(avg_ * 10.0) / 10.0;
		foodreviewVO.setAvg(avg);
		System.out.println(":::"+foodreviewVO.getAvg());
		// 1. 전체 리뷰 개수  
		foodreviewVO.setCount_all(foodService.selectAllCount_foodreview(foodreviewVO.getfNo()));		
				
		// 2. 5점에 대한 리뷰 개수 
		foodreviewVO.setFood_review_grade(5);
		foodreviewVO.setCount_good(foodService.selectCount_foodreview(foodreviewVO));	
		
		// 3. 3점에 대한 리뷰 개수 
		foodreviewVO.setFood_review_grade(3);
		foodreviewVO.setCount_soso(foodService.selectCount_foodreview(foodreviewVO));

		// 4. 1점에 대한 리뷰 개수 
		foodreviewVO.setFood_review_grade(1);
		foodreviewVO.setCount_bad(foodService.selectCount_foodreview(foodreviewVO));
		return foodreviewVO;
	}
	
	
	
}