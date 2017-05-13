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

import com.stums.po.College;
import com.stums.po.Major;
import com.stums.po.Teacher;
import com.stums.po.TeacherView;
import com.stums.service.*;

@Controller
@RequestMapping("/tea")
public class TeacherController {
	
	@Resource(name="teacherServiceImpl")
	private TeacherService teacherService;
	
	@Resource(name="collegeServiceImpl")
	private CollegeService collegeService;
	
	@Resource(name="majorServiceImpl")
	private MajorService majorService;
	
	@RequestMapping("/queryTea")
	public ModelAndView queryTea(HttpServletRequest request,HttpServletResponse response)
	{
		List<College> college_list = collegeService.findCollegeList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/queryTea");	
		return modelAndView;
	}
	
	@RequestMapping("/getMajorList")
	public void getMajorList(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		List<Major> list = majorService.findMajorListByCollegeId(Integer.parseInt(request.getParameter("college_id").trim()));
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out= response.getWriter();
		String result = "";
		for(Major m:list)
		{
			result+=m.getMajor_id()+"#";
			result+=m.getMajor_name()+",";	
		}
		if(result==null||result=="")
		{
			result=result.substring(0, result.length()-1);
		}
		out.print(result);
	}
	
	@RequestMapping("/getTeaTable")
	public void getTeaTable(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		response.setContentType("text/html;charset=utf-8");
		
		List<TeacherView> tea_list = teacherService.findTeacherListView(Integer.valueOf(request.getParameter("major_id")));

		PrintWriter out= response.getWriter();
		String result = "";
		for(TeacherView tea:tea_list)
		{
			result+=tea.getTea_tid()+"#";
			result+=tea.getTea_name()+"#";
			result+=tea.getTea_nid()+"#";
			result+=(tea.getTea_sex()==1?"男":"女")+"#";
			result+=tea.getCollege_name()+"#";
			result+=tea.getMajor_name()+"#";
			result+=tea.getTea_title()+"#";
			result+=tea.getTea_tel()+"#";
			result+="<a href="+request.getContextPath()+"/tea/editTea.action?tea_tid="+tea.getTea_tid()+">修改</a>/<a href='javaScript:delete_remind("+tea.getTea_tid()+")'>删除,";
		}
		result=result.substring(0, result.length()-1);
		out.print(result);
	}
	
	@RequestMapping("/editTea")
	public ModelAndView editTea(HttpServletRequest request,HttpServletResponse response)
	{
		ModelAndView modelAndView = new ModelAndView();
		List<College> college_list = collegeService.findCollegeList();
		modelAndView.addObject("college_list",college_list);
		
		Integer tea_tid = Integer.valueOf(request.getParameter("tea_tid"));
		TeacherView tea_view = teacherService.findTeacherView(tea_tid);
		List<Major> major_list = majorService.findMajorListByCollegeId(tea_view.getTea_college_id());
		modelAndView.addObject("major_list", major_list);
		modelAndView.addObject("tea",tea_view);
		modelAndView.setViewName("cmanage/editTea");
		return modelAndView;
		
	}
	
	
	
	@RequestMapping("/editTeaSubmit")
	public ModelAndView editTeaSubmit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		Teacher tea = new Teacher();
		tea.setTea_college_id(Integer.valueOf(request.getParameter("college_select")));
		tea.setTea_major_id(Integer.valueOf(request.getParameter("major_select")));
		tea.setTea_name(request.getParameter("name").trim());
		tea.setTea_nid(request.getParameter("tea_nid").trim());
		tea.setTea_sex(Integer.valueOf(request.getParameter("sex").trim()));
		tea.setTea_tel(request.getParameter("tel"));
		tea.setTea_tid(Integer.valueOf(request.getParameter("tea_tid").trim()));
		tea.setTea_title(request.getParameter("title"));
		teacherService.editTea(tea);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("cmanage/queryTea");
		return modelAndView;
	}
	
	@RequestMapping("/deleteTea")
	public void deleteTea(HttpServletRequest request,HttpServletResponse response) throws IOException
	{
		Integer tea_tid = Integer.valueOf(request.getParameter("tea_tid"));
		teacherService.deleteTea(tea_tid);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		out.print(tea_tid);
	}
	
	@RequestMapping("/addTea")
	public ModelAndView addTea(HttpServletRequest request,HttpServletResponse response)
	{
		List<College> college_list = collegeService.findCollegeList();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("college_list",college_list);
		modelAndView.setViewName("cmanage/addTea");
		return modelAndView;
	}
	

	@RequestMapping("/addTeaSubmit")
	public ModelAndView addTeaSubmit(HttpServletRequest request,HttpServletResponse response) throws UnsupportedEncodingException
	{
		request.setCharacterEncoding("utf-8");
		Teacher tea = new Teacher();
		System.out.println("name"+request.getParameter("name").trim());
		tea.setTea_college_id(Integer.valueOf(request.getParameter("college_select")));
		tea.setTea_major_id(Integer.valueOf(request.getParameter("major_select")));
		tea.setTea_name(request.getParameter("name").trim());
		tea.setTea_nid(request.getParameter("tea_nid").trim());
		tea.setTea_sex(Integer.valueOf(request.getParameter("sex").trim()));
		tea.setTea_tel(request.getParameter("tel"));
		tea.setTea_title(request.getParameter("title"));
		teacherService.addTea(tea);
		ModelAndView modelAndView = new ModelAndView();
		return modelAndView;
	}
	
	
}
