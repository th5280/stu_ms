package com.stums.controller.cmanage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stums.po.User;
import com.stums.service.StudentService;
import com.stums.service.TeacherService;
import com.stums.service.UserService;


@Controller
@RequestMapping("/schoolUser")
public class SchoolUserController {
	
	@Resource(name="userServiceSuperImpl")
	private UserService userService;

	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@Resource(name="teacherServiceImpl")
	private TeacherService teacherSerivice;
	
	@RequestMapping("/editUserSubmit")
	public ModelAndView editCoMaUserSubmit(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("提交修改");
		User user = new User();
		user.setType(Integer.valueOf(request.getParameter("type")));
		user.setUser_id(Integer.valueOf(request.getParameter("user_id")));
		user.setPassword(request.getParameter("password").trim());
		userService.editUser(user);
		ModelAndView modelAndView = new ModelAndView();
		if(user.getType()==4)
		{
			modelAndView.setViewName("redirect:/stu/queryStu.action");
		}
		else if(user.getType()==3)
		{
			modelAndView.setViewName("redirect:/tea/queryTea.action");
		}
		else
		{
			modelAndView.setViewName("redirect:/tea/queryTea.action");
		}
		return modelAndView;
	}
	
	@RequestMapping("/editUser")
	public ModelAndView editCoMaUser(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findUserById(Integer.valueOf(request.getParameter("user_id")));
		modelAndView.addObject("user", user);
		modelAndView.setViewName("cmanage/editUser");
		return modelAndView;
		
	}
	
	@RequestMapping("/addUserSubmit")
	public ModelAndView addCoMaUser(HttpServletRequest request,HttpServletResponse response)
	{
		User user = new User();
		user.setType(Integer.valueOf(request.getParameter("select_type")));
		user.setUser_id(Integer.valueOf(request.getParameter("user_id")));
		user.setPassword(request.getParameter("password").trim());
		userService.addUser(user);
		ModelAndView modelAndView = new ModelAndView("redirect:/stu/queryStu.action");
		return modelAndView;
	}
	@RequestMapping("/addUser")
	public ModelAndView addUser(HttpServletRequest request,HttpServletResponse response)
	{
		
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("cmanage/addUser");
		return modelAndView;

	}
	

}
