package swdo.syj.yayoung.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class STLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String loginId_st = (String)session.getAttribute("loginId_st");
		
		if(loginId_st == null){
			response.sendRedirect(request.getContextPath()+"/login/login_st");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
