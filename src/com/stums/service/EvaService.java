package com.stums.service;

import java.util.List;

import com.stums.po.*;

public interface EvaService {
	public void addEva(Evaluation eva);
	
	public List<EvaResult> queryEvaResultByTea(int tea_tid);
 
}
