package kr.co.auction;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.MemberService;
import kr.co.service.SangpoomcService;
import kr.co.vo.Criteria;
import kr.co.vo.IpchalVO;
import kr.co.vo.MemberVO;
import kr.co.vo.NakchalVO;
import kr.co.vo.PageMaker;
import kr.co.vo.SangpoomVO;
import kr.co.vo.SangpoomcVO;

@Controller
@RequestMapping("/sangpoomc/*")
public class SangpoomcController {
	
	public SangpoomcController() {
		System.out.println("----SangpoomcController()객체생성됨.");
	}//sTableController() end
	
	
	@Inject
	SangpoomcService service;
	
	@Inject
	MemberService memberservice;
	

	//리스트
	@RequestMapping(value="list",method= RequestMethod.GET )
	public String list(SangpoomcVO sangpoomcvo,Model model)throws Exception{
		
		model.addAttribute("list",service.list());//이것도 받아오는거잖아
		
		return "sangpoomc/list";
	}
	
	
	//게시물조회
	@RequestMapping(value="readView",method= RequestMethod.GET )
	public String read(SangpoomcVO sangpoomcvo,Model model,IpchalVO ipchalvo)throws Exception{
		
		model.addAttribute("read",service.read(sangpoomcvo.getSno()));//이것도 받아오는거잖아
		model.addAttribute("count",service.count(ipchalvo));
		
		System.out.println("----" + service.read(sangpoomcvo.getSno()));
		
		return "sangpoomc/readView";
	}
	
	
	
	
	
	//입찰
	@RequestMapping(value="ipchalView",method= RequestMethod.GET )
	public String ipchalView(Model model,SangpoomcVO sangpoomcvo,IpchalVO ipchalvo)throws Exception{
		
		model.addAttribute("ipchal",service.read(sangpoomcvo.getSno()));//이것도 받아오는거잖아
		model.addAttribute("count",service.count(ipchalvo));
		
		//service.read(sno);
		
		//System.out.println("----" + service.read(sangpoomcvo.getSno()));
		
		
		
		return "sangpoomc/ipchalView";
	}
	
	//입찰 post
	@RequestMapping(value="ipchal",method= RequestMethod.POST )
	public String ipchal(IpchalVO ipchalvo)throws Exception{
		
		
		service.ipchal(ipchalvo);
		
		return "redirect:/sangpoomc/list";
	}
	
	
	//입찰내역
	@RequestMapping(value="mypageView",method= RequestMethod.GET )
	public String ipchallist(Model model, IpchalVO ipchalvo, Criteria cri,SangpoomcVO sangpoocvo)throws Exception{
		
		model.addAttribute("ipchallist",service.ipchallist(cri));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.listcount());
		
		model.addAttribute("pageMaker", pageMaker);
		
		
		

		return "sangpoomc/mypageView";
	}
	
	
	@RequestMapping(value="nakchalView",method= RequestMethod.GET )
	public String ipchallist(Model model, NakchalVO nakchalvo, Criteria cri)throws Exception{
		
		
		model.addAttribute("nakchallist",service.nakchallist(cri));
		
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(service.nakchalcount());
		
		model.addAttribute("pageMaker", pageMaker);
		//System.out.println("----" + service.ipchallist());

		return "sangpoomc/nakchalView";
	}
	
	
	
	
	
	
	
	
	@RequestMapping(value="nakchal", method = RequestMethod.POST)
	public String nakchal(NakchalVO nakchalvo,Model model,SangpoomcVO sangpoomcvo)throws Exception{
		
		//System.out.println("=============" + nakchalvo);
		//System.out.println("=============" + sangpoomcvo);
		
		
		service.nakchal(nakchalvo);
		service.statusupdate(sangpoomcvo);
		
		
		
		return "redirect:/sangpoomc/list";
		
	}
	
	
	
	@RequestMapping(value="delete", method = RequestMethod.POST)
	public String delete(SangpoomcVO sangpoomcvo)throws Exception{
		
		service.sangpoomcdelete(sangpoomcvo.getSno());	
		
		System.out.println("------"+sangpoomcvo.getSno());
				
		return "redirect:/sangpoom/list"; 		
	}
	
	@RequestMapping(value="statusupdate",method = RequestMethod.POST)
	public String statusupdate(SangpoomcVO sangpoomcvo)throws Exception{
		
		service.statusupdate(sangpoomcvo);
		
		return"redirect:/sangpoomc/list";
	}
	
	
	
	
	
	
	
	
}
