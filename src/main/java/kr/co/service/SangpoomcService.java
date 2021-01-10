package kr.co.service;

import java.util.List;

import kr.co.vo.IpchalVO;
import kr.co.vo.NakchalVO;
import kr.co.vo.SangpoomcVO;

public interface SangpoomcService {

	//리스트
	public List<SangpoomcVO> list() throws Exception;
	
	//게시물 조회
	public SangpoomcVO read(int sno)throws Exception;
	
	//입찰
	public void ipchal(IpchalVO ipchalvo)throws Exception;
	
	//마이페이지 입찰
	public List<IpchalVO> ipchallist()throws Exception;
	
	//입찰
	public void nakchal(NakchalVO nakchalvo)throws Exception;
		
	//마이페이지 입찰
	public List<NakchalVO> nakchallist()throws Exception;
	
	
}
