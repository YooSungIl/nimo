package kr.co.nimo.member.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.authentication.AccountExpiredException;
import org.springframework.security.authentication.AuthenticationServiceException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.LockedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class LoginFailureHandler implements AuthenticationFailureHandler {
    
    private String loginidname;
    private String loginpwdname;
    private String errormsgname;
    private String defaultFailureUrl;
 
    @Override
    public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse resp, AuthenticationException exception)
            throws IOException, ServletException {
    	System.out.println("loginFailure");
    	String username = req.getParameter("id");
        String password = req.getParameter("pwd");
        String errormsg = null;
        System.out.println(username);
        if (exception instanceof AuthenticationServiceException) {
        	errormsg = "아이디가 존재하지 않습니다.";
		
		} else if(exception instanceof BadCredentialsException) {
			errormsg = "아이디 / 비밀번호가 일치하지 않습니다.";
			
		} else if(exception instanceof LockedException) {
			errormsg = "잠긴 계정입니다.";
			
		} else if(exception instanceof DisabledException) {
			errormsg = "비활성화된 계정입니다.";
			
		} else if(exception instanceof AccountExpiredException) {
			errormsg = "만료된 계정입니다.";
			
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = "비밀번호가 만료되었습니다.";
		}
        
        req.setAttribute(loginidname, username);
        req.setAttribute(loginpwdname, password);
        req.setAttribute(errormsgname, errormsg);
        
        System.out.println("escape failure");
        req.getRequestDispatcher(defaultFailureUrl).forward(req, resp);
        
    }
 
    public String getLoginidname() {
        return loginidname;
    }
 
    public void setLoginidname(String loginidname) {
        this.loginidname = loginidname;
    }
 
    public String getLoginpwdname() {
        return loginpwdname;
    }
 
    public void setLoginpwdname(String loginpwdname) {
        this.loginpwdname = loginpwdname;
    }
 
    public String getErrormsgname() {
        return errormsgname;
    }
 
    public void setErrormsgname(String errormsgname) {
        this.errormsgname = errormsgname;
    }
 
    public String getDefaultFailureUrl() {
        return defaultFailureUrl;
    }
 
    public void setDefaultFailureUrl(String defaultFailureUrl) {
        this.defaultFailureUrl = defaultFailureUrl;
    }
}