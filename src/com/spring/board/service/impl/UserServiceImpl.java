package com.spring.board.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.UserDao;
import com.spring.board.service.UserService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.UserVo;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDao userDao;

	@Override
	public UserVo idCheck(String userId) throws Exception {
		return userDao.idCheck(userId);
	}

	@Override
	public int join(UserVo userVo) throws Exception {
		int result = userDao.join(userVo);
		if(result>0) {
			return result;
		}else {
			throw new Exception("가입에 실패하셨습니다.");
		}
	}

	@Override
	public UserVo login(UserVo userVo) throws Exception {
		// TODO Auto-generated method stub
		return userDao.login(userVo);
	}

}
