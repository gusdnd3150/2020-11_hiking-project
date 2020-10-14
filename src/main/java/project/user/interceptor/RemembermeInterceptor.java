package project.user.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import project.user.service.UserService;
import project.user.vo.UserVO;

public class RemembermeInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(RemembermeInterceptor.class);
	
	@Autowired
	private UserService userService;

	private String id;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		HttpSession httpSession = request.getSession();
		//System.out.println("remembermeInterceptor:  "+ WebUtils.getCookie(request, "loginCookie"));
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		if(loginCookie != null) {
			UserVO userVO = userService.checkLoginBefore(loginCookie.getValue());
			if(userVO != null)
				 id = userVO.getId();
				httpSession.setAttribute("LOGIN", id);
		}
		
		
		
		return true;
	}

}
