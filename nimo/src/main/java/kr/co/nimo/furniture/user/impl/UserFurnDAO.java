package kr.co.nimo.furniture.user.impl;

import java.util.List;

import kr.co.nimo.furniture.user.SearchVO;
import kr.co.nimo.furniture.user.UserFurnVO;

public interface UserFurnDAO {
	public int getPage(SearchVO vo);
	public List<UserFurnVO> getFurList(SearchVO vo);
	public List<UserFurnVO> getFurList2(SearchVO vo);
	public List<UserFurnVO> getFurListBed();
	public UserFurnVO getFurDetail(int num);
}
