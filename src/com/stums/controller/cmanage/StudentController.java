package com.stums.controller.cmanage;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.stums.mapper.CollegeMapper;
import com.stums.mapper.StudentCustomMapper;
import com.stums.po.*;
import com.stums.po.Class;
import com.stums.service.*;


@Controller
@RequestMapping("/stu")
public class StudentController {
	
	@Resource(name="studentServiceImpl")
	private StudentService studentService;
	
	@Resource(name="collegeServiceImpl")
	private CollegeService collegeService;
	
	@Resource(name="majorServiceImpl")
	private MajorService majorService;
	//@Autowired
	//private CollegeMapper cm;
	
	//@Autowired
	//private StudentCustomMapper studentCustomMapper;
	
	
	@RequestMapping("/queryStu")
	public ModelAndView queryStu(HttpServletRequest request)
	{
		List<College> college_list = collegeService.findCollegeList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/queryStu");	
		return modelAndView;
		
	}
	

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
	
	@RequestMapping("/getClassNum")
	public void getClassNum(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("/getClassNum");
		Class Class = new Class();
		System.out.println("college_id="+request.getParameter("college_id")+"enter_year="+request.getParameter("enter_year")+"major_id="+request.getParameter("major_id"));
		Class.setStu_college_id(Integer.parseInt(request.getParameter("college_id").trim()));
		Class.setStu_major_id(Integer.parseInt(request.getParameter("major_id").trim()));
		Class.setStu_enter_year(Integer.parseInt(request.getParameter("enter_year").trim()));
		int class_num = studentService.findClassNum(Class);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String result="";
		for(int i=1;i<=class_num;i++)
		{
			result+=i+"#";
			result+=i+",";
		}
		result=result.substring(0, result.length()-1);
		out.print(result);
	}
	
	@RequestMapping("/getGradeList")
	public void getGradeList(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("/getCradeList");
		
		List<Integer> grade_list = studentService.findGradeList(Integer.parseInt(request.getParameter("major_id").trim()));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		String result = "";
		for(Integer i:grade_list)
		{
			result+=i+"#";
			result+=i+",";
		}
		result=result.substring(0, result.length()-1);
		out.print(result);
	}
	
	@RequestMapping("/getStuTable")
	public void getStuTable(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		System.out.println("getTable");
		response.setContentType("text/html;charset=utf-8");

		StuQueryVo sqv = new StuQueryVo();
		sqv.setCollege_id(Integer.valueOf(request.getParameter("college_id").trim()));
		
		sqv.setMajor_id(Integer.valueOf(request.getParameter("major_id").trim()));
		sqv.setStu_class(Integer.valueOf(request.getParameter("class").trim()));
		sqv.setStu_enter_year(Integer.valueOf(request.getParameter("enter_year").trim()));
		List<StudentView> student_list=studentService.findStudentListView(sqv);
		
		PrintWriter out= response.getWriter();
		String result = "";
		
		for(StudentView stu_view:student_list)
		{
			result+=stu_view.getStu_sid()+"#";
			result+=stu_view.getStu_name()+"#";
			result+=stu_view.getStu_nid()+"#";
			result+=(stu_view.getStu_sex()==1?"男":"女")+"#";
			result+=stu_view.getCollege_name()+"#";
			result+=stu_view.getMajor_name()+"#";
			result+=stu_view.getStu_class()+"#";
			result+=stu_view.getStu_tel()+"#";
			result+="<a href="+request.getContextPath()+"/stu/editStu.action?stu_sid="+stu_view.getStu_sid()+">修改</a>/<a href='javaScript:delete_remind("+stu_view.getStu_sid()+")'>删除,";
			
		}
		result=result.substring(0, result.length()-1);
		out.print(result);

	}
	
	@RequestMapping("/editStu")
	public ModelAndView editStu(HttpServletRequest request,HttpServletResponse response)
	{
		System.out.println("/editStu");
		ModelAndView modelAndView = new ModelAndView();
		List<College> college_list = collegeService.findCollegeList();
		modelAndView.addObject("college_list",college_list);

		Integer stu_id = Integer.valueOf(request.getParameter("stu_sid"));
		StudentView sfv = studentService.findStudentView(stu_id);
		List<Major> major_list = majorService.findMajorListByCollegeId(sfv.getStu_college_id());
		modelAndView.addObject("major_list",major_list);

		modelAndView.addObject("stu",sfv);
		modelAndView.setViewName("cmanage/editStu");
		return modelAndView;
		
	}
	
	@RequestMapping("/editStuSubmit")
	public ModelAndView editStuSubmit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		Student stu = new Student();
		
		stu.setStu_sid(Integer.valueOf(request.getParameter("stu_sid").trim()));
		stu.setStu_nid(request.getParameter("stu_nid").trim());
		stu.setStu_name(request.getParameter("name"));
		System.out.println("name="+request.getParameter("name"));
		stu.setStu_major_id(Integer.valueOf(request.getParameter("major_select")));
		stu.setStu_enter_year(Integer.valueOf(request.getParameter("enter_year")));
		stu.setStu_sex(Integer.valueOf(request.getParameter("sex")));
		stu.setStu_tel(request.getParameter("tel").trim());
		stu.setStu_class(Integer.valueOf(request.getParameter("class").trim()));
		stu.setStu_college_id(Integer.valueOf(request.getParameter("college_select")));
		studentService.editStu(stu);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("cmanage/queryStu");
		return modelAndView;
	}
	
	@RequestMapping("/deleteStu")
	public void deleteStu(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Integer stu_sid = Integer.valueOf(request.getParameter("stu_id"));
		studentService.deleteStu(stu_sid);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(stu_sid);
	}
	
	@RequestMapping("/addStu")
	public ModelAndView addStu(HttpServletRequest request,HttpServletResponse response)
	{
		
		List<College> college_list = collegeService.findCollegeList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/addStu");
		return modelAndView;
	}
	
	@RequestMapping("/addStuSubmit")
	public ModelAndView addStuSubmit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException 
	{
		request.setCharacterEncoding("utf-8");
		Student stu = new Student();
		stu.setStu_nid(request.getParameter("stu_nid").trim());
		stu.setStu_name(request.getParameter("name"));
		stu.setStu_major_id(Integer.valueOf(request.getParameter("major_select")));
		stu.setStu_enter_year(Integer.valueOf(request.getParameter("enter_year")));
		stu.setStu_sex(Integer.valueOf(request.getParameter("sex")));
		stu.setStu_tel(request.getParameter("tel").trim());
		stu.setStu_class(Integer.valueOf(request.getParameter("class").trim()));
		stu.setStu_college_id(Integer.valueOf(request.getParameter("college_select")));
		studentService.addStu(stu);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("cmanage/queryStu");
		return modelAndView;
		
	}
}
