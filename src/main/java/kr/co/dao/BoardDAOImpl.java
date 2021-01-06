package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.SearchCriteria;

@Repository
public class BoardDAOImpl implements BoardDAO{

	@Inject
	private SqlSession sqlSession;
	
	// 게시글 작성
	@Override
	public void write(BoardVO boardvo) throws Exception {
		sqlSession.insert("boardMapper.insert", boardvo);		
	}
	
	// 게시물 목록 조회
	@Override
	public List<BoardVO> list(SearchCriteria scri) throws Exception {
		
		return sqlSession.selectList("boardMapper.listPage",scri);
	}
	
	
	// 게시물 총 갯수(페이징)
	@Override
	public int listCount(SearchCriteria scri) throws Exception {
		return sqlSession.selectOne("boardMapper.listCount",scri);
	}

	
	@Override
	public BoardVO read(int boardno) throws Exception {
		
		return sqlSession.selectOne("boardMapper.read", boardno);
	}
	
	
	
	// 게시물 수정
	@Override
	public void update(BoardVO boardvo) throws Exception {
		
		sqlSession.update("boardMapper.update", boardvo);
	}

	// 게시물 삭제
	@Override
	public void delete(int boardno) throws Exception {
		
		sqlSession.delete("boardMapper.delete", boardno);
	}

	
	

	
}