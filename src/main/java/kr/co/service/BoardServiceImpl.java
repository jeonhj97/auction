package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BoardDAO;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Service
public class BoardServiceImpl implements BoardService{

	@Inject
	private BoardDAO dao;
	
	
	@Override
	public void write(BoardVO boardvo) throws Exception {
		dao.write(boardvo);
	}
	
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		
		return dao.list(scri);
	}
	
	@Override
	public int listCount(SearchCriteria scri)throws Exception{
		return dao.listCount(scri);
	}


	
	@Override
	public BoardVO read(int boardno) throws Exception {
		
		return dao.read(boardno);
	}
	
	
	@Override
	public void update(BoardVO boardvo) throws Exception {

		dao.update(boardvo);
	}

	@Override
	public void delete(int boardno) throws Exception {
		
		dao.delete(boardno);
	}


	
	
	
	
}//class end
