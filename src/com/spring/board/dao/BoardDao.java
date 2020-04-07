package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;

public interface BoardDao {

	public String selectTest() throws Exception;

	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(BoardVo boardVo) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;
	
	public int contentUpdate(BoardVo boardVo) throws Exception;
	
	public int contentDelete(BoardVo boardVo) throws Exception;
	
	public List<BoardVo> boardSorting(String[] boardType, PageVo pageVo) throws Exception;

	public List<CodeVo> selectCode() throws Exception;
	
	public List<BoardVo> countTen(List<BoardVo> list) throws Exception;
	
}
