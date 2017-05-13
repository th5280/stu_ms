package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.*;
import com.stums.po.Teacher;
import com.stums.po.TeacherView;
import com.stums.service.*;

@Component
public class TeacherServiceImpl implements TeacherService{

	@Autowired
	private TeacherCustomMapper teacherCustomMapper;
	
	@Autowired
	private TeacherMapper teacherMapper;
	
	public List<TeacherView> findTeacherListView(int majorId) {
		return teacherCustomMapper.findTeacherListView(majorId);
	}

	public void deleteTea(int tea_tid) {
		teacherMapper.deleteTea(tea_tid);
	}

	public TeacherView findTeacherView(int tea_tid) {
		return teacherCustomMapper.findTeacherView(tea_tid);
	}
	
	public void editTea(Teacher tea)
	{
		teacherMapper.editTea(tea);
	}

	public void addTea(Teacher tea) {
		tea.setTea_tid(teacherMapper.getNewTea_id(tea));
		
		teacherMapper.addTea(tea);
	}

	public List<Teacher> findTeacherListByCollege(int college_id) {
		return teacherMapper.findTeacherListByCollege(college_id);
	}

	public List<Teacher> findTeacherListByMajor(int major_id) {
		return teacherMapper.findTeacherListByMajor(major_id);
	}


}
