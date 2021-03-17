package kr.co.nimo.user.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.nimo.FurnVO;
import kr.co.nimo.ShowRoomVO;
import kr.co.nimo.user.UserShowRoomService;

@Service("UserShowRoomService")
public class UserShowRoomServiceImpl implements UserShowRoomService {
	@Autowired
	private UserShowRoomDAO dao;

	@Override
	public List<ShowRoomVO> getUserLivingShowRoomList(ShowRoomVO vo) {

		return dao.getUserLivingShowRoomList(vo);
	}

	@Override
	public List<ShowRoomVO> getUserBedRoomList(ShowRoomVO vo) {

		return dao.getUserBedRoomList(vo);

	}

	@Override
	public List<ShowRoomVO> getUserLibraryList(ShowRoomVO vo) {

		return dao.getUserLibraryList(vo);

	}

	@Override
	public List<ShowRoomVO> getUserKitchenList(ShowRoomVO vo) {

		return dao.getUserKitchenList(vo);

	}

	@Override
	public List<ShowRoomVO> getUserBathRoomList(ShowRoomVO vo) {

		return dao.getUserBathRoomList(vo);

	}

	@Override
	public List<ShowRoomVO> getUserOneRoomList(ShowRoomVO vo) {

		return dao.getUserOneRoomList(vo);

	}

	@Override
	public ShowRoomVO getUserShowRoomDetail_ShowRoom(ShowRoomVO showVO) {
		return dao.getUserShowRoomDetail_ShowRoom(showVO);
	}
	@Override
	public List<FurnVO> getUserShowRoomDetail_Furs(FurnVO fornVO) {
		return dao.getUserShowRoomDetail_Furs(fornVO);
	}

	@Override
	public List<ShowRoomVO> getUserShowRoomBest(ShowRoomVO vo) {
		
		return dao.getUserShowRoomBest(vo);
	}

	@Override
	public List<ShowRoomVO> getUserShowRoomRecommend(ShowRoomVO vo) {
		
		return dao.getUserShowRoomRecommend(vo);
	}

	@Override
	public List<ShowRoomVO> getUserShowRoomGaseongbi(ShowRoomVO vo) {
		
		return dao.getUserShowRoomGaseongbi(vo);
	}

	

}
