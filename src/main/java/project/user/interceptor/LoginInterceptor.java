package project.user.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import project.user.controller.UserControllerImpl;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "LOGIN";
	public static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object Handler, ModelAndView mav)
			throws Exception {
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = mav.getModelMap();
		System.out.println("로그인 인터쎕터" + mav);
		System.out.println("로그인 인터쎕터" + modelMap);
		Object userVO = modelMap.get("userVO");
		if (userVO != null) {
			System.out.println("Success!!!!");
			httpSession.setAttribute(LOGIN, userVO);
			System.out.println("httpSession.getAttribute(LOGIN)" + httpSession.getAttribute(LOGIN));
			//response.sendRedirect("/");

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
			response.sendRedirect(destination != null ? (String) destination : "/");
		}
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object Handler)
			throws Exception {
		HttpSession httpSession = request.getSession();
		System.out.println("넌 언제 다녀오는데??");
		if (httpSession.getAttribute(LOGIN) != null) {
			httpSession.removeAttribute(LOGIN);
			System.out.println(LOGIN);
		}
		return true;
	}

}
