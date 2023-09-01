package com.ss.demo.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.jdbc.Util;
import com.ss.demo.domain.FoodVO;
import com.ss.demo.domain.RentalhomeVO;
import com.ss.demo.domain.SearchVO;
import com.ss.demo.domain.UserVO;
import com.ss.demo.persistence.UserService_Mapper;

@Service("UserServiceImpl")
public class UserServiceImpl implements UserService {

	// 마이바티스에서 사용할 메소드 집합
	private UserService_Mapper usm;

	// 맵퍼 불러오기
	@Autowired
	public UserServiceImpl(SqlSession sqlSession) {
		this.usm = sqlSession.getMapper(UserService_Mapper.class);
	}

	// 유저 회원가입
	@Override
	public int userInsert(UserVO uv) {
		// TODO Auto-generated method stub

		int value = usm.userInsert(uv);
		System.out.println("user" + value);
		return value;
	}

	// 유저 로그인
	@Override
	public UserVO userlogin(UserVO uv) {

		uv = usm.userlogin(uv);
		System.out.println("sql" + uv);
		return uv;
	}

	// 유저 닉네임 중복체크
	@Override
	public int uNickCheck(String uNick) {
		int value = usm.uNickCheck(uNick);
		return value;
	}

	// 유저 id 중복체크
	@Override
	public int uIdCheck(String uId) {
		//
		int value = usm.uIdCheck(uId);
		return value;
	}

	@Override
	public UserVO uPwCheck(String uId) {
		UserVO uv = usm.uPwCheck(uId);
		return uv;
	}

	// 회원 정보 수정
	@Override
	public int UserModifyAction(UserVO uv) {
		int value = usm.UserModifyAction(uv);
		return value;
	}

	// 유저 조회
	@Override
	public UserVO userONE(UserVO uv) {
		uv = usm.userONE(uv);
		return uv;
	}

	// 유저 리스트
	@Override
	public List<UserVO> UserList(UserVO uv) {
		List<UserVO> UserList = usm.UserList(uv);
		return UserList;
	}

	// 파일 이름
	// 프로필 사진
	@Override
	public int profileimg(Map<String, Object> map) {
		MultipartFile profileimg = (MultipartFile) map.get("myprofileimg");
		String delete = (String) map.get("delete");
		File filepath = new File((String) map.get("webPath"));
		/*
		 * if(map.get("standfile") != null ) {
		 * System.out.println("map.get(\"standfile\")="+map.get("standfile"));
		 * MultipartFile standfile = (MultipartFile) map.get("standfile");
		 * 
		 * System.out.println("standfile=="+standfile); //File standfileppath = new
		 * File(standfile); //System.out.println("standfileppath="+standfileppath);
		 * 
		 * if(standfileppath.exists()) { System.out.println("파일 삭제"); filepath.delete();
		 * }
		 * 
		 * }
		 */
		System.out.println("filepath=" + filepath);
		// 파일 이름 변경

		String renameImage = null;
		String orgimgname = profileimg.getOriginalFilename();
		int ranNum = (int) (Math.random() * 10000);
		int idx = orgimgname.indexOf(".");
		String firststr = orgimgname.substring(0, idx);
		String str = "_" + String.format("%05d", ranNum);
		String ext = orgimgname.substring(orgimgname.lastIndexOf("."));
		String imgname = firststr + str + ext;
		System.out.println("file=" + profileimg);
		System.out.println("file==" + firststr);
		System.out.println("file===" + orgimgname);
		System.out.println("file====" + ext);
		System.out.println("file=====" + imgname);
		// 프로필 버튼 이벤트시 삭제나 변경이나 따라서
		if (delete.equals("0")) {
			renameImage = imgname.trim();
			System.out.println("myprofileimg=" + renameImage);
			System.out.println("myprofileimg=" + map.get("webPath"));
			map.put("myprofileimg", map.get("webPath") + renameImage);
		} else {
			System.out.println("myprofileimg=" + map.get("webPath"));
			map.put("myprofileimg", null);
		}
		// 수정 쿼리문
		System.out.println();

		int result = usm.profileimg(map);

		// 수정 성공시 메모리에 임시저장된 파일 서버에 저장
		if (result > 0 && map.get("myprofileimg") != null) {
			try {
				System.out.println("folderPath=" + map.get("folderPath"));
				System.out.println("transferTo=");
				filepath = new File((String) map.get("folderPath"));
				/*
				 * if(!filepath.exists()){
				 * 
				 * if(filepath.mkdirs()) { System.out.println("폴더 생성 성공"+filepath);
				 * System.out.println("폴더 생성 성공"+filepath);
				 * 
				 * }else { System.out.println("폴더 생성 실패"+filepath);
				 * System.out.println("폴더 생성 실패"+filepath); } }else{
				 * System.out.println("폴더가 이미 존재 "); System.out.println("폴더가 이미 존재 "+filepath);
				 * }
				 */
				profileimg.transferTo(new File(map.get("folderPath") + renameImage));
				System.out.println("profileimg=" + profileimg);
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		return result;
	}

	// 마이페이지 좋아요 리스트
	@Override
	public List<RentalhomeVO> selectAll_rentalhome_userlike(int uNo) {

		List<RentalhomeVO> result = usm.selectAll_rentalhome_userlike(uNo);
		System.out.println("result==" + result);
		return result;
	}

	// 전체 갯수
	@Override
	public int rentalhome_userlike(int uNo) {
		int rentalhome_userlike_total = usm.rentalhome_userlike(uNo);
		return rentalhome_userlike_total;
	}

	@Override
	public List<FoodVO> selectAll_food_userlike(int uNo) {
		List<FoodVO> result = usm.selectAll_food_userlike(uNo);
		System.out.println("result===" + result);
		return result;
	}

	@Override
	public List<UserVO> searchList(SearchVO searchVO) {
		List<UserVO> result = usm.searchList(searchVO);
		return result;
	}

	@Override
	public List<UserVO> seaUserList(String uType) {
		List<UserVO> result = usm.seaUserList(uType);
		return null;
	}

}
