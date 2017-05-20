package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.EvaCustomMapper;
import com.stums.po.CourseView;
import com.stums.po.EvaResult;
import com.stums.po.Evaluation;
import com.stums.service.EvaService;

@Component
public class EvaServiceImpl implements EvaService{
	
	@Autowired
	EvaCustomMapper evaCustomMapper;
	
	public void addEva(Evaluation eva) {
		evaCustomMapper.addEva(eva);
	}

	public List<EvaResult> findEvaResultListByTea(int teaTid) {
		return evaCustomMapper.queryEvaResultByTea(teaTid);
	}

	public List<Evaluation> queryEvaByStu(int stuSid) {
		return null;
	}

	public List<CourseView> findUnEvaCourseViewList(int stu_sid) {
		return evaCustomMapper.findUnEvaCourseViewList(stu_sid);
	}
	
}
