package com.stums.mapper;

import com.stums.po.*;

import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface LoginMapper {
	public Integer getUserId(User user);
}