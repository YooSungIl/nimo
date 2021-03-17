package kr.co.nimo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nimo.user.UserShowRoomService;

@Controller
public class ShowRoomController {

	@Autowired
	private UserShowRoomService service;
	
	@RequestMapping("/showRoom/livingShowRoomList.ni")
	public String livingShowRoomList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", service.getUserLivingShowRoomList(vo));
		
		return "showRoomList";
	}
	@RequestMapping("/showRoom/bedRoomList.ni")
	public String bedroomList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", service.getUserBedRoomList(vo));
		
		return "showRoomList";
	}
	
	@RequestMapping("/showRoom/libraryList.ni")
	public String libraryList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", service.getUserLibraryList(vo));
		
		return "showRoomList";
	}
	@RequestMapping("/showRoom/kitchenList.ni")
	public String kitchenList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", service.getUserKitchenList(vo));
		
		return "showRoomList";
	}
	@RequestMapping("/showRoom/bathRoomList.ni")
	public String bathroomList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", service.getUserBathRoomList(vo));
		
		return "showRoomList";
	}
	@RequestMapping("/showRoom/oneRoomList.ni")
	public String oneroomList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", service.getUserOneRoomList(vo));
		
		return "showRoomList";
	}
	@RequestMapping("/showRoom/showRoomDetail.ni")
	public String showRoomDetail(ShowRoomVO showVO, FurnVO fornVO, Model model) {
		
		model.addAttribute("showRoomDetail_ShowRoom", service.getUserShowRoomDetail_ShowRoom(showVO)); 
		model.addAttribute("showRoomDetail_Furs", service.getUserShowRoomDetail_Furs(fornVO));
		
		return "showRoomDetail";
	}
	@RequestMapping("/showRoom/showRoomIndex.ni")
	public String ShowRoomIndex(ShowRoomVO showVO, Model model) {
		
		model.addAttribute("bestShowRoom", service.getUserShowRoomBest(showVO));
		model.addAttribute("recommendShowRoom", service.getUserShowRoomRecommend(showVO));
		model.addAttribute("gaseongbiShowRoom", service.getUserShowRoomGaseongbi(showVO));
		
		return "showRoomIndex";
	}
}
 	