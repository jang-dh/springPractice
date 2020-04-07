package com.spring.board.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.board.dao.BoardDao;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;

@Service
public class boardServiceImpl implements boardService{
	
	@Autowired
	BoardDao boardDao;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectTest();
	}
	
	@Override
	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.selectBoardList(pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectBoardCnt();
	}
	
	@Override
	public BoardVo selectBoard(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		return boardDao.selectBoard(boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return boardDao.boardInsert(boardVo);
	}

	@Override
	public int contentUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		
		return boardDao.contentUpdate(boardVo);
	}

	@Override
	public int contentDelete(String boardType, int boardNum) throws Exception {
		// TODO Auto-generated method stub
		
		BoardVo boardVo = new BoardVo();
		
		boardVo.setBoardType(boardType);
		boardVo.setBoardNum(boardNum);
		
		int result = boardDao.contentDelete(boardVo);
		
		if(result==0) {
			throw new Exception("삭제할 데이터가 없습니다.");
		}
		return result;
	}

	@Override
	public List<BoardVo> boardSorting(String[] boardType, PageVo pageVo) throws Exception {
		List<BoardVo> list = boardDao.boardSorting(boardType, pageVo);
		list.get(0).setTotalCnt(list.size());
		return list;
	}

	@Override
	public List<CodeVo> selectCode() throws Exception {
		// TODO Auto-generated method stub
		return boardDao.selectCode();
	}

}
