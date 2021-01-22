package kr.co.dao;

import java.util.List;

import kr.co.vo.Criteria;
import kr.co.vo.IpchalVO;
import kr.co.vo.NakchalVO;
import kr.co.vo.SangpoomVO;
import kr.co.vo.SangpoomcVO;
import kr.co.vo.WishVO;

public interface SangpoomcDAO {

	//리스트
	public List<SangpoomcVO> list() throws Exception;
	
	//게시물 조회
	public SangpoomcVO read(int sno)throws Exception;
	//그림만 가져오기
	public SangpoomcVO selectimg(int sno)throws Exception;
	
	
	
	
	
	//입찰
	public void ipchal(IpchalVO ipchalvo)throws Exception;
	
	//마이페이지 입찰
	public List<IpchalVO> ipchallist(Criteria cri)throws Exception;
	
	//게시물의 총갯수
	public int listcount() throws Exception;
	
	//입찰카운트
	public int count(IpchalVO ipchalvo)throws Exception;
	
	
	
	
	
	
	//낙찰
	public void nakchal(NakchalVO nakchalvo)throws Exception;
		
	//마이페이지 낙찰
	public List<NakchalVO> nakchallist(Criteria cri)throws Exception;
	
	//게시물의 총갯수
	public int nakchalcount() throws Exception;
	
	
	
	
	//삭제
	public void nakchaldelete(int sno)throws Exception;
	
	//상태수정
	public void statusupdate(SangpoomcVO sangpoomcvo)throws Exception;
	
	
	
	// 1. 장바구니 추가
    public void wishinsert(WishVO vo) throws Exception;
 // 2. 장바구니 목록
    public List<WishVO> wishlist() throws Exception;
    // 3. 장바구니 삭제
    public void wishdelete(WishVO vo) throws Exception;
    // 장바구니 중복확인
    public int wishcount(WishVO vo) throws Exception;

	
	
	
	
	
	
}
