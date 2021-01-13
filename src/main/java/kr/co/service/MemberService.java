package kr.co.service;


import java.util.List;
import java.util.Map;

import org.springframework.dao.support.DaoSupport;

import kr.co.vo.MemberVO;

import kr.co.dao.MemberDAO;

public interface MemberService {

	public void register(MemberVO vo) throws Exception;
	
	public MemberVO login(MemberVO vo) throws Exception;
	
	public int idChk(MemberVO vo) throws Exception;
	
	public void memberUpdate(MemberVO vo) throws Exception;
	
	public void memberDelete(MemberVO vo) throws Exception;
	
	public int passChk(MemberVO vo) throws Exception;
	
	public MemberVO memberSrc(MemberVO vo) throws Exception;
	
	public MemberVO findId(MemberVO vo) throws Exception;
	
    // 01. 전체 회원 목록 조회
    public List<MemberVO> memberList() throws Exception; 
	
	public MemberVO memberView(String userid) throws Exception;
	
  

}