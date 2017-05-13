package com.stums.mapper;

import com.stums.po.College;
import com.stums.po.Major;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface CollegeMapper {
	//查找学院列表
	public List<College> findCollegeList();
}