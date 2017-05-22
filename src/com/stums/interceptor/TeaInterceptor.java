package com.stums.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.stums.po.User;

public class TeaInterceptor implements HandlerInterceptor{

	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub
		
	}

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("user");
		
		if(user.getType()!=3)
		{
			switch (user.getType())
			{
				case 1:
					request.setAttribute("back", "smanage/queryUser.action");
					break;
				case 4:
					request.setAttribute("back","stu_course/querySelectedCourse.action");	
					break;
				case 2:
					request.setAttribute("back", "stu/queryStu.action");
					break;
			}
			RequestDispatcher dispatcher = request.getRequestDispatcher("../404.jsp");
			dispatcher .forward(request, response);
			return false;
		}
		return true;
	}

}
