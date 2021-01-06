package kr.co.auction;

import java.util.List;

import javax.inject.Inject;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.BoardService;
import kr.co.service.MemberService;
import kr.co.service.ReplyService;
import kr.co.vo.BoardVO;
import kr.co.vo.Criteria;
import kr.co.vo.MemberVO;
import kr.co.vo.PageMaker;
import kr.co.vo.ReplyVO;
import kr.co.vo.SearchCriteria;

@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	public BoardController() {
		System.out.println("----BoardController()객체생성됨.");
	}//sTableController() end
	

	
	
	@Inject
	BoardService service;
	
	@Inject
	ReplyService replyservice;
	
	@Inject
	MemberService memberservice;
	
	// 게시판 글 작성 화면
	@RequestMapping(value = "writeView", method = RequestMethod.GET)
	public void writeView(Model model,MemberVO vo) throws Exception{
		
		model.addAttribute(memberservice.login(vo));
		
	}
	
	// 게시판 글 작성
	@RequestMapping(value = "write", method = RequestMethod.POST)
	public String write(BoardVO boardvo) throws Exception{
		
		
		service.write(boardvo);
		
		return "redirect:/board/list";
	}
	
	
	// 게시판 목록 조회
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String list(Model model, SearchCriteria scri) throws Exception{
	
		
		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
		
		return "board/list";
		
	}
	
	// 게시판 조회
	@RequestMapping(value = "readView", method = RequestMethod.GET)
	public String read(BoardVO boardvo, Model model, SearchCriteria scri) throws Exception{
		
		
		model.addAttribute("read", service.read(boardvo.getBoardno()));
		model.addAttribute("scri",scri);
		
		List<ReplyVO> replyList = replyservice.readReply(boardvo.getBoardno());
		model.addAttribute("replyList",replyList);
		
		return "board/readView";
	}
	
	
	//댓글 작성
	@RequestMapping(value="replyWrite", method = RequestMethod.POST)
	public String replyWrite(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
	replyservice.writeReply(vo);
	
	rttr.addAttribute("boardno", vo.getBoardno());
	rttr.addAttribute("page", scri.getPage());
	rttr.addAttribute("perPageNum", scri.getPerPageNum());
	rttr.addAttribute("searchType", scri.getSearchType());
	rttr.addAttribute("keyword", scri.getKeyword());
	
	
	return "redirect:/board/readView";
	}
	
	
	// 게시판 수정뷰
	@RequestMapping(value = "updateView",  method = {RequestMethod.GET, RequestMethod.POST})
	public String updateView(BoardVO boardvo, Model model,SearchCriteria scri) throws Exception{
		model.addAttribute("update", service.read(boardvo.getBoardno()));
		model.addAttribute("scri", scri);
		//System.out.println(service.read(boardvo.getBoardno()));	
		return "/board/updateView";	
	}//updateView() end
	
	
	
	// 게시판 수정
	@RequestMapping(value = "update", method = RequestMethod.POST)
	public String update(BoardVO boardvo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	
		
		service.update(boardvo);
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}

	// 게시판 삭제
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public String delete(BoardVO boardvo, SearchCriteria scri, RedirectAttributes rttr) throws Exception{
	
		
		service.delete(boardvo.getBoardno());
		
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/list";
	}	
	
	
	//댓글 수정 GET
	@RequestMapping(value="replyUpdateView", method = RequestMethod.GET)
	public String replyUpdateView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		
		
		model.addAttribute("replyUpdate", replyservice.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		
		return "board/replyUpdateView";
	}
	
	//댓글 수정 POST
	@RequestMapping(value="replyUpdate", method = RequestMethod.POST)
	public String replyUpdate(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		
		replyservice.updateReply(vo);
		
		rttr.addAttribute("boardno", vo.getBoardno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
	//댓글 삭제 GET
	@RequestMapping(value="replyDeleteView", method = RequestMethod.GET)
	public String replyDeleteView(ReplyVO vo, SearchCriteria scri, Model model) throws Exception {
		
		
		model.addAttribute("replyDelete", replyservice.selectReply(vo.getRno()));
		model.addAttribute("scri", scri);
		

		return "board/replyDeleteView";
	}
	
	//댓글 삭제
	@RequestMapping(value="replyDelete", method = RequestMethod.POST)
	public String replyDelete(ReplyVO vo, SearchCriteria scri, RedirectAttributes rttr) throws Exception {
		
		
		replyservice.deleteReply(vo);
		
		rttr.addAttribute("boardno", vo.getBoardno());
		rttr.addAttribute("page", scri.getPage());
		rttr.addAttribute("perPageNum", scri.getPerPageNum());
		rttr.addAttribute("searchType", scri.getSearchType());
		rttr.addAttribute("keyword", scri.getKeyword());
		
		return "redirect:/board/readView";
	}
	
													
	
	
	
	
	
	
}//class end