package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import kr.co.dao.SangpoomcDAO;
import kr.co.vo.Criteria;
import kr.co.vo.IpchalVO;
import kr.co.vo.NakchalVO;
import kr.co.vo.SangpoomVO;
import kr.co.vo.SangpoomcVO;


@Service
public class SangpoomcServiceImpl implements SangpoomcService{

	@Inject
	private SangpoomcDAO dao;
	
	
	//리스트
	@Override
	public List<SangpoomcVO> list() throws Exception {		
		return dao.list();
	}
	
	//게시물 조회
	@Override
	public SangpoomcVO read(int sno) throws Exception {
		
		return dao.read(sno);
	}
	
	//그림만 가져오기
	@Override
	public SangpoomcVO selectimg(int sno) throws Exception {
		return dao.selectimg(sno);
		
	}
	
	
	
	

	//입찰
	@Override
	public void ipchal(IpchalVO ipchalvo) throws Exception {
		dao.ipchal(ipchalvo);
		
	}

	//마이페이지 입찰내역
	@Override
	public List<IpchalVO> ipchallist(Criteria cri) throws Exception {
		
		return dao.ipchallist(cri);
	}
	
	//게시물의 총갯수
	@Override
	public int listcount() throws Exception {
		
		return dao.listcount();
	}
	

	//낙찰
	@Override
	public void nakchal(NakchalVO nakchalvo) throws Exception {
		
		dao.nakchal(nakchalvo);
		
	}

	//마이페이지 낙찰
	@Override
	public List<NakchalVO> nakchallist(Criteria cri) throws Exception {
		
		return dao.nakchallist(cri);
	}
	
	@Override
	public int nakchalcount() throws Exception {
		
		return dao.nakchalcount();
	}
	
	
	
	
	
	
	

	@Override
	public void sangpoomcdelete(int sno) throws Exception {
		dao.sangpoomcdelete(sno);
		
	}

	//상태수정
	@Override
	public void statusupdate(SangpoomcVO sangpoomcvo) throws Exception {
		dao.statusupdate(sangpoomcvo);
		
	}

	@Override
	public int count(IpchalVO ipchalvo) throws Exception {
		
		return dao.count(ipchalvo);
	}

	

	

	
	
	
	
}//class end
