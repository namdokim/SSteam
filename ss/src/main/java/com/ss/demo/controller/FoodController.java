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
import org.springframework.web.multipart.MultipartFile;

import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.service.FoodService;

@Controller
@RequestMapping(value="/food")
public class FoodController 
{
	//============================= @Autowired
	@Autowired
	private FoodService foodService;
	//============================= 
	
	
	
	
	
	// ===================================================================== food Main <List> (메인페이지) 
	@RequestMapping(value="/foodMain.do")
	public String foodMain(Model model ,SearchVO searchVO){
		
		String type = null;
		FoodVO vo = new FoodVO();
		vo.setLType(type);
		
		
		
		List<FoodVO> list = foodService.list(searchVO);
		model.addAttribute("list", list);
		return "food/foodMain";

	}
	
	
	
	// ===================================================================== food MainWrite (식당등록 페이지) 
	@RequestMapping(value="/foodMainWrite.do")
	public String foodMainWrite(){
		
		return "food/foodMainWrite";
	}
	
	
	
	
	// ===================================================================== food MenuWrite (메뉴등록 페이지) 
	@RequestMapping(value="/foodMenuWrite.do")
	public String foodMenuWrite(FoodVO vo ,Model model){
		
		model.addAttribute("vo",vo);
		return "food/foodMenuWrite"; 
	}
	

	
	
	// ===================================================================== food View (상세보기 페이지) 
	@RequestMapping(value="/foodView.do")
	public String foodView(int fNo,Model model){
		
		FoodVO vo = foodService.selectOneByFno(fNo);
		model.addAttribute("vo",vo);
		
		List<FoodVO> list = foodService.listMenu(fNo);
		model.addAttribute("list", list);
//		list.get(0);
//		System.out.println(list.get(0).getFood_menu_name());
		
		
		List<FoodVO> listAttach = foodService.selectListByFno(fNo);
		model.addAttribute("listAttach", listAttach);
		
		
		
		
		
		
		
		
		
		
		return "food/foodView";
	}
	
	
	
	// ===================================================================== food ReviewWrite (리뷰등록 페이지) 
	@RequestMapping(value="/foodReviewWrite.do")
	public String foodReviewWrite(){
		
		return "food/foodReviewWrite";
	}
	
	
	
	
	
	//====================================================================== => foodMainWrite,POST (식당 등록(+첨부파일) ,POST) 
	//========================================================================> 첨부파일에 대한 코드 작성 
	@RequestMapping(value="/foodMainWrite.do",method=RequestMethod.POST)
	public String foodMainWrite(
			FoodVO vo,
			@RequestParam("multiFile") List<MultipartFile> multiFileList,
			HttpServletRequest req) {
//		vo.setuNo(1);
		int value = foodService.insert(vo);
		
		// ------------------------------------------------------------------ => 지역 선택에 대한 코드 작성 
		//System.out.println("LType : " + foodVO.getLType());
		System.out.println(vo.toString());
		
//		HttpSession session = req.getSession();
//		int result = foodService.insert(vo);
//		
//		if (result > 0) 
//		{
//			System.out.println("등록 성공");
//		} else 
//		{
//			System.out.println("등록 실패");
//		}
		
		//------------------------------------------------------------------------v
		// 받아온것 출력 확인
		System.out.println("multiFileList : " + multiFileList);
		
		// path 가져오기
		// 윈도우
		String path = req.getSession().getServletContext().getRealPath("resources/upload");
		
		File file = new File(path);
		// 경로에 폴더가 없으면 폴더를 생성
		if(!file.exists()){
			file.mkdirs();
		}
		
		
		
		// List 타입인 fileList 변수를 선언하고 => 그 초기값으로 ArrayList를 할당함.
		// fileList는 Map 객체들을 요소로 갖는 List. 
		// fileList 변수에 새로운 ArrayList 객체를 생성하여 할당함. 
		// ArrayList란? 크기를 동적으로 변경할 수 있는 '배열'을 구현한 자료구조. 
		// 결론적으로, fileList에 Map 객체들을 추가하면서 데이터를 저장하고
		// 여러개의 Map 객체들을 관리하고 활용할 수 있음. -sj 
		List<Map<String, String>> fileList = new ArrayList<>();
		
		for(int i = 0; i < multiFileList.size(); i++) {
			String originFile = multiFileList.get(i).getOriginalFilename();
			String etc = originFile.substring(originFile.lastIndexOf("."));
			String changeFile = UUID.randomUUID().toString() + etc;
			
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
				// 윈도우 
				File uploadFile = new File(path + "\\" + fileList.get(i).get("changeFile"));
				
				// 맥 
//				File uploadFile = new File(path + "/" + fileList.get(i).get("changeFile"));
				multiFileList.get(i).transferTo(uploadFile);
				
				vo.setFood_attach_logical_name(fileList.get(i).get("originFile"));
				vo.setFood_attach_physical_name(fileList.get(i).get("changeFile"));
				
				if(flag) {
					vo.setThumbnail("Y");
					flag = false;
				}else {
					vo.setThumbnail("N");
				}
				System.out.println("foodVO 썸네일: " + vo.getThumbnail());
				int value2 = foodService.insert_file(vo);
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
		
//		return "redirect:/food/foodMain.do";
//	}
		

		
		return "redirect:foodView.do?fNo="+vo.getfNo();
	}
	//=========================================================================
	
	
	
	
	
	
	//====================================================================== foodMenuWrite,POST (메뉴 등록 , POST) 
	@RequestMapping(value="/foodMenuWrite.do",method=RequestMethod.POST)
	public String foodMenuWrite(FoodVO foodVO,HttpServletRequest req) {
		
		HttpSession session = req.getSession();

		int result = foodService.insertMenu(foodVO);
		System.out.println(foodVO.toString());
		
		return "redirect:foodView.do?fNo="+foodVO.getfNo();
	}
	
	
	
	//========================================================================
	@RequestMapping(value="/foodMainModify.do",method=RequestMethod.GET)
	public String modify(int fNo, Model model) {
		
		FoodVO vo = foodService.selectOneByFno(fNo);
		model.addAttribute("vo", vo);
		
		
		return "food/foodMainModify";
	}
	
	//======================================================================== 메인 수정. 
	@RequestMapping(value="/foodMainModify.do", method=RequestMethod.POST)
	public String modify(FoodVO foodVO) {
		
		System.out.println(foodVO.toString());
		int result = foodService.update(foodVO);
		
		if(result>0) {
			//수정 성공

			return "redirect:foodView.do?fNo="+foodVO.getfNo();
		}else {
			//수정실패

			return "redirect:foodMain.do";
			
		}
		
	}
	//==================================================================== delete.do
	@RequestMapping(value="/delete.do",method=RequestMethod.POST)
	public void delete(int fNo,HttpServletResponse res) throws IOException {
		
		
		int result = foodService.delete(fNo);
		
		res.setContentType("text/html;charset=UTF-8");
		PrintWriter pw = res.getWriter();
		
		if(result>0) {
			pw.append("<script>alert('삭제되었습니다.');location.href='foodMain.do';</script>");
		}else {
			pw.append("<script>alert('삭제되지 않았습니다.');location.href='foodMain.do';</script>");
		}
		
		pw.flush();
	}
}