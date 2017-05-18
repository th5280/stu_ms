package com.stums.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.EvaCustomMapper;
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

	public List<EvaResult> queryEvaResultByTea(int teaTid) {
		return evaCustomMapper.queryEvaResultByTea(teaTid);
	}
	
}
