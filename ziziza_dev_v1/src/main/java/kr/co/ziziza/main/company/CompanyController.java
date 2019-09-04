package kr.co.ziziza.main.company;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.vo.UserVO;
import kr.co.ziziza.main.board.ReplyVO;
import kr.co.ziziza.manager.company.MngRegistVO;




@Controller
public class CompanyController {
	
	@Autowired
	CompanyService companyService;
	
	@Autowired
	private FileService fileService;
	
	private static final Logger logger = LoggerFactory.getLogger(CompanyController.class);
	
	
	@RequestMapping(value="/zlzlza",method=RequestMethod.GET)
	private String list(Model model, MngRegistVO vo, @RequestParam Map<String, Object> params) {
		logger.info("list");
		List<MngRegistVO> list = companyService.getList(params);
		model.addAttribute("list", list);
		return "main/zlzlza/list";
	}
	
	@RequestMapping(value="/zlzlza/searchMap",method=RequestMethod.GET)
	private String searchMap(Model model, MngRegistVO vo, @RequestParam Map<String, Object> params) {
		logger.info("list");
		List<MngRegistVO> list = companyService.getList(params);
		model.addAttribute("list", list);
		return "main/zlzlza/map";
	}
	
	@RequestMapping(value="/zlzlza",method=RequestMethod.POST)
	public @ResponseBody Map<String, Object> getList(@RequestParam Map<String, Object> params){
		params.put("type", "main");
		List<MngRegistVO> list = companyService.getList(params);
		params.put("list", list);
		return params;
	}//
	
	@RequestMapping(value="/zlzlza/detail",method=RequestMethod.GET)
	private String detail(MngRegistVO vo, Model model) {
		logger.info("detail");
		vo = companyService.detail(vo);
		model.addAttribute("detailVO", vo);
		model.addAttribute("proList", companyService.proList(vo));
		model.addAttribute("plantList", companyService.plantList(vo));
		model.addAttribute("chargeList", companyService.chargeList(vo));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("menuType", "COMPANY");
		params.put("menuNo", vo.getCompanyNo());
		model.addAttribute("files", fileService.selectList(params));
		List<ReplyVO> list = companyService.companyReplyList(vo);
		model.addAttribute("replyList", list);
		return "main/zlzlza/detail";
	}
	@RequestMapping(value="/zlzlza/repInsert",method=RequestMethod.POST)
	private void repinsert(ReviewVO vo, Model model, PrintWriter out, HttpSession session) {
		logger.info("=== repinsert ===");
		int count = 0;
		UserVO user = (UserVO) session.getAttribute("loginUser");
		
		if(user == null) {	//로그인 사용자 없으면
			out.print(-1);
			out.close();
			return;
		}
		vo.setMember_no(user.getUserNo());//
		count = companyService.insertcompanyReply(vo);
		if(count > 0) {
			vo = companyService.companyReplyDetail(vo);
			JSONArray arr = new JSONArray();
			JSONObject obj = new JSONObject();
			obj.put("company_no", vo.getCompany_no());
			obj.put("review_no", vo.getReview_no());
			obj.put("contents", vo.getContents());
			obj.put("regist_date", vo.getRegist_date());
			obj.put("member_name", vo.getMember_name());
			obj.put("member_no", vo.getMember_no());
			obj.put("score", vo.getScore());
			arr.add(obj);
			String jsonStr = arr.toString();
			out.print(jsonStr);
		} else {
			out.print(count);
		}
		out.flush();
		out.close();
	}//insert
	
	@RequestMapping(value="/company/redelete",method=RequestMethod.POST)
	private void delete(ReviewVO vo, HttpSession session, PrintWriter out) {
		logger.info("delete");
		int count = 0;
		count = companyService.deleteReply(vo); 
		out.print(count);
		out.flush();
		out.close();
	}
	
}
