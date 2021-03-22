package kr.co.nimo.showroom.user;

import java.util.List;

import kr.co.nimo.showroom.FurnVO;
import kr.co.nimo.showroom.ShowRoomVO;

public interface UserShowRoomService {
	List<ShowRoomVO> getUserLivingShowRoomList(ShowRoomVO vo);
	List<ShowRoomVO> getUserBedRoomList(ShowRoomVO vo);
	List<ShowRoomVO> getUserLibraryList(ShowRoomVO vo);
	List<ShowRoomVO> getUserKitchenList(ShowRoomVO vo);
	List<ShowRoomVO> getUserBathRoomList(ShowRoomVO vo);
	List<ShowRoomVO> getUserOneRoomList(ShowRoomVO vo);
	
	ShowRoomVO getUserShowRoomDetail_ShowRoom(ShowRoomVO showVO);
	List<FurnVO> getUserShowRoomDetail_Furs(FurnVO fornVO);
	
	List<ShowRoomVO> getUserShowRoomBest(ShowRoomVO vo);
	List<ShowRoomVO> getUserShowRoomRecommend(ShowRoomVO vo);
	List<ShowRoomVO> getUserShowRoomGaseongbi(ShowRoomVO vo);
}
