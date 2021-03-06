package kr.co.nimo.showroom.admin;

import java.util.List;

import kr.co.nimo.showroom.FurnVO;
import kr.co.nimo.showroom.ShowRoomVO;

public interface AdminShowRoomService {
	FurnVO getFurnInfo(FurnVO vo);
	List<ShowRoomVO> getAdminLivingShowRoomList(ShowRoomVO vo);
	
	ShowRoomVO getAdminShowRoomDetail_ShowRoom(ShowRoomVO showVO);
	List<FurnVO> getAdminShowRoomDetail_Furs(FurnVO furnVO);
	
	int getAdminShowRoomUpdate(ShowRoomVO showVO);
	int getAdminFurnUpdate(FurnVO furnVO);
	int getAdminShowRoomDelete(ShowRoomVO vo);
	
	List<ShowRoomVO> getAdminShowRoomBest(ShowRoomVO vo);
	List<ShowRoomVO> getAdminShowRoomRecommend(ShowRoomVO vo);
	List<ShowRoomVO> getAdminShowRoomGaseongbi(ShowRoomVO vo);
	
	int setShowInsert(ShowRoomVO vo);
	
	
}
