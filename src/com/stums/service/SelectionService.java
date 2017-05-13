package com.stums.service;

import java.util.List;

import com.stums.po.CourseView;
import com.stums.po.Selection;

public interface SelectionService {
	public void addSelectedCourse(Selection select);
	
	public List<CourseView> findCourseViewListByStu(int stu_sid);

	public void quitCourse(Selection select);
}
