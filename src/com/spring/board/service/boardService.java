package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	public int contentUpdate(BoardVo boardVo) throws Exception;
	
	public int contentDelete(String boardType, int boardNum) throws Exception;
	
	public List<BoardVo> boardSorting(String[] boardType, PageVo pageVo) throws Exception;
	
	public List<CodeVo> selectCode() throws Exception;

}
