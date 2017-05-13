package com.stums.controller.cmanage;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.stums.po.*;
import com.stums.service.CollegeService;
import com.stums.service.MajorService;
import com.stums.service.TeacherService;

@Controller
@RequestMapping("/major")
public class MajorController {
	
	@Resource(name="collegeServiceImpl")
	private CollegeService collegeService;
	
	@Resource(name="majorServiceImpl")
	private MajorService majorService;
	
	@Resource(name="teacherServiceImpl")
	TeacherService teacherService;
	
	@RequestMapping("/queryMajor")
	public ModelAndView queryMajor()
	{
		ModelAndView modelAndView = new ModelAndView();
		List<College> college_list = collegeService.findCollegeList();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/queryMajor");
		return modelAndView;
	}
	
	@RequestMapping("/getMajorTable")
	public void getMajorTable(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		List<MajorView> list = majorService.findMajorViewList(Integer.parseInt(request.getParameter("college_id").trim()));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		String result = "";
		for(MajorView m:list)
		{
			result+=m.getMajor_id()+"#";
			result+=m.getMajor_name()+"#";
			result+=m.getStu_num()+"#";
			result+=m.getMajor_head_name()+"#";
			result+="<a href="+request.getContextPath()+"/major/editMajor.action?major_id="+m.getMajor_id()+">修改</a>/<a href='javaScript:delete_remind("+m.getMajor_id()+")'>删除,";
		}
		result=result.substring(0, result.length()-1);
		out.print(result);
	}
	
	
	@RequestMapping("/deleteMajor")
	public void deleteMajor(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int major_id = Integer.valueOf(request.getParameter("major_id"));
		majorService.deleteMajor(major_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(major_id);
		
	}
	
	
	
	@RequestMapping("/addMajor")
	public ModelAndView addMajor(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		List<College> college_list = collegeService.findCollegeList();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/addMajor");
		return modelAndView;
	}
	
	@RequestMapping("/getTeaList")
	public void getTeaList(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		int college_id = Integer.valueOf(request.getParameter("college_id"));
		System.out.println("college_id="+college_id);
		List<Teacher> list = teacherService.findTeacherListByCollege(college_id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		String result="";
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
	
	@RequestMapping("/addMajorSubmit")
	public ModelAndView addMajorSubmit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		Major major = new Major();
		major.setMajor_head_id(Integer.valueOf(request.getParameter("college_select")));
		major.setMajor_college_id(Integer.valueOf(request.getParameter("major_head_select")));
		major.setMajor_name(request.getParameter("major_name"));
		majorService.addMajor(major);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("cmanage/addMajor");
		return modelAndView;
	}
	
	@RequestMapping("/editMajor")
	public ModelAndView editMajor(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		List<College> college_list = collegeService.findCollegeList();
		modelAndView.addObject("college_list",college_list);
		Integer major_id = Integer.valueOf(request.getParameter("major_id"));
		List<TeacherView> list =  teacherService.findTeacherListView(major_id);
		modelAndView.addObject("tea_list", list);
		MajorView mfv = majorService.findMajorView(major_id);
		modelAndView.addObject("major",mfv);
		modelAndView.setViewName("cmanage/editMajor");
		return modelAndView;
	}

	@RequestMapping("/editMajorSubmit")
	public ModelAndView editMajorSubmit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		ModelAndView modelAndView = new ModelAndView();

		Major major = new Major();
		
		major.setMajor_college_id(Integer.valueOf(request.getParameter("college_select")));
		major.setMajor_name(request.getParameter("major_name"));
		major.setMajor_id(Integer.valueOf(request.getParameter("major_id")));
		major.setMajor_head_id(Integer.valueOf(request.getParameter("major_head_select")));
		
		majorService.editMajor(major);
		
		modelAndView.setViewName("cmanage/queryMajor");
		return modelAndView;
		
	}
}
