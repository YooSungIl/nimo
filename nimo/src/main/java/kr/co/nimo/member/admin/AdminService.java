package kr.co.nimo.member.admin;

import java.util.List;

import kr.co.nimo.member.paging.SearchCriteria;
import kr.co.nimo.member.user.UserVO;

public interface AdminService {
	
	public List<UserVO> getUserList(SearchCriteria scri);
	
	public List<UserVO> getNUserList(SearchCriteria scri);
	
	public int getUserCount(SearchCriteria scri);
	
	public int getNUserCount(SearchCriteria scri);
	
	public int getAdminUserCount();
	
	public void adminUserYes(String id); // 비활성화 유저 활성화 시키기. update
	
	public void adminUserNo(String id);

	public void adminUserDeleteListUp(String id);	// 유저목록에서 유저삭제 후 리스트업
	
	public int adminUserDeleteDetail(UserVO userVO); // 유저상세에서 유저삭제(ajax) 후 목록으로
	
	public void adminUserInsert(UserVO userVO);

}
