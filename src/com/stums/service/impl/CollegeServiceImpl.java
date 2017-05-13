package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.CollegeMapper;
import com.stums.po.College;
import com.stums.service.CollegeService;


@Component
public class CollegeServiceImpl implements CollegeService{
	
	@Autowired
	private CollegeMapper collegeMapper;
	
	public List<College> findCollegeList() {
		List<College> list = collegeMapper.findCollegeList();
		return  list;
	}

}
