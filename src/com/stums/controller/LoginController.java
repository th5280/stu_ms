package com.stums.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.stums.mapper.StudentMapper;
import com.stums.po.Student;
import com.stums.po.User;
import com.stums.service.LoginService;
@Controller
public class LoginController {
	@Autowired
	private LoginService loginService;
	// 登陆
	@RequestMapping("/login")
	public String login(HttpServletRequest request,HttpServletResponse response)
			throws Exception {
		// 调用service进行用户身份验证
		// ...
		HttpSession session = request.getSession();
		User user = new User();
		user.setUser_id(Integer.valueOf(request.getParameter("user_id").trim()));
		user.setPassword(request.getParameter("password"));
		user.setType(Integer.valueOf(request.getParameter("usertype")));
		session.setAttribute("user",user);
		if(loginService.checkUser(user))
		{
			switch(user.getType())
			{
				case 4:
					return "redirect:stu_course/querySelectedCourse.action";
				case 3:
					return "redirect:tea/queryCourse.action";
				case 2:
					return "redirect:stu/cmanage.action";
				case 1:
					return "redirect:stu/";
				default:	
			}
		}
		// 重定向到商品列表页面
		return "redirect:login.jsp";
	}
	// 退出
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request,HttpServletResponse response) throws Exception {

		// 清除session
		request.getSession().invalidate();

		// 重定向到商品列表页面
		
		return "redirect:course/queryCourse.action";
	}


}
