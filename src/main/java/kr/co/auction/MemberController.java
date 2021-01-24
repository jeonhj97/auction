package kr.co.auction;


import java.util.List;
import java.util.Random;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.service.MemberService;
import kr.co.util.Email;
import kr.co.util.EmailSender;
import kr.co.vo.MemberVO;

@Controller
@RequestMapping("/member/*")
public class MemberController {

	 private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Inject
	MemberService service;
	
	 @Autowired
	   private EmailSender emailSender;
	    
   @Autowired
   private Email email;
	
	
	// 회원가입 get
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public String getRegister() throws Exception {
		
		return "/member/register";
	}
	

	
	// 회원가입 post
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String postRegister(MemberVO vo) throws Exception {
	
		int result = service.idChk(vo);
		try {
			if(result == 1) {
				return "/member/register";
			}else if(result == 0) {
				service.register(vo);
			}
			// 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
			// 존재하지 않는다면 -> register
		} catch (Exception e) {
			throw new RuntimeException();
		}
		return "redirect:/member/login";
	}
	 
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() throws Exception{
		return "/member/login";
	}
	
	// 로그인
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
		
		
		HttpSession session = req.getSession();
		MemberVO login = service.login(vo);
		
		
		if(login == null) {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
		}else {
			session.setAttribute("member", login);
			
		}
		return "redirect:/member/login";
	}
	
	
	
		
	@RequestMapping(value = "/mypageView", method = RequestMethod.GET)
	public String mypageView() throws Exception{
		return "/member/mypageView";
	}
	
	
	
	
	
	
	
	
	
	
	
	// 로그아웃
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	// 아이디 중복 체크
	@ResponseBody
	@RequestMapping(value="/idChk", method = RequestMethod.POST)
	public int idChk(MemberVO vo) throws Exception {
		int result = service.idChk(vo);
		return result;
	}
	
	// 패스워드 체크
	@ResponseBody
	@RequestMapping(value="/passChk", method = RequestMethod.POST)
	public int passChk(MemberVO vo) throws Exception {
		int result = service.passChk(vo);
		return result;
	}
	
	// 회원 정보 수정
	@RequestMapping(value="/memberUpdate", method = RequestMethod.GET)
	public String registerUpdate() throws Exception{
		
		return "member/memberUpdate";
	}

	@RequestMapping(value="/memberUpdate", method = RequestMethod.POST)
	public String registerUpdate(MemberVO vo, HttpSession session) throws Exception{
		
		service.memberUpdate(vo);
		
		session.invalidate();
		
		return "redirect:/member/login";
	}
	
	// 회원 탈퇴 get
		@RequestMapping(value="/memberDeleteView", method = RequestMethod.GET)
		public String memberDeleteView() throws Exception{
			return "member/memberDeleteView";
		}
		
		// 회원 탈퇴 post
		@RequestMapping(value="/memberDelete", method = RequestMethod.POST)
		public String memberDelete(MemberVO vo, HttpSession session, RedirectAttributes rttr) throws Exception{
			
			// 세션에 있는 member를 가져와 member변수에 넣어줍니다.
			MemberVO member = (MemberVO) session.getAttribute("member");
			// 세션에있는 비밀번호
			String sessionPass = member.getUpw();
			// vo로 들어오는 비밀번호
			String voPass = vo.getUpw();
			
			if(!(sessionPass.equals(voPass))) {
				rttr.addFlashAttribute("msg", false);
				return "redirect:/member/memberDeleteView";
			}
			service.memberDelete(vo);
			session.invalidate();
			return "redirect:/";
		}
		
		// 아이디 찾기 GET
		@RequestMapping(value = "/memberSrc", method = RequestMethod.GET)
		public String memberSrc() throws Exception{
			return "/member/memberSrc";
		}
		// 아이디 찾기 POST
		@RequestMapping(value = "/memberSrc", method = RequestMethod.POST)
		public String memberSrc(MemberVO vo, HttpServletRequest req, RedirectAttributes rttr) throws Exception{
			
			HttpSession session = req.getSession();
			MemberVO memberSrc = service.memberSrc(vo);
			
			if(memberSrc == null) { // 기본값, 잘못된 입력
				session.setAttribute("member", null);
				rttr.addFlashAttribute("msg", false);
			}else { // 옳은 입력값
				session.setAttribute("member", memberSrc);
			}
			return "redirect:/member/memberSrc";
		}
		
		// 아이디 찾기 폼 GET?
		@RequestMapping(value = "/findId")
		public String findId() throws Exception{
			return "/member/findId";
		}

		// 아이디 찾기 POST?
		
	      @RequestMapping(value= "/findId", method = RequestMethod.POST)
	       public String findId(Model model, MemberVO vo, RedirectAttributes rttr) throws Exception{
	          MemberVO findId = service.findId(vo);
	          
	         if(findId == null) { // 기본값, 잘못된 입력
	            rttr.addFlashAttribute("msg", false);
	         }else { // 옳은 입력값
	            rttr.addFlashAttribute("dto", findId);
	         }
	           return "redirect:/member/findId";
	       }
		
		
		
		
		
	    // 01 회원 목록
	    // url pattern mapping
	    @RequestMapping("/memberList")
	    public String memberList(Model model) throws Exception{
	    // controller => service => dao 요청
	        List<MemberVO> list = service.memberList();
	        model.addAttribute("list", list);
	        return "member/memberList";
	    }
		
	    // 03 회원 상세정보 조회
	    @RequestMapping("/memberView")
	    public String memberView(String userid, Model model) throws Exception{
	        // 회원 정보를 model에 저장
	        model.addAttribute("dto", service.memberView(userid));
	        //System.out.println("클릭한 아이디 확인 : "+userId);
	        logger.info("클릭한 아이디 : "+userid);
	        // member_view.jsp로 포워드
	        return "member/memberView";
	    }
	    
	    // 비번찾기
	    
		@RequestMapping(value = "/findPw")
		public String findPw() throws Exception{
			return "/member/findPw";
		}

	    @RequestMapping(value= "/findPw", method = RequestMethod.POST)
	    public String findPw(HttpSession session, Model model, MemberVO vo, RedirectAttributes rttr) throws Exception{
	    	MemberVO findPw = service.findPw(vo);
	    	
			if(findPw == null) { // 기본값, 잘못된 입력
				rttr.addFlashAttribute("msg", false);
			}else { // 옳은 입력값
				rttr.addFlashAttribute("dto", findPw);
				Random r = new Random();
				int num = r.nextInt(89999) + 10000;
				String npassword = "bapsi" + Integer.toString(num);// 새로운 비밀번호 변경
				vo.setUpw(npassword);
				session.setAttribute("vo", vo);
				service.newPassword(vo);
			}
			
	        // 회원 정보를 model에 저장
	       
	        //System.out.println("클릭한 아이디 확인 : "+userId);
	        // member_view.jsp로 포워드
	        return "redirect:/member/findPw";
	    }
	    
	    // 새로운 비번만들기


	// 새로운 비밀번호가 생성된다. (위에것과 합침)
	/*
	 * @RequestMapping("/newPw") public String newPassword(@Valid MemberVO vo,
	 * HttpSession session) throws Exception { Random r = new Random(); int num =
	 * r.nextInt(89999) + 10000; String npassword = "bapsi" +
	 * Integer.toString(num);// 새로운 비밀번호 변경 vo.setUpw(npassword);
	 * session.setAttribute("vo", vo); service.newPassword(vo);
	 * 
	 * return "member/sendMail";
	 * 
	 * }
	 */



		// 이메일로 비밀번호가 전송이된다.
		@RequestMapping("/sendMail")
		public String findPasswordOK(MemberVO vo, HttpSession session) throws Exception {

			vo = (MemberVO) session.getAttribute("vo");

				email.setContent("새로운 비밀번호 " + vo.getUpw() + " 입니다.");
				email.setReceiver(vo.getEmail());
				email.setSubject("안녕하세요"+vo.getUserid() +"님  재설정된 비밀번호를 확인해주세요");
				emailSender.SendEmail(email);
				System.out.println(email);
				session.invalidate();
				return "/member/login";
		}





}
