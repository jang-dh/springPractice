package com.spring.board.dao;

import com.spring.board.vo.UserVo;

public interface UserDao {
	public UserVo idCheck(String userId) throws Exception;
	
	public int join(UserVo userVo) throws Exception;
	
	public UserVo login(UserVo userVo) throws Exception;
}
