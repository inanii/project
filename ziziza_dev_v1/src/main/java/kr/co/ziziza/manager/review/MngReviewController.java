package kr.co.ziziza.manager.review;

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
import kr.co.ziziza.main.board.ReplyVO;
import kr.co.ziziza.main.company.ReviewVO;

@Controller
public class MngReviewController {
	
	@Autowired
	MngReviewService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MngReviewController.class);

	@RequestMapping(value="/mng/company/review" ,method=RequestMethod.GET)
	public String reviewForm(Model model, ReviewVO vo, PagingUtil page) {
		logger.info("reviewForm");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		int totalItems = service.selectTotalCnt(params);
		page.setTotalItems(totalItems);
		params.put("page", page);
		List<ReviewVO> list = service.selectReviewList(params);
		model.addAttribute("reviewList", list);
		model.addAttribute("page", page);
		return "manager/review/review_list_form";
	}//login
}//class
