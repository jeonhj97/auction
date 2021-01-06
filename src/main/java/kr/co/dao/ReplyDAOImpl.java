package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.ReplyVO;

@Repository
public class ReplyDAOImpl implements ReplyDAO{
	
	
	@Inject
	SqlSession sql;

	//댓글목록
	@Override
	public List<ReplyVO> readReply(int boardno) throws Exception {
		
		return sql.selectList("replyMapper.readReply",boardno);
	}

	//댓글작성
	@Override
	public void writeReply(ReplyVO vo) throws Exception {
		
		sql.insert("replyMapper.writeReply",vo);
		
	}

	@Override
	public void updateReply(ReplyVO vo) throws Exception {
		 
		sql.update("replyMapper.updateReply",vo);
		
	}

	@Override
	public void deleteReply(ReplyVO vo) throws Exception {
		sql.delete("replyMapper.deleteReply",vo);
		
	}

	@Override
	public ReplyVO selectReply(int rno) throws Exception {
		
		return sql.selectOne("replyMapper.selectReply",rno);
	}
	
	
	
	
	
	

}
