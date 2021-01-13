package kr.co.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import kr.co.vo.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void register(MemberVO vo) throws Exception;
	
	
	//로그인
	public MemberVO login(MemberVO vo) throws Exception;
	
	// 아이디 중복체크
	public int idChk(MemberVO vo) throws Exception;
	
	// 회원정보 수정
	public void memberUpdate(MemberVO vo)throws Exception;
	
	// 회원 탈퇴
	public void memberDelete(MemberVO vo)throws Exception;

	// 패스워드 체크
	public int passChk(MemberVO vo) throws Exception;
	
	// 아이디 찾기
	public MemberVO memberSrc(MemberVO vo) throws Exception;
	
	public MemberVO findId(MemberVO vo) throws Exception;
	
	   // 01. 전체 회원 목록 조회
    public List<MemberVO> memberList() throws Exception;
	
    // 03. 회원 정보 상세 조회
    public MemberVO memberView(String userid) throws Exception;

    

}