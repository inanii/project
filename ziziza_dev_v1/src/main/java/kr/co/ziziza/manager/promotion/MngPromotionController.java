package kr.co.ziziza.manager.promotion;

import java.io.PrintWriter;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.manager.join.MngJoinController;

@Controller
public class MngPromotionController {

	@Autowired
	MngPromotionService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MngJoinController.class);
	
	@RequestMapping(value="/mng/company/promotion" ,method=RequestMethod.GET)
	public String promotion(Model model, MngPromotionVO vo) {
		logger.info("promotion");
		List<MngPromotionVO> list = service.selectPromotionList(vo);
		model.addAttribute("list", list);
		return "manager/promotion/promotion_form";
	}//promotion
	
	@RequestMapping(value="/mng/company/promotionreply" ,method=RequestMethod.POST)
	public void promotionInsert(MngPromotionVO vo, PrintWriter out) {
		int count = 0;
		count = service.promotionInsert(vo);
		out.print(count);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/mng/company/promotionDelete" ,method=RequestMethod.GET)
	public void promotionDelete(MngPromotionVO vo, PrintWriter out) {
		int count = 0;
		count = service.promotionDelete(vo);
		out.print(count);
		out.flush();
		out.close();
	}
}
