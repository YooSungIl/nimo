package kr.co.nimo.furniture.admin.impl;

import java.util.List;

import kr.co.nimo.furniture.admin.AdminFurnVO;
import kr.co.nimo.furniture.user.PageVO;

public interface AdminFurnDAO {
	public int getPage();
	public List<AdminFurnVO> getFurList(int pagenum);
	public AdminFurnVO getFurDetail(int num);
	public int getFurCode();
	public int getFurInsert(AdminFurnVO vo);
	public int getFurUpdate(AdminFurnVO vo);
	public int getFurDelete(int fur_code);
}
