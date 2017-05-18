package com.stums.service;

import java.util.List;

import com.stums.po.CourseView;
import com.stums.po.Selection;
import com.stums.po.StudentView;

public interface SelectionService {
	public void addSelectedCourse(Selection select);
	
	public List<CourseView> findCourseViewListByStu(int stu_sid);

	public void quitCourse(Selection select);
	
	public List<StudentView> findStuViewListByCourse(int course_id);
}
