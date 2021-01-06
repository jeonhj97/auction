package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Inject MemberDAO dao;
	
	@Override
	public void register(MemberVO vo) throws Exception {
		
		dao.register(vo);
		
	}
	
	//로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
	return dao.login(vo);
	}
	
	// 아이디 중복 체크
	@Override
	public int idcheck(MemberVO vo) throws Exception {
		int result = dao.idcheck(vo);
		return result;
	}
}