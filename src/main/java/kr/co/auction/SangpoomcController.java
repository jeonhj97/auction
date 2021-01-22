package kr.co.auction;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.co.service.MemberService;
import kr.co.service.SangpoomcService;
import kr.co.vo.Criteria;
import kr.co.vo.IpchalVO;
import kr.co.vo.MemberVO;
import kr.co.vo.NakchalVO;
import kr.co.vo.PageMaker;
import kr.co.vo.SangpoomVO;
import kr.co.vo.SangpoomcVO;
import kr.co.vo.WishVO;

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
	public String list(SangpoomcVO sangpoomcvo,Model model,IpchalVO ipchalvo )throws Exception{
		
		model.addAttribute("list",service.list());//이것도 받아오는거잖아
		model.addAttribute("count",service.count(ipchalvo));
		
		
		
		//System.out.println(service.count(ipchalvo));
		
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
	public String delete(Model model,NakchalVO nakchalvo)throws Exception{
		
		service.nakchaldelete(nakchalvo.getSno());	
		
				
		return "redirect:/sangpoomc/nakchalView"; 		
	}
	
	@RequestMapping(value="statusupdate",method = RequestMethod.POST)
	public String statusupdate(SangpoomcVO sangpoomcvo)throws Exception{
		
		service.statusupdate(sangpoomcvo);
		
		return"redirect:/sangpoomc/list";
	}
	
	 // 1. 찜하기
    @RequestMapping(value="wishinsert",method = RequestMethod.POST)
    public String insert(WishVO vo,Model model) throws Exception{
       
    	
    	
        // 장바구니에 기존 상품이 있는지 검사
        int count = service.wishcount(vo);
        if(count == 0){
            // 없으면 insert
            service.wishinsert(vo);
        } else {
            // 있으면 딜리트
            service.wishdelete(vo);
        }
        
        model.addAttribute("count",service.wishcount(vo));
        
        //System.out.println(vo.getCno());
        //System.out.println(service.wishcount(vo));


        return "redirect:/sangpoomc/list";
    }

 // 2. 장바구니 목록
    @RequestMapping(value="wishlist", method=RequestMethod.GET)
	public String wishlist(Model model, WishVO vo, SangpoomVO svo)throws Exception{
		
		model.addAttribute("wishlist", service.wishlist());
		

		return "sangpoomc/wishlist";
	}
	
	
	
	
	
	
	
}
