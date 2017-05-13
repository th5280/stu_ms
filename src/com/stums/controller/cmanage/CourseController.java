package com.stums.controller.cmanage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.stums.po.*;
import com.stums.service.*;



@Controller
@RequestMapping("/course")
public class CourseController {
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@Resource(name="collegeServiceImpl")
	private CollegeService collegeService;
	
	@Resource(name="majorServiceImpl")
	private MajorService majorService;
	
	@Resource(name="teacherServiceImpl")
	private TeacherService teacherService;
	
	@Resource(name="courseServiceImpl")
	private CourseService courseService;
	
	@RequestMapping("/queryCourse")
	public ModelAndView queryCourse(HttpServletRequest request)
	{
		List<College> college_list = collegeService.findCollegeList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/queryCourse");	
		return modelAndView;
	}
	
//	public ModelAndView addCourse(HttpServletRequest request,)
//	{
//		
//	}
//	
	@RequestMapping("/getMajorList")
	public void getMajorList(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("接收到了--------------------");
		List<Major> list = majorService.findMajorListByCollegeId(Integer.parseInt(request.getParameter("college_id").trim()));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		String result = "";
		for(Major m:list)
		{
			result+=m.getMajor_id()+"#";
			result+=m.getMajor_name()+",";	
		}
		result=result.substring(0, result.length()-1);
		out.print(result);
	}
	
	@RequestMapping("/getTeaList")
	public void getTeaList(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		List<Teacher> list = teacherService.findTeacherListByMajor(Integer.valueOf(request.getParameter("major_id")));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		String result = "";
		for(Teacher tea:list)
		{
			result+=tea.getTea_tid()+"#";
			result+=tea.getTea_name()+",";
		}
		if(result!="")
		{
			result=result.substring(0, result.length()-1);
		}
		out.print(result);
	}
	
	@RequestMapping("/getCourseTable")
	public void getTeaTable(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=utf-8");
		System.out.println(Integer.valueOf(request.getParameter("tea_tid")));
		List<CourseView> list = courseService.findCourseViewListByTea(Integer.valueOf(request.getParameter("tea_tid")));

		PrintWriter out= response.getWriter();
		String result = "";
		for(CourseView cfv:list)
		{
			result+=cfv.getCourse_id()+"#";
			result+=cfv.getCourse_name()+"#";
			result+=(cfv.getCourse_nature()==1?"必修课":"选修课")+"#";
			result+=cfv.getCourse_credit()+"#";
			result+=cfv.getCourse_time()+"#";
			result+=cfv.getCourse_classroom()+"#";
			result+=cfv.getCourse_stu_num()+"#";
			result+=cfv.getCourse_selection()+"#";
			result+="<a href="+request.getContextPath()+"/course/editCourse.action?course_id="+cfv.getCourse_id()+">修改</a>/<a href='javaScript:delete_remind("+cfv.getCourse_id()+")'>删除,";
		}
		if(result!="")
		{
			result=result.substring(0, result.length()-1);
		}
		out.print(result);
	}
	
	@RequestMapping("/addCourse")
	public ModelAndView addCourse(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		List<College> college_list = collegeService.findCollegeList();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/addCourse");
		return modelAndView;
	}
	
	@RequestMapping("/addCourseSubmit")
	public ModelAndView addCourseSubmit(HttpServletRequest request,HttpServletResponse response)
	{
		Course course = new Course();
		course.setCourse_name(request.getParameter("course_name"));
		course.setCourse_classroom(request.getParameter("course_classroom"));
		course.setCourse_credit(Integer.valueOf(request.getParameter("course_credit")));
		course.setCourse_major_id(Integer.valueOf(request.getParameter("major_select")));
		course.setCourse_nature(Integer.valueOf(request.getParameter("nature_select")));
		course.setCourse_stu_num(Integer.valueOf(request.getParameter("course_stu_num")));
		course.setCourse_teacher_tid(Integer.valueOf(request.getParameter("tea_select")));
		course.setCourse_time(request.getParameter("course_time"));
		course.setCourse_selection(Integer.valueOf(request.getParameter("course_selection").trim()));
		courseService.addCourse(course);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("cmanage/queryCourse");
		return modelAndView;
	}
	
	@RequestMapping("/editCourse")
	public ModelAndView editCourse(HttpServletRequest request,HttpServletResponse response)
	{
		List<College> college_list = collegeService.findCollegeList();
		ModelAndView modelAndView = new ModelAndView();
		Integer course_id = Integer.valueOf(request.getParameter("course_id"));
		CourseView courseForView= courseService.findCourseViewById(course_id);
		
		List<Major> major_list = majorService.findMajorListByCollegeId(courseForView.getMajor_college_id());

		List<Teacher> tea_list = teacherService.findTeacherListByMajor(courseForView.getCourse_major_id());
		modelAndView.addObject("major_list", major_list);
		modelAndView.addObject("college_list",college_list);
		modelAndView.addObject("course_view",courseForView);
		modelAndView.addObject("tea_list", tea_list);
		modelAndView.setViewName("cmanage/editCourse");
		return modelAndView;
		
	}
	
	@RequestMapping("/editCourseSubmit")
	public ModelAndView editCourseSubmit(HttpServletRequest request,HttpServletResponse response)
	{
		Course course = new Course();
		course.setCourse_name(request.getParameter("course_name"));
		course.setCourse_classroom(request.getParameter("course_classroom"));
		course.setCourse_credit(Integer.valueOf(request.getParameter("course_credit")));
		course.setCourse_major_id(Integer.valueOf(request.getParameter("major_select")));
		course.setCourse_nature(Integer.valueOf(request.getParameter("nature_select")));
		course.setCourse_stu_num(Integer.valueOf(request.getParameter("course_stu_num")));
		System.out.println("tea_tid="+request.getParameter("tea_select"));
		course.setCourse_teacher_tid(Integer.valueOf(request.getParameter("tea_select")));
		course.setCourse_time(request.getParameter("course_time"));
		course.setCourse_id(Integer.valueOf(request.getParameter("course_id")));
		course.setCourse_selection(Integer.valueOf(request.getParameter("course_selection").trim()));
		courseService.editCourse(course);
		ModelAndView modelAndView = new ModelAndView("redirect:/course/queryCourse.action");
		return modelAndView;
	}
	
	@RequestMapping("/deleteCourse")
	public void deleteCourse(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Integer course_id = Integer.valueOf(request.getParameter("course_id"));
		courseService.deleteCourse(course_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(course_id);
	}
}
