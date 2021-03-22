package kr.co.nimo.member.user.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nimo.member.user.UserService;
import kr.co.nimo.member.user.UserVO;


@Service("userService")
public class UserServiceImpl implements UserService {
	
	@Autowired
	private UserDAO userDAO;

	public void setUserDAO(UserDAO userDAO) {
		this.userDAO = userDAO;
	}
	
	// 로그인
	@Override
	public UserVO checkUser(String id) {
		System.out.println("Service");
		return userDAO.checkUser(id);
	}
	
	// 회원가입
	@Override
	public int joinUser(UserVO vo) {
		System.out.println(vo.getName());
		return userDAO.joinUser(vo);
	}
	
//	플랫폼에 따른 가입문
//	@Override
//	public int joinUserByPlatform(UserVO vo) {
//		System.out.println(vo.getName());
//		return userDAO.joinUserByPlatform(vo);
//	}
	
	// 아이디 중복 확인
	@Override
	public int checkJoin(String id) {
		return userDAO.checkJoin(id);
	}
	
	@Override
	public UserVO checkJoinByPlatform(String id) {
		return userDAO.checkJoinByPlatform(id);
	}
	
	// 비밀번호 찾기
	@Override
	public int searchPwd(UserVO vo) {
		return userDAO.searchPwd(vo);
	}
	
	@Override
	public int newPwd(UserVO vo) {
		return userDAO.newPwd(vo);
	}
	
	// 사용자와 관리자
	@Override
	public UserVO getUser(String id) {
		return userDAO.getUser(id);
	}
	
	// 사용자와 관리자
	@Override
	public void updateUser(UserVO userVO) {
		userDAO.updateUser(userVO);
	}
	
	// 사용자와 관리자
	@Override
	public int updateUserPassword(UserVO userVO) {
		return userDAO.updateUserPassword(userVO);
	}
	
	@Override
	public int userDelete(UserVO userVO) {
		return userDAO.userDelete(userVO);
	}
	
//	//구글 회원가입
//	@Override
//	public void joinByGoogle(UserVO vo) {
//		userDAO.joinUser(vo);
//	}
//
//	//구글 로그인
//	@Override
//	public UserVO loginByGoogle(UserVO vo) {
//		UserVO returnVO = null;
//		try {
////			returnVO = userDAO.loginByGoogle(vo);
//			System.out.println("S: 로그인 아디: "+vo.getId()+" 비번: "+vo.getPwd()+" 이름: "+vo.getName());
//		} catch (Exception e) {
//			e.printStackTrace();
//			returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
//		}
//		return returnVO;
//	}
}