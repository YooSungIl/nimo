package kr.co.nimo.member;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nimo.member.admin.AdminService;
import kr.co.nimo.member.authentication.AuthSMS;
import kr.co.nimo.member.paging.PageMaker;
import kr.co.nimo.member.paging.SearchCriteria;
import kr.co.nimo.member.user.UserService;
import kr.co.nimo.member.user.UserVO;

@Controller
public class AdminController {

	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@Autowired
	private UserDetailsService securityService;

	@Autowired
	private AuthSMS authSMS;

	// 관리자

	//		관리자 -> 관리자
	// 1. 관리자 로그인 요청
	@RequestMapping(value = "/kwanLogin", method=RequestMethod.GET)
	public String KwanLogin(HttpServletRequest req) {
		if (!req.getHeader("Referer").equals("http://localhost:8088/nimo/kwanLogin")) {
			String referer = req.getHeader("Referer");
			req.getSession().setAttribute("prevPage", referer);
			System.out.println(referer);
		}
		return "kwanLogin";
	}
	
	@ResponseBody
	@RequestMapping(value = "/kwanLogin", method=RequestMethod.POST)
	public String KwanLoginCheck(@RequestBody Map<String,String> json, HttpServletResponse resp) throws IOException{

		int result = userService.checkJoin(json.get("id"));
		UserVO vo = userService.checkUser(json.get("id"));
		if (result == 0) {
			return String.valueOf(-1);
		} else {
			if (vo.getRole().equals("ROLE_USER") || vo.getId() == null) {
				return String.valueOf(-1);
			} else {
				if (json.get("pwd").equals(vo.getPwd())) {
					return String.valueOf(1);
				} else {
					return String.valueOf(0);
				}
			}
		}
	}
	
	// 1. 관리자 인덱스 요청
		@RequestMapping(value = "/nimoKwan")
		public String adminIndex() {
			return "/mem/adminIndex";
		}

	// . 관리자 추가폼 요청
	@RequestMapping(value = "/adminInsertForm")
	public String adminInsertForm(@ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("user");
		return "/mem/adminInsertForm";
	}

	// . 관리자 유저 추가 완료 요청
	@RequestMapping(value = "/adminInsertSuccess")
	public String adminInsertSuccess(UserVO userVO, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		adminService.adminUserInsert(userVO);
		model.addAttribute("user");
		model.addAttribute("userList", adminService.getUserList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);


		return "mem/adminUserList";
	}
	// 1. 유저 전체 리스트
	@RequestMapping(value = "/adminUserList", method= RequestMethod.GET)
	public String adminUserList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("userList", adminService.getUserList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserList";
	}

	// 1-2. 비활성화 유저 전체 리스트
	@RequestMapping(value = "/adminNUserList", method= RequestMethod.GET)
	public String adminNUserList(Model model, @ModelAttribute("scri") SearchCriteria scri) {
		model.addAttribute("userList", adminService.getNUserList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getNUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserList";
	}

	// 1-3. 비활성화  -> 유저 활성화 후 리스트업
	@RequestMapping(value = "/adminUserYes", method= RequestMethod.GET)
	public String adminUserYes(@ModelAttribute("scri") SearchCriteria scri, @RequestParam("id") String id, Model model) {
		adminService.adminUserYes(id);
		model.addAttribute("userList", adminService.getUserList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserList";
	}

	// 1-4. 활성화  -> 유저 비활성화 후 리스트업
	@RequestMapping(value = "/adminUserNo", method= RequestMethod.GET)
	public String adminUserNo(@ModelAttribute("scri") SearchCriteria scri, @RequestParam("id") String id, Model model) {
		adminService.adminUserNo(id);
		model.addAttribute("userList", adminService.getNUserList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getNUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserList";
	}

	// 2. 유저 선택시 상세페이지
	@RequestMapping(value = "/adminUserDetail", method= RequestMethod.GET)
	public String adminUserDetail(String id, @ModelAttribute("scri") SearchCriteria scri, Model model) {

		UserVO userVO = userService.getUser(id);
		model.addAttribute("user", userVO);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserDetail";
	}

	// 3. 유저 수정폼 요청
	@RequestMapping(value = "/adminUserUpdateForm")
	public String adminUserUpdateForm(String id, @ModelAttribute("scri") SearchCriteria scri, Model model) {

		UserVO userVO = userService.getUser(id);
		model.addAttribute("user", userVO);

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserUpdateForm";
	}

	// 4. 수정폼 완료 요청
	@RequestMapping(value = "/adminUserUpdateSuccess")
	public String adminUserUpdateSuccess(@RequestParam("id") String id, @ModelAttribute("scri") SearchCriteria scri, Model model, UserVO userVO) {
		userService.updateUser(userVO);
		model.addAttribute("user", userService.getUser(id));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserDetail";
	}

	// 5. 비밀번호 변경 페이지 요청
	@RequestMapping(value = "/adminUserResetPassword")
	public String adminUserResetPassword(String id, @ModelAttribute("scri") SearchCriteria scri, Model model) {
		model.addAttribute("user", userService.getUser(id));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserResetPassword";
	}

	// 6. 비밀번호 변경 : POST방식 (Ajax로 처리) 
	@ResponseBody
	@RequestMapping(value = "/adminUserResetPasswordSuccess", method = RequestMethod.POST)
	public String adminUserResetPasswordSuccess(@RequestBody UserVO jsonData) {
		System.out.println(jsonData.getId());
		System.out.println(jsonData.getPwd());

		return String.valueOf(userService.updateUserPassword(jsonData));
	}

	// 7-1. 관리자 -> 유저 삭제 : POST방식 (Ajax로 처리) 
	@ResponseBody
	@RequestMapping(value = "/adminUserDeleteDetail", method = RequestMethod.POST) 
	public String adminUserDeleteDetail(@RequestBody UserVO jsonData) { 
		System.out.println(jsonData.getId());
		System.out.println(jsonData.getPwd());

		return String.valueOf(adminService.adminUserDeleteDetail(jsonData));
	}

	// 7-2. 관리자 -> 유저 삭제 후 리스트업
	@RequestMapping("/adminUserDeleteList") 
	public String adminUserDeleteListUp(String id, @ModelAttribute("scri") SearchCriteria scri, Model model) { 
		adminService.adminUserDeleteListUp(id); 
		model.addAttribute("user");
		model.addAttribute("userList", adminService.getUserList(scri));

		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(adminService.getUserCount(scri));

		model.addAttribute("pageMaker", pageMaker);

		return "/mem/adminUserList"; 
	}

}