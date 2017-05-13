package com.stums.service;

import java.util.HashMap;
import java.util.List;

import com.stums.po.*;

public interface MajorService {
	
	//获得专业列表
	public List<Major> findMajorList();
	
	//根据学院id获得 专业列表
	public List<Major> findMajorListByCollegeId(int college_id);

	public List<MajorView> findMajorViewList(int college_id);

	public MajorView findMajorView(int major_id);
	
	public void editMajor(Major major);
	
	public void deleteMajor(int major);
	
	public void addMajor(Major major);
	
}
