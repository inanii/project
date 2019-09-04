package kr.co.ziziza.manager.join;

import java.io.IOException;
import java.io.PrintWriter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.util.FileUtil;
import kr.co.ziziza.common.vo.FileVO;



@Controller
public class MngJoinController {
	
	@Autowired
	MngJoinService service;	
	
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private FileUtil fileUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(MngJoinController.class);
	
	@RequestMapping(value="/mng/company/join" ,method=RequestMethod.GET)
	public String join() {
		logger.info("join");
		return "manager/join/join_form";
	}//join
	
	@RequestMapping(value="/mng/company/joinInsert" ,method=RequestMethod.POST)
	public void joinInsert(MngMemberJoinVO vo, MngManagerJoinVO vo2, PrintWriter out, MultipartFile attachment) {
		logger.info("joinInsert");
		int count = 0;
		vo.setPassword(passwordEncoder.encode(vo.getPassword())); 
		count = service.joinMember(vo);
		vo2.setMemberNo(vo.getMemberNo());
		count = service.joinManager(vo2); 
		if(attachment != null && attachment.getSize() > 0) {		//사업자등록증
			FileVO fileVO = fileUtil.saveFile(attachment, "MANAGER", vo2.getMngNo());
			if(fileVO != null) fileService.insertInfo(fileVO);
		}//if end
		out.print(count);
		out.flush();
		out.close();
	}//joinInsert
	
	@RequestMapping(value = "/mng/company/joinIdChk", method = RequestMethod.POST)
	public void joinIdCheck(MngMemberJoinVO vo, PrintWriter out) throws IOException {
		logger.info("id Check");
		int count = 0;
		count = service.joinIdCheck(vo);
		out.print(count);
		out.flush();
		out.close();
	}//joinIdCheck
}//
