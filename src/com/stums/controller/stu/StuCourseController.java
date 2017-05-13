package com.stums.controller.stu;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stums.mapper.CourseCustomMapper;
import com.stums.po.*;
import com.stums.service.*;
import com.stums.service.impl.CourseServiceImpl;

@Controller
@RequestMapping("/stu_course")
public class StuCourseController {
	
	@Resource(name="courseServiceImpl")
	private CourseService courseService;
	

	
	@Resource(name="selectionServiceImpl")
	private SelectionService selectionService;
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@RequestMapping("/querySelectedCourse")
	public ModelAndView queryCourse(HttpServletRequest request)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		List<CourseView> courseview_list=selectionService.findCourseViewListByStu(user.getUser_id());
		List<String> sem_list = new ArrayList();
		for(int i=0;i<courseview_list.size();i++)
		{
			String sem = courseview_list.get(i).getCourse_time().substring(0, 3);
			if(!sem_list.contains(sem))
			{
				sem_list.add(sem);
			}
		}
		modelAndView.addObject("sem_list",sem_list);
		modelAndView.setViewName("stu/queryCourse");
		return modelAndView;
	}
	
	@RequestMapping("/querySelectingCourse")
	public ModelAndView querySelectingCourse(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		//获得学生专业
		Student stu = studentService.findStudentBySid(user.getUser_id());
		
		List<CourseView> courseView_list =courseService.findUnSelectedCourse(stu);
		ModelAndView modelAndView = new ModelAndView();
	
		modelAndView.addObject("courseView_list", courseView_list);
		modelAndView.setViewName("stu/selectCourse");
		return modelAndView;
	}
	
	@RequestMapping("/getCourseTable")
	public void getCourseTable(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		 HttpSession session=request.getSession();
		 User user = (User)session.getAttribute("user");
		 List<CourseView> courseview_list=selectionService.findCourseViewListByStu(user.getUser_id());
		 response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			String result = "";
			for(CourseView cfv:courseview_list)
			{
				result+=cfv.getCourse_id()+"#";
				result+=cfv.getCourse_name()+"#";
				result+=(cfv.getCourse_nature()==1?"必修课":"选修课")+"#";
				result+=cfv.getCourse_credit()+"#";
				result+=cfv.getCourse_time()+"#";
				result+=cfv.getCourse_classroom()+"#";
				result+=cfv.getCourse_stu_num()+"#";
				result+=cfv.getCourse_selection()+"#";
				result+="<a href='javaScript:quit_remind("+cfv.getCourse_id()+")'>退课,";
			}
			if(result!="")
			{
				result=result.substring(0, result.length()-1);
			}
			out.print(result);
	}
	@RequestMapping("/selectCourse")
	public void selectCourse(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Integer course_id = Integer.valueOf(request.getParameter("course_id"));
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		Selection selection = new Selection();
		selection.setSelect_course_id(course_id);
		selection.setSelect_stu_sid(user.getUser_id());
		selectionService.addSelectedCourse(selection);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(course_id);
	}

	@RequestMapping("/quitCourse")
	public void quitCourse(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Integer course_id = Integer.valueOf(request.getParameter("course_id"));
		HttpSession session=request.getSession();
		User user = (User)session.getAttribute("user");
		Selection selection = new Selection();
		selection.setSelect_course_id(course_id);
		selection.setSelect_stu_sid(user.getUser_id());
		selectionService.quitCourse(selection);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(course_id);
	}
}
