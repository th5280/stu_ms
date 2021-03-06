package com.stums.controller.smanage;

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
import com.stums.service.UserService;

@RequestMapping("/smanage")
@Controller
public class UserController {
	
	@Resource(name="userServiceSuperImpl")
	private UserService userService;

	@RequestMapping("/queryUser")
	public ModelAndView queryUser(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();	
		List<User> coma_list= userService.findUserListByType(2);
		modelAndView.addObject("coma_list",coma_list);
		modelAndView.setViewName("smanage/queryCoMaUser");
		return modelAndView;
	}
	
	@RequestMapping("/deleteUser")
	public void deleteStu(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Integer user_id = Integer.valueOf(request.getParameter("user_id"));
		userService.deleteUser(user_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(user_id);
	}
	
	@RequestMapping("/editCoMaUserSubmit")
	public ModelAndView editCoMaUserSubmit(HttpServletRequest request,HttpServletResponse response)
	{
		User user = new User();
		user.setType(2);
		user.setUser_id(Integer.valueOf(request.getParameter("user_id")));
		user.setPassword(request.getParameter("password").trim());
		userService.editUser(user);
		ModelAndView modelAndView = new ModelAndView("redirect:queryCoMaUser.action");
		return modelAndView;
	}
	
	@RequestMapping("/editCoMaUser")
	public ModelAndView editCoMaUser(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		User user = userService.findUserById(Integer.valueOf(request.getParameter("user_id")));
		modelAndView.addObject("user", user);
		modelAndView.setViewName("smanage/editCoMaUser");
		return modelAndView;
	}
	
	@RequestMapping("/addCoMaUserSubmit")
	public ModelAndView addCoMaUser(HttpServletRequest request,HttpServletResponse response)
	{
		User user = new User();
		user.setType(2);
		user.setUser_id(Integer.valueOf(request.getParameter("user_id")));
		user.setPassword(request.getParameter("password").trim());
		userService.addUser(user);
		ModelAndView modelAndView = new ModelAndView("redirect:queryUser.action");
		return modelAndView;
	}
	@RequestMapping("/addCoMaUser")
	public ModelAndView addUser(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("smanage/addCoMaUser");
		return modelAndView;

	}
	

}
