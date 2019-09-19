package swdo.syj.yayoung.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class TCLoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		String loginId_tc = (String)session.getAttribute("loginId_tc");
		
		if(loginId_tc == null){
			response.sendRedirect(request.getContextPath()+"/login/login_tc");
			return false;
		}
		return super.preHandle(request, response, handler);
	}
}
