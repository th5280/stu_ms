package com.stums.service;

import java.util.List;

import com.stums.po.*;

public interface EvaService {
	public void addEva(Evaluation eva);
	
	public List<EvaResult> findEvaResultListByTea(int tea_tid);
		
	public List<CourseView> findUnEvaCourseViewList(int stu_sid);

}
