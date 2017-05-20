package com.stums.controller.tea;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stums.po.CourseView;
import com.stums.po.EvaResult;
import com.stums.po.Grade;
import com.stums.po.GradeView;
import com.stums.po.StudentView;
import com.stums.po.User;
import com.stums.service.CourseService;
import com.stums.service.EvaService;
import com.stums.service.GradeService;
import com.stums.service.SelectionService;
import com.stums.service.StudentService;

@RequestMapping("/tea")
@Controller
public class TeaCourseController {
	
	@Resource(name="courseServiceImpl")
	private CourseService courseService;
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@Resource(name="selectionServiceImpl")
	private SelectionService selectionService; 
	
	@Resource(name="gradeServiceImpl")
	private GradeService gradeService;
	
	@Resource(name="evaServiceImpl")
	private EvaService evaService;
	
	@RequestMapping("/queryCourse")
	public ModelAndView queryCourse(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		HttpSession session = request.getSession();
		User user = (User)(session.getAttribute("user"));
		int tea_tid = user.getUser_id();
		List<CourseView> list = courseService.findCourseViewListByTea(tea_tid);
		modelAndView.addObject("courseView_list",list);
		modelAndView.setViewName("tea/queryCourse");
		return modelAndView;
	}
	
	@RequestMapping("/queryStudentByCourse")
	public ModelAndView queryStudentByCourse(HttpServletRequest request,HttpServletResponse response)
	{
		int course_id = Integer.valueOf(request.getParameter("course_id"));
		List<StudentView> list = selectionService.findStuViewListByCourse(course_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("studentView_list", list);
		modelAndView.setViewName("tea/queryStu");
		return modelAndView;
	}
	
	@RequestMapping("/queryGradeByCourse")
	public ModelAndView queryGradeByCourse(int course_id, HttpServletRequest request,HttpServletResponse response)
	{
		List<GradeView> list = gradeService.findGradeViewListByCourse(course_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("gradeView_list",list);
		modelAndView.setViewName("tea/queryGrade");
		return modelAndView;
		
	}
	@RequestMapping("/inputGrade")
	public ModelAndView inputGrade(int course_id, HttpServletRequest request,HttpServletResponse response)
	{
		
		List<StudentView> list = selectionService.findStuViewListByCourse(course_id);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("studentView_list", list);
		CourseView courseView=courseService.findCourseViewById(course_id);
		modelAndView.addObject("courseView",courseView);
		return modelAndView;
		
	}
	
	@RequestMapping("/inputGradeSubmit")
	public ModelAndView inputGradeSubmit( int course_id,String[] usual_grade,String[] final_grade,String[] test_grade,
			String[] stu_sid,HttpServletRequest request,HttpServletResponse response)
	{
		for(int i=0;i<usual_grade.length;i++)
		{
			Grade grade = new Grade();
			grade.setStu_sid(Integer.valueOf(stu_sid[i]));
			grade.setCourse_id(course_id);
			grade.setFinal_grade(Integer.valueOf(final_grade[i]));
			grade.setUsual_grade(Integer.valueOf(usual_grade[i]));
			grade.setTest_grade(Integer.valueOf(test_grade[i]));
			gradeService.addGrade(grade);
			
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("redirect:queryCourse.action");
		return modelAndView;
	}
	
	@RequestMapping("/queryEva")
	public ModelAndView queryEva(HttpServletRequest request,HttpServletResponse response)
	{
		HttpSession session = request.getSession();
		User user = (User)(session.getAttribute("user"));
		
		ModelAndView modelAndView = new ModelAndView();
		List<EvaResult> list =  evaService.findEvaResultListByTea(user.getUser_id());
		modelAndView.addObject("evaResult_list", list);
		modelAndView.setViewName("tea/queryEva");
		return modelAndView;
	}
	
}
