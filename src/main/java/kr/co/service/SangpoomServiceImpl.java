package kr.co.service;

import java.util.List;


import javax.inject.Inject;


import org.springframework.stereotype.Service;


import kr.co.dao.SangpoomDAO;

import kr.co.vo.SangpoomVO;

@Service
public class SangpoomServiceImpl implements SangpoomService{
	
	
	
	
	@Inject
	private SangpoomDAO dao;
	
	
	
	
	
	//관리자페이지 상품등록
	@Override
	public void write(SangpoomVO sangpoomvo)throws Exception{
		dao.write(sangpoomvo);
	}//write end

	
	//리스트
	@Override
	public List<SangpoomVO> list() throws Exception {
		
		return dao.list();
	}

	//게시물 조회
	@Override
	public SangpoomVO read(int sno) throws Exception {
		
		return dao.read(sno);
	}

	
	//게시물 수정
	@Override
	public void update(SangpoomVO sangpoomvo) throws Exception {
		
		dao.update(sangpoomvo);
	}

	//게시물 삭제
	@Override
	public void delete(int sno) throws Exception {
		
		dao.delete(sno);
	}
	
	
	
	
	
	

}//class end
