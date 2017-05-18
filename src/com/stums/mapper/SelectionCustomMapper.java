package com.stums.mapper;

import java.util.List;

import com.stums.po.Selection;
import com.stums.po.StudentView;

public interface SelectionCustomMapper {
	public List<Integer> findCourseIdListByStu(int stu_sid);

	public void addSelectedCourse(Selection select);

	public void delSelectedCourse(Selection select);
	
	public List<StudentView> findStuViewListByCourse(int course_id);

}
