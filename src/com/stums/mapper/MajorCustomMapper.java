package com.stums.mapper;

import java.util.List;

import com.stums.po.*;

public interface MajorCustomMapper {
	
	public List<MajorView> findMajorViewList(int college_id);
	
	public MajorView findMajorView(int major_id);
}
