package kr.co.auction;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.SangpoomcService;
import kr.co.vo.IpchalVO;
import kr.co.vo.NakchalVO;
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
	

	//리스트
	@RequestMapping(value="list",method= RequestMethod.GET )
	public String list(SangpoomcVO sangpoomcvo,Model model)throws Exception{
		
		model.addAttribute("list",service.list());//이것도 받아오는거잖아
		
		return "sangpoomc/list";
	}
	
	
	//게시물조회
	@RequestMapping(value="readView",method= RequestMethod.GET )
	public String read(SangpoomcVO sangpoomcvo,Model model)throws Exception{
		
		model.addAttribute("read",service.read(sangpoomcvo.getSno()));//이것도 받아오는거잖아
		
		System.out.println("----" + service.read(sangpoomcvo.getSno()));
		
		return "sangpoomc/readView";
	}
	
	
	//입찰
	@RequestMapping(value="ipchalView",method= RequestMethod.GET )
	public String ipchalView(Model model,SangpoomcVO sangpoomcvo)throws Exception{
		
		model.addAttribute("ipchal",service.read(sangpoomcvo.getSno()));//이것도 받아오는거잖아
		
		
		//service.read(sno);
		
		//System.out.println("----" + service.read(sangpoomcvo.getSno()));
		
		
		
		return "sangpoomc/ipchalView";
	}
	
	
	@RequestMapping(value="ipchal",method= RequestMethod.POST )
	public String ipchal(IpchalVO ipchalvo)throws Exception{
		
		
		service.ipchal(ipchalvo);
		
		return "redirect:/sangpoomc/list";
	}
	
	
	@RequestMapping(value="mypageView",method= RequestMethod.GET )
	public String ipchallist(Model model, IpchalVO ipchalvo, NakchalVO nakchalvo)throws Exception{
		
		model.addAttribute("ipchallist",service.ipchallist());
		model.addAttribute("nakchallist",service.nakchallist());
		
		//System.out.println("----" + service.ipchallist());

		return "sangpoomc/mypageView";
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
