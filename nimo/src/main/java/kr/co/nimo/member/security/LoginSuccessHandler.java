package kr.co.nimo.member.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse res, Authentication authdata)
			throws IOException, ServletException {

		HttpSession session = req.getSession();

		//인증된 사용자의 정보를 추출
		UserDetails userDetails = 
				(UserDetails)authdata.getPrincipal();
		//		System.out.println(authdata.getPrincipal());
		System.out.println("인증후=>"+userDetails);
		//권한리스트를 추출
		Collection<? extends GrantedAuthority> authlist = userDetails.getAuthorities();
		Iterator<? extends GrantedAuthority> authlist_it= authlist.iterator();
		String url = "";
		if (session != null) {
			String redirectUrl = (String) session.getAttribute("prevPage");
			if (redirectUrl != null) {
				while(authlist_it.hasNext()) {
					GrantedAuthority authority= authlist_it.next();
					//설정되어 있는 권한 중 ROLE_ADMIN이 있다면
					if(authority.getAuthority().equals("ROLE_ADMIN") || authority.getAuthority().equals("ROLE_SUPER")) {
						url="/nimo/nimoKwan";
					} else {
						if (redirectUrl.equals("http://localhost:8088/nimo/") || redirectUrl.equals("http://localhost:8088/nimo")) {
							url="/nimo";
						} else {
							url=redirectUrl;
						}
					}
				}
			} else {
				url="/nimo";
			}
		} else {
			url="/nimo";
		}
		res.sendRedirect(url);
	}
}
