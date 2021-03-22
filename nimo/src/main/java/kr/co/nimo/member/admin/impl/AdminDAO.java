package kr.co.nimo.member.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.nimo.member.paging.SearchCriteria;
import kr.co.nimo.member.user.UserVO;

@Repository
public class AdminDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	public List<UserVO> getUserList(SearchCriteria scri) {
		return sqlSessionTemplate.selectList("AdminDAO.getUserList", scri);
	}
	
	public List<UserVO> getNUserList(SearchCriteria scri) {
		return sqlSessionTemplate.selectList("AdminDAO.getNUserList", scri);
	}
	
	public int getUserCount(SearchCriteria scri) {
		return sqlSessionTemplate.selectOne("AdminDAO.getUserCount", scri);
	}
	
	public int getNUserCount(SearchCriteria scri) {
		return sqlSessionTemplate.selectOne("AdminDAO.getNUserCount", scri);
	}
	
	public int getAdminUserCount() {
		return sqlSessionTemplate.selectOne("AdminDAO.getAdminUserCount");
	}
	
	public void adminUserYes(String id) {
		sqlSessionTemplate.selectOne("AdminDAO.adminUserYes", id);
	}
	
	public void adminUserNo(String id) {
		sqlSessionTemplate.selectOne("AdminDAO.adminUserNo", id);
	}
	
	public void adminUserDeleteListUp(String id) {
		sqlSessionTemplate.selectOne("AdminDAO.adminUserDeleteListUp", id);
	}
	
	public int adminUserDeleteDetail(UserVO userVO) {
		return sqlSessionTemplate.update("AdminDAO.adminUserDeleteDetail", userVO);
	}

	public void adminUserInsert(UserVO userVO) {
		sqlSessionTemplate.selectOne("AdminDAO.adminUserInsert", userVO);
	}

}
