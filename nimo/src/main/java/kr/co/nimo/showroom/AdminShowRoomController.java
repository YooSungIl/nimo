package kr.co.nimo.showroom;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nimo.showroom.admin.AdminShowRoomService;

@Controller
public class AdminShowRoomController {

	@Autowired
	private AdminShowRoomService adservice;
	private String codes = "";
	
	
	@RequestMapping(value = "/adShowRoom/furnInfo.ni", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, Object> furnInfo(FurnVO vo, Model model, String fur_image) {
		HashMap<String, Object> result = new HashMap<String, Object>();
		
		vo.setFur_image(fur_image);
		
		result.put("data", adservice.getFurnInfo(vo));

		int furnCode = adservice.getFurnInfo(vo).getFur_code();
		codes = codes + furnCode + "," ;
		
		return result;
	}
	
	@RequestMapping("/adShowRoom/showRoomappend.ni")
	public String showRoomAppend() {
		return "/show/adShowRoomInsert";
	}
	
	@RequestMapping(value="/adShowRoom/showRoomInsert.ni", method = RequestMethod.POST)
	public String showRoomInsert(ShowRoomVO vo, HttpServletRequest req) {
		

		codes = codes.substring(0, codes.length()-1);

		vo.setShow_furs_code(codes);
		vo.setShow_name(req.getParameter("show_name"));
		vo.setShow_category(req.getParameter("show_category"));
		vo.setShow_detail(req.getParameter("show_detail"));
		
		adservice.setShowInsert(vo);
		codes = "";
		
		return "/nimo/adShowRoom/livingShowRoomList.ni";
	}
	
	@RequestMapping("/adShowRoom/livingShowRoomList.ni")
	public String livingShowRoomList(ShowRoomVO vo, Model model) {
		
		model.addAttribute("showRoomList", adservice.getAdminLivingShowRoomList(vo));
		
		return "/show/adShowRoomList";
	}
	
	@RequestMapping("/adShowRoom/adShowRoomDetail.ni")
	public String showRoomDetail(ShowRoomVO showVO, FurnVO furnVO, Model model) {
		
		model.addAttribute("showRoomDetail_ShowRoom", adservice.getAdminShowRoomDetail_ShowRoom(showVO)); 
		model.addAttribute("showRoomDetail_Furs", adservice.getAdminShowRoomDetail_Furs(furnVO));
		
		return "/show/adShowRoomDetail";
	}
	
	@RequestMapping("/adShowRoom/adFurnUpdate.ni")
	public void furnUpdate(ShowRoomVO showVO, FurnVO furnVO, Model model, HttpServletRequest request) {

		showVO.setShow_name(request.getParameter("show_name"));
		furnVO.setFur_name(request.getParameter("furn_name"));
		furnVO.setFur_image(request.getParameter("furn_img"));
		furnVO.setFur_price(Integer.parseInt(request.getParameter("furn_price")));
		furnVO.setFur_subdetail1_1(request.getParameter("furn_detail"));
		furnVO.setFur_quantity(Integer.parseInt(request.getParameter("furn_quantity")));
		
		adservice.getAdminFurnUpdate(furnVO);
		
	}
	
	@RequestMapping("/adShowRoom/adShowUpdate.ni")
	public void ShowUpdate(ShowRoomVO showVO, Model model, HttpServletRequest request) {
		
		showVO.setShow_name(request.getParameter("show_name"));
		showVO.setShow_category(request.getParameter("show_category"));
		showVO.setShow_img(request.getParameter("show_img"));
		showVO.setShow_detail(request.getParameter("show_detail"));
		
		adservice.getAdminShowRoomUpdate(showVO);
	}
	
	@RequestMapping("/adShowRoom/adShowRoomDelete.ni")
	public String showRoomDelete(ShowRoomVO vo) {
		adservice.getAdminShowRoomDelete(vo);
		return "/nimo/adShowRoom/adShowRoomIndex.ni";
	}
	
	@RequestMapping("/adShowRoom/adShowRoomIndex.ni")
	public String ShowRoomIndex(ShowRoomVO showVO, Model model) {

		model.addAttribute("bestShowRoom", adservice.getAdminShowRoomBest(showVO));
		model.addAttribute("recommendShowRoom", adservice.getAdminShowRoomRecommend(showVO));
		model.addAttribute("gaseongbiShowRoom", adservice.getAdminShowRoomGaseongbi(showVO));
		
		return "/show/adShowRoomIndex";
	}
}
