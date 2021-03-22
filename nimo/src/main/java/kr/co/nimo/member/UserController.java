package kr.co.nimo.member;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.nimo.member.admin.AdminService;
import kr.co.nimo.member.authentication.AuthSMS;
import kr.co.nimo.member.user.UserService;
import kr.co.nimo.member.user.UserVO;
import kr.co.nimo.showroom.ShowRoomVO;
import kr.co.nimo.showroom.user.UserShowRoomService;

@Controller
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(UserController.class);

	@Autowired
	private UserService userService;
	
	@Autowired
	private AdminService adminService;

	@Autowired
	private BCryptPasswordEncoder pwdEncoder;

	@Autowired
	private UserDetailsService securityService;

	@Autowired
	private UserShowRoomService showRoomService;
	
	@Autowired
	private AuthSMS authSMS;

	@RequestMapping(value = "/login")
	public String login(HttpServletRequest req) {
		System.out.println("controller");
		if (req.getHeader("Referer") != null) {
			if (!req.getHeader("Referer").equals("http://localhost:8088/nimo/login")) {
				String referer = req.getHeader("Referer");
				req.getSession().setAttribute("prevPage", referer);
			}
		}
		return "login";
	}
	
	@RequestMapping(value = "/login_callback")
	public String loginCallback() {
		
		return "login_callback";
	}

	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "join";
	}

	@ResponseBody
	@RequestMapping(value = "/checkJoin", method = RequestMethod.POST)
	public String checkJoin(HttpServletRequest req) {

		int result = userService.checkJoin(req.getParameter("id"));
		System.out.println("아이디 중복" + result);

		return String.valueOf(result);
	}

	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(HttpServletRequest req, UserVO vo) {

		vo.setAddress(req.getParameter("address_postcode") + " " + req.getParameter("address_road") + " "
				+ req.getParameter("address_detail") + " " + req.getParameter("address_extra"));

		vo.setPwd(pwdEncoder.encode(vo.getPwd()));
		vo.setPlatform("nimo");

		userService.joinUser(vo);

		return "redirect:/";
	}

	@ResponseBody
	@RequestMapping(value = "/socialLoginNJoin", method = RequestMethod.POST)
	public Map<String, String> socialLoginNJoin(HttpSession session, HttpServletRequest req, UserVO vo) {

		Map<String, String> resultMap = new HashMap<String, String>();
		int result = userService.checkJoin(req.getParameter("email"));

		if (result == 0) {
			vo.setId(req.getParameter("email"));
			vo.setPwd(pwdEncoder.encode(req.getParameter("check_id")));
			vo.setName(req.getParameter("nickname"));
			vo.setAddress("");
			vo.setPhone(req.getParameter("phone_number"));
			vo.setPlatform(req.getParameter("account_type"));

			userService.joinUser(vo);

			UserDetails userDetail = 
					securityService.loadUserByUsername(vo.getId());

			Authentication authentication = 
					new UsernamePasswordAuthenticationToken(userDetail, userDetail.getPassword(), userDetail.getAuthorities());

			//			userDetail 정보 확인
			//			System.out.println(userDetail.getPassword()+ " " + userDetail.getAuthorities());
			SecurityContext securityContext = SecurityContextHolder.getContext();
			securityContext.setAuthentication(authentication);
			session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);

			resultMap.put("result", "success_join");

			return resultMap;

		} else if (result == 1) {
			UserVO resultVO = userService.checkJoinByPlatform(req.getParameter("email"));

			if (req.getParameter("account_type").equals(resultVO.getPlatform())) {

				UserDetails userDetail = 
						securityService.loadUserByUsername(req.getParameter("email"));

				Authentication authentication = 
						new UsernamePasswordAuthenticationToken(userDetail, userDetail.getPassword(), userDetail.getAuthorities());

				SecurityContext securityContext = SecurityContextHolder.getContext();
				securityContext.setAuthentication(authentication);
				session.setAttribute("SPRING_SECURITY_CONTEXT", securityContext);

				resultMap.put("result", "success_login");

				return resultMap;
			} else {
				if (resultVO.getPlatform().equals("nimo")) {
					resultMap.put("result", "fail_nimo");
					return resultMap;
				} else if (resultVO.getPlatform().equals("kakao")) {
					resultMap.put("result", "fail_kakao");
					return resultMap;
				} else if (resultVO.getPlatform().equals("naver")) {
					resultMap.put("result", "fail_naver");
					return resultMap;
				} else if (resultVO.getPlatform().equals("google")) {
					resultMap.put("result", "fail_google");
					return resultMap;
				}
			}
		}
		resultMap.put("result", "fail");
		return resultMap;
	}

	@RequestMapping(value = "/pwdSearch", method = RequestMethod.GET)
	public String pwdSearch() {
		return "pwdSearch";
	}

	@RequestMapping(value = "/pwdSearch", method = RequestMethod.POST)
	public String pwdNewing(HttpServletRequest req, HttpSession session) {

		session.setAttribute("id", req.getParameter("id"));

		return "pwdNewing";
	}

	@ResponseBody
	@RequestMapping(value = "/authSMS", method = RequestMethod.POST)
	public int authSMS(HttpServletRequest req, UserVO vo) {
		int authNum = -1;
		vo.setId(req.getParameter("id"));
		vo.setPhone(req.getParameter("phone"));

		if (userService.searchPwd(vo) == 1) {
			System.out.println("controller ===> " + req.getParameter("authCode"));
			if (req.getParameter("authCode") != null) {
				authNum = authSMS.smsCheck(req.getParameter("phone"), req.getParameter("authCode"));
			} else {
				authNum = authSMS.sendSMS(req.getParameter("phone"));
			}
		}

		System.out.println(authNum);

		return authNum;
	}

	@RequestMapping(value = "/newPwd", method = RequestMethod.POST)
	public String newPwd(HttpServletRequest req, HttpSession session, UserVO vo) {

		vo.setId(String.valueOf(session.getAttribute("id")));
		vo.setPwd(req.getParameter("pwd"));

		// transaction position
		if (userService.newPwd(vo) == 1) {
			session.invalidate();
			return "redirect:/";
		} else {
			return "pwdNewing";
		}
	}
	// 유저
	// 1. userMypage(유저Index)
	@RequestMapping(value = "/userMypage")
	public String userMypage(Authentication authentication, String getId, Model model) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		getId = userDetails.getUsername();
		model.addAttribute("user", userService.getUser(getId));

		return "/mem/userMypage";
	}

	// 2. userMypage 수정 누를시 -> 비밀번호 인증페이지
	@RequestMapping(value = "/userPwdCheck")
	public String userPwdCheck(Authentication authentication, String getId, Model model) {
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//		getId = userDetails.getUsername();
//		model.addAttribute("user", userService.getUser(getId));
		return "/mem/userPwdCheck";
	}

	// 3. 비밀번호 인증후 -> 수정폼
	@RequestMapping(value = "/userUpdateForm")
	public String userUpdateForm(HttpServletRequest req, Authentication authentication, String getId, Model model) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		getId = userDetails.getUsername();
		UserVO vo = userService.checkUser(getId);
		
		if (pwdEncoder.matches(req.getParameter("pwd"), vo.getPwd())) {
			model.addAttribute("user", userService.getUser(getId));
			return "/mem/userUpdateForm";
		}
		return null;
	}

	// 4. 수정폼 완료 요청
	@RequestMapping(value = "/userUpdateSuccess")
	public String userUpdateSuccess(Authentication authentication, String getId, Model model, UserVO userVO) {
		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
		getId = userDetails.getUsername();

		userService.updateUser(userVO);
		model.addAttribute("user", userService.getUser(getId));

		return "/mem/userUpdateForm";
	}

	// 7. 수정폼 -> 비밀번호 변경 페이지 이동
	@RequestMapping(value = "/userResetPassword")
	public String userResetPassword(Authentication authentication, String getId, Model model) {
//		UserDetails userDetails = (UserDetails) authentication.getPrincipal();
//		getId = userDetails.getUsername();
//
//		model.addAttribute("user", userService.getUser(getId));
		return "/mem/userResetPassword";
	}

	// 8. 비밀번호 변경 : POST방식 (Ajax로 처리) 
	@ResponseBody
	@RequestMapping(value = "/userResetPasswordSuccess", method = RequestMethod.POST)
	public String userResetPasswordSuccess(@RequestBody Map<String,String> json) {
		
		UserVO vo = userService.checkUser(json.get("id"));
		System.out.println("id" + json.get("id"));
		System.out.println("1" + json.get("pwd"));
		System.out.println("2" + vo.getPwd());
		
		if (pwdEncoder.matches(json.get("pwd"), vo.getPwd())) {
			vo.setPwd(pwdEncoder.encode(json.get("new_pwd")));
			return String.valueOf(userService.updateUserPassword(vo));
		} else {
			return String.valueOf(-1);
		}
	}

	// 9. 수정폼 -> 유저 삭제 확인 페이지 이동
	@RequestMapping(value = "/userDeleteCheck")
	public String userDeleteCheck(Authentication authentication, String getId, Model model) {
		
		return "/mem/userDeleteCheck";
	}

	// 10. 유저 -> 유저 삭제(비활성화) : POST방식 (Ajax로 처리) 
	@ResponseBody
	@RequestMapping(value = "/userDeleteSuccess", method = RequestMethod.POST) 
	public String userDeleteSuccess(@RequestBody UserVO json) { 
		UserVO vo = userService.checkUser(json.getId());
		
		if (pwdEncoder.matches(json.getPwd(), vo.getPwd())) {
			return String.valueOf(userService.userDelete(json));
		} else {
			return String.valueOf(-1);
		}
	}
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model, ShowRoomVO showVO) {
		System.out.println("index");
		model.addAttribute("bestShowRoom", showRoomService.getUserShowRoomBest(showVO));
		
		return "index";
	}
}