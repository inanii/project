package kr.co.ziziza.manager.qna;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.common.util.PagingUtil;

@Controller
public class MngQnaController {
	
	@Autowired
	MngQnaService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MngQnaController.class);

	@RequestMapping(value="/mng/company/qnalist" ,method=RequestMethod.GET)
	public String qnaListform(Model model, MngQnaVO vo, PagingUtil page) {
		logger.info("qnalistform");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		int totalItems = service.selectTotalCnt(params);
		page.setTotalItems(totalItems);
		params.put("page", page);
		List<MngQnaVO> list = service.selectQnaList(params);
		model.addAttribute("qnaList",list);
		model.addAttribute("page", page);
		return "manager/qna/qna_list_form";
	}//login

	@RequestMapping(value="/mng/company/qnaregist" ,method=RequestMethod.GET)
	public String qnaRegist() {
		logger.info("qnaregist");
		return "manager/qna/qna_regist_form";
	}//qnaregist

	@RequestMapping(value="/mng/company/qnaInsert" ,method=RequestMethod.POST)
	public void qnaInsert(MngQnaVO vo, PrintWriter out) {
		logger.info("qnaInsert");
		int count = 0;	
		count = service.qnaInsert(vo);
		out.print(count);
		out.flush();
		out.close();
	}//qnaInsert
	
	@RequestMapping(value="/mng/company/qnaDelete" ,method=RequestMethod.GET)
	public void qnaDelete(MngQnaVO vo, PrintWriter out) {
		int count = 0;
		count = service.qnaDelete(vo);
		out.print(count);
		out.flush();
		out.close();
	}

}//class
