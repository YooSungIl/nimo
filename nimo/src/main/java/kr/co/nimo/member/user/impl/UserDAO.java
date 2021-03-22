package kr.co.nimo.member.user.impl;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.nimo.member.user.UserVO;

@Repository
public class UserDAO{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public UserVO checkUser(String id) {
		System.out.println("DAO");
		return sqlSessionTemplate.selectOne("UserDAO.checkUser", id);
	}
	
	public int joinUser(UserVO vo) {
		System.out.println(vo.getName());
		return sqlSessionTemplate.insert("UserDAO.joinUser", vo);
	}
	
//	플랫폼에 따른 가입문
//	public int joinUserByPlatform(UserVO vo) {
//		System.out.println(vo.getName());
//		return sqlSessionTemplate.insert("UserDAO.joinUserByPlatform", vo);
//	}
	
	public int checkJoin(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.checkJoin", id);
	}
	
	public UserVO checkJoinByPlatform(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.checkJoinByPlatForm", id);
	}
	
	public int searchPwd(UserVO vo) {
		return sqlSessionTemplate.selectOne("UserDAO.searchPwd", vo);
	}
	
	public int newPwd(UserVO vo) {
		return sqlSessionTemplate.update("UserDAO.newPwd", vo);
	}
	
//	public UserVO loginByGoogle(UserVO vo) {
//		return sqlSessionTemplate.selectOne("UserDAO.newPwd", vo);
//	}
	
	public UserVO getUser(String id) {
		return sqlSessionTemplate.selectOne("UserDAO.getUser", id);
	}
	
	public void updateUser(UserVO userVO) {
		sqlSessionTemplate.selectOne("UserDAO.updateUser", userVO);
	}
	
	public int updateUserPassword(UserVO userVO) {
		return sqlSessionTemplate.update("UserDAO.updateUserPassword", userVO);
	}
	
	public int userDelete(UserVO userVO) {
		return sqlSessionTemplate.update("UserDAO.userDelete", userVO);
	}
}