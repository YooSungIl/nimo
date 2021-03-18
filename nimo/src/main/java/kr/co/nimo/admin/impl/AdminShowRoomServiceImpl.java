package kr.co.nimo.admin.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nimo.FurnVO;
import kr.co.nimo.ShowRoomVO;
import kr.co.nimo.admin.AdminShowRoomService;

@Service("AdminShowRoomService")
public class AdminShowRoomServiceImpl implements AdminShowRoomService {

	@Autowired
	private AdminShowRoomDAO addao;
	
	@Override
	public FurnVO getFurnInfo(FurnVO vo) {
		return addao.getFurnInfo(vo);
	}

	@Override
	public List<ShowRoomVO> getAdminLivingShowRoomList(ShowRoomVO vo) {
		return addao.getAdminLivingShowRoomList(vo);
	}

	@Override
	public ShowRoomVO getAdminShowRoomDetail_ShowRoom(ShowRoomVO showVO) {
		
		return addao.getAdminShowRoomDetail_ShowRoom(showVO);
	}

	@Override
	public List<FurnVO> getAdminShowRoomDetail_Furs(FurnVO furnVO) {
		
		return addao.getAdminShowRoomDetail_Furs(furnVO);
	}

	@Override
	public int getAdminShowRoomUpdate(ShowRoomVO showVO) {

		return addao.getAdminShowRoomUpdate(showVO);
	}

	@Override
	public int getAdminFurnUpdate(FurnVO furnVO) {
		
		return addao.getAdminFurnUpdate(furnVO);
	}

	@Override
	public int getAdminShowRoomDelete(ShowRoomVO vo) {
		System.out.println("okokokok");
		return addao.getAdminShowRoomDelete(vo);
	}

	@Override
	public List<ShowRoomVO> getAdminShowRoomBest(ShowRoomVO vo) {
		
		return addao.getAdminShowRoomBest(vo);
	}

	@Override
	public List<ShowRoomVO> getAdminShowRoomRecommend(ShowRoomVO vo) {

		return addao.getAdminShowRoomRecommend(vo);
	}

	@Override
	public List<ShowRoomVO> getAdminShowRoomGaseongbi(ShowRoomVO vo) {

		return addao.getAdminShowRoomGaseongbi(vo);
	}

}
