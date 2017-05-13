package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.GradeMapper;
import com.stums.po.Grade;
import com.stums.service.GradeService;

@Component
public class GradeServiceImpl implements GradeService{

	@Autowired
	private GradeMapper gradeMapper;
	
	public List<Grade> findGradeListByStu(int stuId) {
		return null;
	}
	
}
