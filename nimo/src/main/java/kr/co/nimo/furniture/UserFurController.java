package kr.co.nimo.furniture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;


import kr.co.nimo.furniture.user.UserFurnService;

@Controller
@RequestMapping(value = "/fur/nimo/")
public class UserFurController {

		@Autowired
		private UserFurnService userFur;
		
		@RequestMapping(value = "furList")
		public String furList(Model model, @RequestParam(defaultValue = "1") int pagenum,
				@RequestParam(defaultValue = "1") int price, @RequestParam(defaultValue = "") String search ) {
			model.addAttribute("page", userFur.getPage(pagenum,search));
			model.addAttribute("pagenum", pagenum);
			model.addAttribute("price", price);
			model.addAttribute("search", search);
			if (price == 1) {
				model.addAttribute("list", userFur.getFurList(pagenum,search));
				return "/fur/furList";
				
			} else {
				model.addAttribute("list", userFur.getFurList2(pagenum,search));
				return "/fur/furList";
			}
		}
		
		@RequestMapping(value = "furListBed")
		public String furListBed(Model model) {
			model.addAttribute("list", userFur.getFurListBed());
			return "/fur/furListBed";
		}
		
		@RequestMapping(value = "furDetail")
		public String furDetail(Model model,  @RequestParam int fur_code) {
			model.addAttribute("detail", userFur.getFurDetail(fur_code));
			return "/fur/furDetail";
		}
		

}
