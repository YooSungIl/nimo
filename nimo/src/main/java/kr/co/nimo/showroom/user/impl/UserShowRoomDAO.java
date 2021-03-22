package kr.co.nimo.showroom.user.impl;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.nimo.showroom.FurnVO;
import kr.co.nimo.showroom.ShowRoomVO;

@Repository
public class UserShowRoomDAO {

	@Autowired
	private SqlSessionTemplate mybatis;
	private String show_furs_code;
	private String[] codes;

	public List<ShowRoomVO> getUserLivingShowRoomList(ShowRoomVO vo) {
		return mybatis.selectList("showroom.userLivingShowRoomList", vo);
	}

	public List<ShowRoomVO> getUserBedRoomList(ShowRoomVO vo) {
		return mybatis.selectList("showroom.userBedRoomList", vo);
	}

	public List<ShowRoomVO> getUserLibraryList(ShowRoomVO vo) {
		return mybatis.selectList("showroom.userLibraryList", vo);
	}

	public List<ShowRoomVO> getUserKitchenList(ShowRoomVO vo) {
		return mybatis.selectList("showroom.userKitchenList", vo);
	}

	public List<ShowRoomVO> getUserBathRoomList(ShowRoomVO vo) {
		return mybatis.selectList("showroom.userBathRoomList", vo);
	}

	public List<ShowRoomVO> getUserOneRoomList(ShowRoomVO vo) {
		return mybatis.selectList("showroom.userOneRoomList", vo);
	}

	public ShowRoomVO getUserShowRoomDetail_ShowRoom(ShowRoomVO showVO) {
		ShowRoomVO srd = (ShowRoomVO) mybatis.selectOne("showroom.userShowRoomDetail_ShowRoom", showVO);
		show_furs_code = srd.getShow_furs_code();
		return srd;
	}

	public List<FurnVO> getUserShowRoomDetail_Furs(FurnVO fornVO) {
		codes = show_furs_code.split(",");

		int[] code = new int[codes.length];

		switch (codes.length) {
		case 1:
			code[0] = Integer.parseInt(codes[0]);
			break;
		case 2:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			break;
		case 3:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			break;
		case 4:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			break;
		case 5:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			code[4] = Integer.parseInt(codes[4]);
			break;
		case 6:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			code[4] = Integer.parseInt(codes[4]);
			code[5] = Integer.parseInt(codes[5]);
			break;
		case 7:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			code[4] = Integer.parseInt(codes[4]);
			code[5] = Integer.parseInt(codes[5]);
			code[6] = Integer.parseInt(codes[6]);
			break;
		case 8:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			code[4] = Integer.parseInt(codes[4]);
			code[5] = Integer.parseInt(codes[5]);
			code[6] = Integer.parseInt(codes[6]);
			code[7] = Integer.parseInt(codes[7]);
			break;
		case 9:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			code[4] = Integer.parseInt(codes[4]);
			code[5] = Integer.parseInt(codes[5]);
			code[6] = Integer.parseInt(codes[6]);
			code[7] = Integer.parseInt(codes[7]);
			code[8] = Integer.parseInt(codes[8]);
			break;
		case 10:
			code[0] = Integer.parseInt(codes[0]);
			code[1] = Integer.parseInt(codes[1]);
			code[2] = Integer.parseInt(codes[2]);
			code[3] = Integer.parseInt(codes[3]);
			code[4] = Integer.parseInt(codes[4]);
			code[5] = Integer.parseInt(codes[5]);
			code[6] = Integer.parseInt(codes[6]);
			code[7] = Integer.parseInt(codes[7]);
			code[8] = Integer.parseInt(codes[8]);
			code[9] = Integer.parseInt(codes[9]);
			break;
		}

		HashMap<String, Integer> servicemap = new HashMap<String, Integer>();
		List<FurnVO> furn = null;

		switch (code.length) {
		case 1:
			servicemap.put("code0", code[0]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs0", servicemap);
			break;
		case 2:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs1", servicemap);
			break;
		case 3:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs2", servicemap);
			break;
		case 4:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs3", servicemap);
			break;
		case 5:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			servicemap.put("code4", code[4]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs4", servicemap);
			break;
		case 6:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			servicemap.put("code4", code[4]);
			servicemap.put("code5", code[5]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs5", servicemap);
			break;
		case 7:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			servicemap.put("code4", code[4]);
			servicemap.put("code5", code[5]);
			servicemap.put("code6", code[6]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs6", servicemap);
			break;
		case 8:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			servicemap.put("code4", code[4]);
			servicemap.put("code5", code[5]);
			servicemap.put("code6", code[6]);
			servicemap.put("code7", code[7]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs7", servicemap);
			break;
		case 9:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			servicemap.put("code4", code[4]);
			servicemap.put("code5", code[5]);
			servicemap.put("code6", code[6]);
			servicemap.put("code7", code[7]);
			servicemap.put("code8", code[8]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs8", servicemap);
			break;
		case 10:
			servicemap.put("code0", code[0]);
			servicemap.put("code1", code[1]);
			servicemap.put("code2", code[2]);
			servicemap.put("code3", code[3]);
			servicemap.put("code4", code[4]);
			servicemap.put("code5", code[5]);
			servicemap.put("code6", code[6]);
			servicemap.put("code7", code[7]);
			servicemap.put("code8", code[8]);
			servicemap.put("code9", code[9]);
			furn = mybatis.selectList("showroom.userShowRoomDetail_Furs9", servicemap);
			break;
		}

		return furn;

	}
	
	public List<ShowRoomVO> getUserShowRoomBest(ShowRoomVO vo) {
		return mybatis.selectList("showroom.ShowRoomBest", vo);
	}
	
	public List<ShowRoomVO> getUserShowRoomRecommend(ShowRoomVO vo) {
		return mybatis.selectList("showroom.ShowRoomRecommend", vo);
	}
	
	public List<ShowRoomVO> getUserShowRoomGaseongbi(ShowRoomVO vo) {
		return mybatis.selectList("showroom.ShowRoomGaseongbi", vo);
	}
}
