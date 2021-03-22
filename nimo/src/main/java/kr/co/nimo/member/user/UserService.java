package kr.co.nimo.member.user;

import java.util.List;

import kr.co.nimo.member.paging.SearchCriteria;

public interface UserService {
	
	public UserVO checkUser(String id);
	
	public int checkJoin(String id);
	
	public UserVO checkJoinByPlatform(String id);
	
	public int joinUser(UserVO vo);
	
//	public int joinUserByPlatform(UserVO vo);
	
	public int searchPwd(UserVO vo);
	
	public int newPwd(UserVO vo);
	
	//사용자와 관리자
	public UserVO getUser(String id);
	
	//사용자와 관리자
	public void updateUser(UserVO userVO);
	
	//사용자와 관리자
	public int updateUserPassword(UserVO userVO);
	
	public int userDelete(UserVO userVO); // Delete(X) 활성화->비활성화로 바꿔주는 update

}