package kr.co.ziziza.main.main;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jca.context.BootstrapContextAware;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.main.board.BoardService;
import kr.co.ziziza.main.board.BoardVO;
import kr.co.ziziza.main.event.EventService;
import kr.co.ziziza.main.notice.NoticeService;


@Controller
public class MainController {
	private static final Logger logger
	= LoggerFactory.getLogger(BootstrapContextAware.class);

	@Autowired
	EventService eventService;
	@Autowired
	BoardService boardService;
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(value= {"/", "/main"}
							,method=RequestMethod.GET)
	public String home(Model model) {
		List<BoardVO> event = eventService.topList();
		model.addAttribute("event", event);
		List<BoardVO> notice = noticeService.topList();
		model.addAttribute("notice", notice);
		List<BoardVO> board = boardService.topList();
		model.addAttribute("board", board);
		return "main/main";
	}//file1
	
	@RequestMapping(value="/main/l",method=RequestMethod.GET)
	private String l() {
		logger.info("=== lll ===");
		return "main/l";
	}//insert
	
}//