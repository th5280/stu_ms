package com.stums.mapper;

import java.util.List;

import com.stums.po.*;


public interface TeacherCustomMapper {
	public List<TeacherView> findTeacherListView(int major_id);

	public TeacherView findTeacherView(int tea_tid);
}
