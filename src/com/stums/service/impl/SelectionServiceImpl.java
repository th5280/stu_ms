package com.stums.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.CourseCustomMapper;
import com.stums.mapper.SelectionCustomMapper;
import com.stums.po.CourseView;
import com.stums.po.Selection;
import com.stums.po.StudentView;
import com.stums.service.SelectionService;

@Component
public class SelectionServiceImpl implements SelectionService{

	@Autowired
	private CourseCustomMapper courseCustomMapper;
	
	@Autowired
	private SelectionCustomMapper	selectionCustomMapper;
	
	public void addSelectedCourse(Selection select) {
		selectionCustomMapper.addSelectedCourse(select);
	}
	
	public List<CourseView> findCourseViewListByStu(int stu_sid) {
		List<Integer> course_id_list=selectionCustomMapper.findCourseIdListByStu(stu_sid);
		List<CourseView> course_list = new ArrayList();
		for(int i=0;i<course_id_list.size();i++)
		{
			course_list.add(courseCustomMapper.findCourseView(course_id_list.get(i)));
		}
		return course_list;
		
	}

	public void quitCourse(Selection select) {
		selectionCustomMapper.delSelectedCourse(select);
	}

	public List<StudentView> findStuViewListByCourse(int courseId) {
		return selectionCustomMapper.findStuViewListByCourse(courseId);
	}


}
