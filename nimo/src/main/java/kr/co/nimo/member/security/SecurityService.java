package kr.co.nimo.member.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.nimo.member.user.UserService;
import kr.co.nimo.member.user.UserVO;

@Service("securityService")
public class SecurityService implements UserDetailsService {

	@Autowired
	private UserService userService;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		System.out.println("security");
		UserVO vo = userService.checkUser(id);

		if (vo == null) {
			System.out.println("not found Exception");
			throw new UsernameNotFoundException(null);
		}
		
		Collection<SimpleGrantedAuthority> roles = new ArrayList<SimpleGrantedAuthority>();
		if (vo.getRole() != null) {
			
			if (vo.getRole().equals("ROLE_ADMIN") || vo.getRole().equals("ROLE_SUPER")) {
				vo.setPwd(passwordEncoder.encode(vo.getPwd()));
			}
			roles.add(new SimpleGrantedAuthority(vo.getRole()));
		}
		System.out.println(vo.getStat());
		if(vo.getStat().equals("N")) { return null; }
		
		System.out.println("escape security");
		return new User(id, vo.getPwd(), roles);
	}
}