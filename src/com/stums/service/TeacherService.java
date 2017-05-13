package com.stums.service;
import java.util.List;

import com.stums.po.*;

public interface TeacherService {
	
	public List<TeacherView> findTeacherListView(int major_id);

	public TeacherView findTeacherView(int tea_tid);
	
	public void deleteTea(int tea_tid);
	
	public void editTea(Teacher tea);
	
	public void addTea(Teacher tea);

	public List<Teacher> findTeacherListByCollege(int college_id);
	
	public List<Teacher> findTeacherListByMajor(int major_id);
}
