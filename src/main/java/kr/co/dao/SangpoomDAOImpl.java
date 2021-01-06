package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.SangpoomVO;

@Repository
public class SangpoomDAOImpl implements SangpoomDAO{
	
	@Inject 
	private SqlSession sqlSession;
	//게시물 등록
	@Override
	public void write(SangpoomVO sangpoomvo)throws Exception{
		sqlSession.insert("sangpoomMapper.insert", sangpoomvo);
	}//write end

	//게시물 목록조회
	@Override
	public List<SangpoomVO> list() throws Exception{
		return sqlSession.selectList("sangpoomMapper.list");
	}//list end

	//게시물조회
	@Override
	public SangpoomVO read(int sno) throws Exception {
		
		return sqlSession.selectOne("sangpoomMapper.read",sno);
	}//read end

	//게시물 수정
	@Override
	public void update(SangpoomVO sangpoomvo) throws Exception {
		
		sqlSession.update("sangpoomMapper.update",sangpoomvo);
		
	}

	//게시물 삭제
	@Override
	public void delete(int sno) throws Exception {
		
		sqlSession.delete("sangpoomMapper.delete",sno);
	}
	
	
	
	
	
	
	
	
	
	
	
	

}//class end
