package com.spring.board.service;

import com.spring.board.vo.UserVo;

public interface UserService {
	public UserVo idCheck(String userId) throws Exception;
	
	public int join(UserVo userVo) throws Exception;
	
	public UserVo login(UserVo userVo) throws Exception;
}
