package kr.co.nimo.furniture.user.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nimo.furniture.user.PageVO;
import kr.co.nimo.furniture.user.SearchVO;
import kr.co.nimo.furniture.user.UserFurnService;
import kr.co.nimo.furniture.user.UserFurnVO;


@Service
public class UserFurnServiceImpl implements UserFurnService {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public PageVO getPage(int pagenum, String search) {
		UserFurnDAO dao = sqlSessionTemplate.getMapper(UserFurnDAO.class);
		PageVO page = new PageVO();
		SearchVO vo = new SearchVO();
		vo.setPagenum(pagenum);
		vo.setSearch(search);
		int fur = dao.getPage(vo);
		int startpage = (int)(pagenum / 5.1) * 5 + 1;
		int endpage = startpage + 4;
		int maxpage = ((int) fur / 12) + 1;
		if (maxpage < endpage) {
			endpage = maxpage;
		}
		page.setStartpage(startpage);
		page.setEndpage(endpage);
	
		return page;
	}
	
	@Override
	public List<UserFurnVO> getFurList(int pagenum, String search) {
		UserFurnDAO dao = sqlSessionTemplate.getMapper(UserFurnDAO.class);
		pagenum = (pagenum -1) * 12;
		SearchVO vo = new SearchVO();
		vo.setPagenum(pagenum);
		vo.setSearch(search);
		List<UserFurnVO> list = dao.getFurList(vo);
		
		
		return list;
	}
	@Override
	public List<UserFurnVO> getFurList2(int pagenum, String search) {
		UserFurnDAO dao = sqlSessionTemplate.getMapper(UserFurnDAO.class);
		pagenum = (pagenum -1) * 12;
		SearchVO vo = new SearchVO();
		vo.setPagenum(pagenum);
		vo.setSearch(search);
		List<UserFurnVO> list = dao.getFurList2(vo);
		
		return list;
	}
	@Override
	public List<UserFurnVO> getFurListBed() {
		UserFurnDAO dao = sqlSessionTemplate.getMapper(UserFurnDAO.class);
		List<UserFurnVO> list = dao.getFurListBed();
		return list;
	}
	
	@Override
	public UserFurnVO getFurDetail(int num) {
		UserFurnDAO dao = sqlSessionTemplate.getMapper(UserFurnDAO.class);
		UserFurnVO detail = dao.getFurDetail(num);
		return detail;
	}
}
