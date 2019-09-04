package kr.co.ziziza.main.board;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.ziziza.common.util.PagingUtil;
import kr.co.ziziza.common.vo.SearchVO;
import kr.co.ziziza.common.vo.UserVO;





@Controller
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	
	@RequestMapping(value="/board/list",method=RequestMethod.GET)
	private String list(Model model, PagingUtil page, SearchVO search) {
		logger.info("list");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("search", search);
		int totalItems = boardService.selectTotalCnt(params);
		page.setTotalItems(totalItems);
		params.put("page", page);
		List<BoardVO> list = boardService.list(params);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		model.addAttribute("search", search);
		return "main/board/list";
	}
	
	@RequestMapping(value="/board/write",method=RequestMethod.GET)
	private String write(HttpSession session) {
		logger.info("write");
		String url = "main/board/write";
		UserVO vo = (UserVO)session.getAttribute("loginUser");
		if(vo ==null) {
			url = "main/login/login";
		}
		return url;
	}
	
	@RequestMapping(value="/board/insert",method=RequestMethod.POST)
	private void insert(HttpSession session, BoardVO vo, PrintWriter out) {
		logger.info("=== insert ===");
		UserVO user = (UserVO)session.getAttribute("loginUser");
		vo.setMember_no(user.getUserNo());
		int count = boardService.insert(vo);
		out.print(count);
		out.flush();
		out.close();
	}//insert
	
	@RequestMapping(value="/board/detail",method=RequestMethod.GET)
	private String detail(BoardVO vo, Model model, HttpServletRequest request, HttpServletResponse response) {
		logger.info("detail");
		vo = boardService.detail(vo);
		model.addAttribute("detailVO", vo);
		
		List<ReplyVO> list = boardService.boardReplyList(vo);
		model.addAttribute("reply_list", list);
		
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
            boardService.updateHit(boardNo);
        }
		
		return "main/board/detail";
	}
	@RequestMapping(value="/board/delete",method=RequestMethod.POST)
	private void delete(BoardVO vo, HttpSession session, PrintWriter out) {
		logger.info("delete");
		int count = 0;
		count = boardService.boarddelete(vo);
		out.print(count);
		out.flush();
		out.close();
	}
	@RequestMapping(value="/board/modify",method=RequestMethod.GET)
	private String modify(BoardVO vo, HttpSession session, Model model, PrintWriter out) {
		logger.info("modify");
		vo = boardService.detail(vo);
		model.addAttribute("detailVO", vo);
		return "main/board/modify";
	}
	@RequestMapping(value="/board/update",method=RequestMethod.POST)
	private void update(BoardVO vo, HttpSession session, PrintWriter out) {
		logger.info("update");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		count = boardService.boardupdate(vo);
		out.print(count);
		out.flush();
		out.close();
	}
	
	@RequestMapping(value="/board/repinsert",method=RequestMethod.POST)
	private void repinsert(ReplyVO vo, PrintWriter out, HttpSession session) {
		logger.info("=== repinsert ===");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		vo.setMember_no(user.getUserNo());
		count = boardService.insertBoardReply(vo);
		if(count > 0) {
			vo = boardService.boardReplyDetail(vo);
			JSONArray arr = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("board_no", vo.getBoard_no());
			obj.put("comment_no", vo.getComment_no());
			obj.put("contents", vo.getContents());
			obj.put("regist_date", vo.getRegist_date());
			obj.put("member_no", user.getUserNo());
			arr.add(obj);
			String jsonStr = arr.toString();
			out.print(jsonStr);
		} else {
			out.print(count);
		}
		out.flush();
		out.close();
	}//insert
	
	@RequestMapping(value="/board/repdelete",method=RequestMethod.POST)
	private void delete(ReplyVO vo, HttpSession session, PrintWriter out) {
		logger.info("delete");
		int count = 0;
		count = boardService.deleteReply(vo); 
		out.print(count);
		out.flush();
		out.close();
	}
}
