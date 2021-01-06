package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;


import kr.co.dao.SangpoomcDAO;
import kr.co.vo.IpchalVO;
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

	//입찰
	@Override
	public void ipchal(IpchalVO ipchalvo) throws Exception {
		dao.ipchal(ipchalvo);
		
	}

	//마이페이지 입찰내역
	@Override
	public List<IpchalVO> ipchallist() throws Exception {
		
		return dao.ipchallist();
	}
	
	
	
}//class end
