package kr.co.nimo.furniture.user;

import java.util.List;

public interface UserFurnService {
	public PageVO getPage(int pagenum, String serach);
	public List<UserFurnVO> getFurList(int pagenum, String search);
	public List<UserFurnVO> getFurList2(int pagenum, String search);
	public List<UserFurnVO> getFurListBed();
	public UserFurnVO getFurDetail(int num);
}
