package kr.co.ziziza.manager.info;


import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.util.FileUtil;
import kr.co.ziziza.common.vo.FileVO;


@Controller	
public class MngInfoController {
	@Autowired
	MngInfoService service;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private FileUtil fileUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(MngInfoController.class);
		
		@RequestMapping(value="/mng/company/info" ,method=RequestMethod.GET)
		public String info(Model model, MngMemberInfoVO vo, MngManagerInfoVO vo2) {
			logger.info("info");
			vo = service.selectInfoMember(vo);
			model.addAttribute("MemberVO", vo);
			vo2 = service.selectInfoManager(vo2);
			model.addAttribute("ManagerVO", vo2);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("menuType", "MANAGER");
			params.put("menuNo", vo2.getMngNo());
			model.addAttribute("files", fileService.selectList(params));
			return "manager/info/info_form";
		}//info 
		
		@RequestMapping(value="/mng/company/infoModify" ,method=RequestMethod.GET)
		public String modify(Model model, MngMemberInfoVO vo, MngManagerInfoVO vo2) {
			logger.info("modify");
			vo = service.selectModifyMember(vo);
			model.addAttribute("MemberVO", vo);
			vo2 = service.selectModifyManager(vo2);
			model.addAttribute("ManagerVO", vo2);
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("menuType", "MANAGER");
			params.put("menuNo", vo2.getMngNo());
			model.addAttribute("files", fileService.selectList(params));
			return "manager/info/info_modify_form";
		}//modify
		
		@RequestMapping(value ="/mng/company/infoUpdate", method =RequestMethod.POST)
		public void infoUpdate(MngMemberInfoVO vo, MngManagerInfoVO vo2, PrintWriter out, MultipartFile attachment) {
			logger.info("infoUpdate");
			int count = 0;
			System.out.println(vo.getMemberNo());
			System.out.println(vo2.getMemberNo());
			System.out.println(vo2.getMngNo());
			count = service.memberUpdate(vo);
			count = service.managerUpdate(vo2);
			if(attachment != null && attachment.getSize() > 0) {		//사업자등록증
				FileVO fileVO = fileUtil.saveFile(attachment, "MANAGER", vo2.getMngNo());
				if(fileVO != null) fileService.insertInfo(fileVO);
			}//if end
			out.print(count);
			out.flush();
			out.close();
		}
}
