package com.spring.board.dao.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.CodeVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	@Override
	public int contentUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.contentUpdate", boardVo);
	}
	@Override
	public int contentDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.contentDelete", boardVo);
	}
	@Override
	public List<BoardVo> boardSorting(String[] boardType, PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("array", boardType);
		map.put("pageNo",pageVo.getPageNo());
		return sqlSession.selectList("board.boardSorting", map);
	}
	@Override
	public List<CodeVo> selectCode() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.selectCode");
	}
	@Override
	public List<BoardVo> countTen(List<BoardVo> list) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.countTen",list);
	}
	
	
	
}
