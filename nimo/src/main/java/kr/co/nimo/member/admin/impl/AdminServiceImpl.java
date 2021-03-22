package kr.co.nimo.member.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nimo.member.admin.AdminService;
import kr.co.nimo.member.paging.SearchCriteria;
import kr.co.nimo.member.user.UserVO;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public List<UserVO> getUserList(SearchCriteria scri) {
		return adminDAO.getUserList(scri);
	}
	
	@Override
	public List<UserVO> getNUserList(SearchCriteria scri) {
		return adminDAO.getNUserList(scri);
	}
	
	@Override
	public int getUserCount(SearchCriteria scri) {
		int userCount = adminDAO.getUserCount(scri);
		return userCount;
	}
	
	@Override
	public int getNUserCount(SearchCriteria scri) {
		int userCount = adminDAO.getNUserCount(scri);
		return userCount;
	}
	
	@Override
	public int getAdminUserCount() {
		int adminUserCount = adminDAO.getAdminUserCount();
		return adminUserCount;
	}
	
	@Override
	public void adminUserYes(String id) {
		adminDAO.adminUserYes(id);
	}
	
	@Override
	public void adminUserNo(String id) {
		adminDAO.adminUserNo(id);
	}
	
	@Override
	public void adminUserDeleteListUp(String id) {
		adminDAO.adminUserDeleteListUp(id);
	}
	
	@Override
	public int adminUserDeleteDetail(UserVO userVO) {
		return adminDAO.adminUserDeleteDetail(userVO);
	}
	
	@Override
	public void adminUserInsert(UserVO userVO) {
		adminDAO.adminUserInsert(userVO);
	}

}
