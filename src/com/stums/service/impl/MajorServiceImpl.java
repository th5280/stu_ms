package com.stums.service.impl;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.stums.mapper.*;

import com.stums.po.Major;
import com.stums.po.MajorView;
import com.stums.service.MajorService;

@Component
public class MajorServiceImpl implements MajorService{

	@Autowired
	private MajorMapper majorMapper;
	
	@Autowired
	private MajorCustomMapper majorCustomMapper;
	
	public List<Major> findMajorList() {
		List<Major> list=majorMapper.findMajorList();
		return list;
	}

	public List<Major> findMajorListByCollegeId(int college_id) {
		List<Major> list = majorMapper.findMajorListByCollegeId(college_id);
		return list;
	}

	public List<MajorView> findMajorViewList(int college_id) {
		
		return majorCustomMapper.findMajorViewList(college_id);
	}

	public MajorView findMajorView(int major_id) {
		return majorCustomMapper.findMajorView(major_id);
	}

	public void editMajor(Major major) {
		majorMapper.editMajor(major);
	}

	public void deleteMajor(int major_id) {
		majorMapper.deleteMajor(major_id);
	}

	public void addMajor(Major major) {
		Integer major_id=majorMapper.getNewMajor_id();
		major.setMajor_id(major_id);
		majorMapper.addMajor(major);
	}

}
