package kr.co.nimo;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.nimo.admin.AdminShowRoomService;

@Controller
public class AdminShowRoomController {

	@Autowired
	private AdminShowRoomService adservice;
	
	@RequestMapping("admin/furnInfo.ni")
	public String furnInfo(FurnVO vo, Model model, String fur_image) {
		System.out.println(fur_image);
		vo.setFur_image(fur_image);
		
		model.addAttribute("furnInfo", adservice.getFurnInfo(vo));
		
		return "showRoomInsert";
	}
	
	@RequestMapping("/adShowRoom/showRoomInsert.ni")
	public String showRoomInsert() {
		return "adShowRoomInsert";
	}
	
	@RequestMapping("/adShowRoom/livingShowRoomList.ni")
	public String livingShowRoomList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", adservice.getAdminLivingShowRoomList(vo));
		
		return "adShowRoomList";
	}
	
	@RequestMapping("/adShowRoom/adShowRoomDetail.ni")
	public String showRoomDetail(ShowRoomVO showVO, FurnVO furnVO, Model model) {
		
		model.addAttribute("showRoomDetail_ShowRoom", adservice.getAdminShowRoomDetail_ShowRoom(showVO)); 
		model.addAttribute("showRoomDetail_Furs", adservice.getAdminShowRoomDetail_Furs(furnVO));
		
		return "adShowRoomDetail";
	}
	
	@RequestMapping("/adShowRoom/adFurnUpdate.ni")
	public String furnUpdate(ShowRoomVO showVO, FurnVO furnVO, Model model, HttpServletRequest request) {

		System.out.println(request.getParameter("show_name"));
		System.out.println(request.getParameter("furn_name"));
		System.out.println(Integer.parseInt(request.getParameter("furn_price")));
		System.out.println(request.getParameter("furn_detail"));
		System.out.println(request.getParameter("furn_img"));
		System.out.println(Integer.parseInt(request.getParameter("furn_quantity")));
		
		
		showVO.setShow_name(request.getParameter("show_name"));
		furnVO.setFur_name(request.getParameter("furn_name"));
		furnVO.setFur_image(request.getParameter("furn_img"));
		furnVO.setFur_price(Integer.parseInt(request.getParameter("furn_price")));
		furnVO.setFur_detail(request.getParameter("furn_detail"));
		furnVO.setFur_quantity(Integer.parseInt(request.getParameter("furn_quantity")));
		
		adservice.getAdminFurnUpdate(furnVO);
		
		String url = "/nimo/adShowRoom/adShowRoomDetail.ni?show_name="+showVO.getShow_name();
		
		return url;
	}
	
	@RequestMapping("/adShowRoom/adShowUpdate.ni")
	public String ShowUpdate(ShowRoomVO showVO, Model model, HttpServletRequest request) {

		System.out.println(request.getParameter("show_name"));
		System.out.println(request.getParameter("show_category"));
		System.out.println(request.getParameter("show_detail"));
		System.out.println(request.getParameter("show_img"));
		
		
		showVO.setShow_name(request.getParameter("show_name"));
		showVO.setShow_category(request.getParameter("show_category"));
		showVO.setShow_img(request.getParameter("show_img"));
		showVO.setShow_detail(request.getParameter("show_detail"));
		
		adservice.getAdminShowRoomUpdate(showVO);
		
		String url = "/nimo/adShowRoom/adShowRoomDetail.ni?show_name="+showVO.getShow_name();
		
		return url;
	}
	
	@RequestMapping("/adShowRoom/adShowRoomDelete.ni")
	public String showRoomDelete(ShowRoomVO vo) {
		System.out.println("OKOK");
		adservice.getAdminShowRoomDelete(vo);
		System.out.println("iasd");
		return "/nimo/adShowRoom/adShowRoomIndex.ni";
	}
	
	@RequestMapping("/adShowRoom/adShowRoomIndex.ni")
	public String ShowRoomIndex(ShowRoomVO showVO, Model model) {
		System.out.println("Index");
		
		model.addAttribute("bestShowRoom", adservice.getAdminShowRoomBest(showVO));
		model.addAttribute("recommendShowRoom", adservice.getAdminShowRoomRecommend(showVO));
		model.addAttribute("gaseongbiShowRoom", adservice.getAdminShowRoomGaseongbi(showVO));
		
		return "adShowRoomIndex";
	}
}
