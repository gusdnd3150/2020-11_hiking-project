package project.user.interceptor;

import java.util.LinkedHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import project.user.vo.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "LOGIN";
	public static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView mav)
			throws Exception {
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		UserVO userVO = (project.user.vo.UserVO) modelMap.get("userVO");
		if (userVO != null) {
			String id = userVO.getId();
			httpSession.setAttribute(LOGIN, id);
			System.out.println("LoginInterceptor//postHandle:     " + httpSession.getAttribute(LOGIN));

			if (request.getParameter("useCookie") != null) {
				logger.info("remember me...	");

				// 쿠키생성
				Cookie loginCookie = new Cookie("loginCookie", httpSession.getId());
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60 * 60 * 24 * 7);
				// 전송
				response.addCookie(loginCookie);

			}
			Object destination = httpSession.getAttribute("destinateion");
			response.sendRedirect(destination != null ? (String) destination : "/main.do");

		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		if (httpSession.getAttribute(LOGIN) != null) {
			httpSession.removeAttribute(LOGIN);
			System.out.println(LOGIN);
		}
		return true;
	}

}
