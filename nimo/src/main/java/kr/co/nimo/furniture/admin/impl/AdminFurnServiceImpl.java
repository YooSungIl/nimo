package kr.co.nimo.furniture.admin.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nimo.furniture.admin.AdminFurnService;
import kr.co.nimo.furniture.admin.AdminFurnVO;
import kr.co.nimo.furniture.user.PageVO;



@Service
public class AdminFurnServiceImpl implements AdminFurnService{
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public PageVO getPage(int pagenum) {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		PageVO page = new PageVO();
		int fur = dao.getPage();
		int startpage = (int)(pagenum / 5.01) * 5 + 1;
		int endpage = startpage + 4;
		int maxpage = (int)(fur / 12.01) + 1;
		if (maxpage < endpage) {
			endpage = maxpage;
		}
		page.setStartpage(startpage);
		page.setEndpage(endpage);
	
		return page;
	}
	@Override
	public List<AdminFurnVO> getFurList(int pagenum) {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		pagenum = (pagenum -1) * 12;
		List<AdminFurnVO> list = dao.getFurList(pagenum);
		return list;
	}
	@Override
	public AdminFurnVO getFurDetail(int num) {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		AdminFurnVO detail = dao.getFurDetail(num);
		return detail;
	}
	@Override
	public int getFurCode() {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		int fur_code = dao.getFurCode() + 1;
		return fur_code;
	}
	@Override
	public int getFurInsert(AdminFurnVO vo) {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		int check = dao.getFurInsert(vo);
		return check;
	}
	@Override
	public int getFurUpdate(AdminFurnVO vo) {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		int check = dao.getFurUpdate(vo);
		return check;
	}
	@Override
	public int getFurDelete(int num) {
		AdminFurnDAO dao = sqlSessionTemplate.getMapper(AdminFurnDAO.class);
		int check = dao.getFurDelete(num);
		return check;
	}
}
