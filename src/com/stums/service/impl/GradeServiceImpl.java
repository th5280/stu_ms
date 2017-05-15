package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.GradeCustomMapper;
import com.stums.po.Grade;
import com.stums.po.GradeView;
import com.stums.service.GradeService;

@Component
public class GradeServiceImpl implements GradeService{

	@Autowired
	private GradeCustomMapper gradeCustomMapper;
	
	public List<GradeView> findGradeViewListByStu(int stu_sid) {
		return gradeCustomMapper.findGradeViewListByStu(stu_sid);
	}
	
}
