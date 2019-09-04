package kr.co.ziziza.manager.main;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.manager.join.MngJoinController;

@Controller
public class MngMainController {

//	@Autowired
//	MngJoinService service;
	
	private static final Logger logger = LoggerFactory.getLogger(MngJoinController.class);
	
	@RequestMapping(value="/mng/main" ,method=RequestMethod.GET)
	public String main() {
		logger.info("main");
		return "manager/main";
	}//join
}
