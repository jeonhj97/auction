package kr.co.dao;

import java.util.List;

import kr.co.vo.SangpoomVO;


public interface SangpoomDAO {
	
	
	
	//관리자페이지에서 상품올리기
	public void write(SangpoomVO sangpoomvo)throws Exception;
	
	//리스트
	public List<SangpoomVO> list() throws Exception;
	
	//게시물 조회
	public SangpoomVO read(int sno)throws Exception;
	
	//게시물 수정
	public void update(SangpoomVO sangpoomvo)throws Exception;
	
	//게시물 삭제
	public void delete(int sno)throws Exception;
	
	
	
	

}//class end
