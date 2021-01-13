package kr.co.service;

import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;


import org.springframework.stereotype.Service;

import kr.co.dao.MemberDAO;
import kr.co.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Inject
	MemberDAO dao;

	@Override
	public void register(MemberVO vo) throws Exception {

		dao.register(vo);

	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) throws Exception {
		return dao.login(vo);
	}

	// 아이디 중복 체크
	@Override
	public int idChk(MemberVO vo) throws Exception {
		int result = dao.idChk(vo);
		return result;
	}

	// Controller에서 보내는 파라미터들을 memberUpdate(MemberVO vo)로 받고
	@Override
	public void memberUpdate(MemberVO vo) throws Exception {

		// 받은 vo를 DAO로 보내줍니다.
		dao.memberUpdate(vo);

	}

	@Override
	public void memberDelete(MemberVO vo) throws Exception {
		dao.memberDelete(vo);
	}

	// 패스워드 체크
	@Override
	public int passChk(MemberVO vo) throws Exception {
		int result = dao.passChk(vo);
		return result;
	}

	// 아이디 찾기
	@Override
	public MemberVO memberSrc(MemberVO vo) throws Exception {
		return dao.memberSrc(vo);
	}
	
	// 아이디 찾기
	@Override
	public MemberVO findId(MemberVO vo) throws Exception {
		return dao.findId(vo);
	}

	   // 01. 전체 회원 목록 조회
    @Override
    public List<MemberVO> memberList() throws Exception {
        return dao.memberList();
    }
    
    // 03. 회원 정보 상세 조회 
    @Override
    public MemberVO memberView(String userid) throws Exception {
        return dao.memberView(userid);
    }
 


}