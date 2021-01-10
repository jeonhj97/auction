package kr.co.auction;

import java.io.File;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import kr.co.service.SangpoomService;
import kr.co.util.UploadFileUtils;
import kr.co.vo.SangpoomVO;

@Controller
@RequestMapping("/sangpoom/*")
public class SangpoomController {
	
	public SangpoomController() {
		System.out.println("----SangpoomController()객체생성됨.");
	}//sTableController() end
	
	
	
	
	@Inject
	SangpoomService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	
	
	
	@RequestMapping(value="writeView", method=RequestMethod.GET)
	public void writeView() throws Exception{

	}//writeView() end
	
	
	@RequestMapping(value="write", method=RequestMethod.POST)
	public String write(SangpoomVO sangpoomvo,MultipartFile file)throws Exception{
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		String fileName = null;

		if(file != null) {
		 fileName =UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath); 
		} else {
		 fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
		}

		sangpoomvo.setImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		sangpoomvo.setThumbimg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		
		
		service.write(sangpoomvo);
				
		return "redirect:/sangpoom/list";//이거하면 홈컨트롤러에서 index로 가게해줌 나중에 리스트로 주소 변경해야됨

	}
	
	
	
	@RequestMapping(value="list",method= RequestMethod.GET )
	public String list(SangpoomVO sangpoomvo,Model model)throws Exception{
		
		model.addAttribute("list",service.list());//이것도 받아오는거잖아
		
		
		return "sangpoom/list";
	}
	
	
	@RequestMapping(value="readView",method= RequestMethod.GET )
	public String read(SangpoomVO sangpoomvo,Model model)throws Exception{
		
		model.addAttribute("read",service.read(sangpoomvo.getSno()));//이것도 받아오는거잖아
		
		
		
		return "sangpoom/readView";
	}
	
	
	//게시판 수정뷰
	@RequestMapping(value="updateView",method= RequestMethod.GET )
	public String updateView(SangpoomVO sangpoomvo,Model model)throws Exception{
		
		model.addAttribute("update",service.read(sangpoomvo.getSno()));//이것도 받아오는거잖아
		
		
		return "sangpoom/updateView";
	}
	
	//게시판 수정
	@RequestMapping(value="update",method= RequestMethod.POST )
	public String update(SangpoomVO sangpoomvo)throws Exception{
		
		service.update(sangpoomvo);//이거는주는거
		
		
		return "redirect:/sangpoom/list";
	}
	
	
	//게시판 삭제
	@RequestMapping(value="delete",method = RequestMethod.POST)
	public String delete(SangpoomVO sangpoomvo)throws Exception {
		
		service.delete(sangpoomvo.getSno());
		
		return "redirect:/sangpoom/list"; 
	}
	
	
	
	
	
	
	
	
	
	
	

}//class end
