package kr.co.ziziza.main.event;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.util.PagingUtil;
import kr.co.ziziza.common.vo.FileVO;
import kr.co.ziziza.main.board.BoardVO;


@Controller
public class EventController {
	
	@Autowired
	EventService eventService;
	
	@Autowired
	FileService fileService;
	
	private static final Logger logger = LoggerFactory.getLogger(EventController.class);
	
	
	@RequestMapping(value="/event/list",method=RequestMethod.GET)
	private String list(Model model, PagingUtil page) {
		logger.info("list");
		Map<String, Object> params = new HashMap<String, Object>();
		int totalItems = eventService.selectTotalCnt(params);
		page.setPageSize(8);
		page.setTotalItems(totalItems);
		params.put("page", page);
		List<BoardVO> list = eventService.list(params);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "main/event/list";
	}
	
	@RequestMapping(value="/event/detail",method=RequestMethod.GET)
	private String detail(BoardVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("detail");
		vo = eventService.detail(vo);
		model.addAttribute("detailVO", vo);
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("menuNo", vo.getBoard_no());
		params.put("menuType", "EVENT");
		List<FileVO> files = fileService.selectList(params);
		model.addAttribute("fileList", files);
		
		//조회수 https://developersoo.tistory.com/14
		Cookie[] cookies = request.getCookies();
        
        // 비교하기 위해 새로운 쿠키
        Cookie viewCookie = null;
        int boardNo = vo.getBoard_no();
        // 쿠키가 있을 경우 
        if (cookies != null && cookies.length > 0) 
        {
            for (int i = 0; i < cookies.length; i++)
            {
                // Cookie의 name이 cookie + reviewNo와 일치하는 쿠키를 viewCookie에 넣어줌 
                if (cookies[i].getName().equals("cookie" +  boardNo))
                { 
                    viewCookie = cookies[i];
                }
            }
        }
        
        // 만일 viewCookie가 null일 경우 쿠키를 생성해서 조회수 증가 로직을 처리함.
        if (viewCookie == null) {    
            System.out.println("cookie 없음");
            
            // 쿠키 생성(이름, 값)
            Cookie newCookie = new Cookie("cookie" + boardNo, "|" + boardNo + "|");
                            
            // 쿠키 추가
            response.addCookie(newCookie);

            // 쿠키를 추가 시키고 조회수 증가시킴
            eventService.updateHit(boardNo);
        }
		return "main/event/detail";
	}
}
