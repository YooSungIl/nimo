package kr.co.nimo.furniture.admin;

import java.util.List;

import kr.co.nimo.furniture.admin.AdminFurnVO;
import kr.co.nimo.furniture.user.PageVO;

public interface AdminFurnService {
	public PageVO getPage(int pagenum);
	public List<AdminFurnVO> getFurList(int pagenum);
	public AdminFurnVO getFurDetail(int num);
	public int getFurCode();
	public int getFurInsert(AdminFurnVO vo);
	public int getFurUpdate(AdminFurnVO vo);
	public int getFurDelete(int num);
}
