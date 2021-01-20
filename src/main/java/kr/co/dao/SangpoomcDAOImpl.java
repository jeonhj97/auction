package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.Criteria;
import kr.co.vo.IpchalVO;
import kr.co.vo.NakchalVO;
import kr.co.vo.SangpoomVO;
import kr.co.vo.SangpoomcVO;
import kr.co.vo.WishVO;

@Repository
public class SangpoomcDAOImpl implements SangpoomcDAO{

	@Inject 
	private SqlSession sqlSession;
	
	
	//게시물 목록조회
	@Override
	public List<SangpoomcVO> list() throws Exception{
		return sqlSession.selectList("sangpoomcMapper.list");
	}//list end
	
	
	@Override
	public SangpoomcVO read(int sno) throws Exception {
		
		return sqlSession.selectOne("sangpoomcMapper.read",sno);
	}//read end
	
	//그림만 가져오기
	@Override
	public SangpoomcVO selectimg(int sno) throws Exception {
		return sqlSession.selectOne("sangpoomcMapper.selectimg",sno);
	}
	

	
	
	
	
	//입찰
	@Override
	public void ipchal(IpchalVO ipchalvo)throws Exception {
		
		sqlSession.insert("sangpoomcMapper.ipchalinsert",ipchalvo);
	}//ipchal end


	//마이페이지 입찰목록
	@Override
	public List<IpchalVO> ipchallist(Criteria cri) throws Exception {
		
		return sqlSession.selectList("sangpoomcMapper.mypagelist",cri);
	}
		
	//게시물의 총갯수
	@Override
	public int listcount() throws Exception {
		
		return sqlSession.selectOne("sangpoomcMapper.listCount");
	}
	


	//낙찰입력
	@Override
	public void nakchal(NakchalVO nakchalvo) throws Exception {
		sqlSession.insert("sangpoomcMapper.nakchalinsert",nakchalvo);
	}

	//마이페이지 낙찰 리스트
	@Override
	public List<NakchalVO> nakchallist(Criteria cri) throws Exception {
		
		return sqlSession.selectList("sangpoomcMapper.nakchalmypage",cri);
	}

	//삭제
	@Override
	public void sangpoomcdelete(int sno) throws Exception {
		sqlSession.delete("sangpoomcMapper.nakchaldelete",sno);
		
	}


	//상테ing->end
	@Override
	public void statusupdate(SangpoomcVO sangpoomcvo) throws Exception {
		sqlSession.update("sangpoomcMapper.statusupdate",sangpoomcvo);
		
	}

	//카운트
	@Override
	public int count(IpchalVO ipchalvo) throws Exception {
		
		return sqlSession.selectOne("sangpoomcMapper.count",ipchalvo);
	}

	//낙찰목록에서 게시물총갯수
	@Override
	public int nakchalcount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("sangpoomcMapper.nakchalCount");
	}

	
	

	 // 1. 장바구니 추가
    @Override
    public void wishinsert(WishVO vo) {
        sqlSession.insert("sangpoomcMapper.wishinsert", vo);
    }
    // 2. 장바구니 목록
    @Override
    public List<WishVO> wishlist(String userid) {
        return sqlSession.selectList("sangpoomcMapper.wishlist", userid);
    }
    // 3. 장바구니 삭제
    @Override
    public void wishdelete(WishVO vo) {
        sqlSession.delete("sangpoomcMapper.wishdelete", vo);
    }

    // 6. 장바구니 동일한 상품 레코드 확인
    @Override
    public int wishcount(WishVO vo) {
        
        return sqlSession.selectOne("sangpoomcMapper.wishcount", vo);
    }


	
	
	
	
	
}
