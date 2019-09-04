package kr.co.ziziza.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.admin.service.AdminQnAService;
import kr.co.ziziza.admin.vo.AdminQnAVO;
import kr.co.ziziza.admin.vo.AdminSearchVO;
import kr.co.ziziza.common.util.PagingUtil;
import kr.co.ziziza.common.util.SendEmail;

@Controller
@RequestMapping(value = "/admin/qna/*", produces = "application/json;charset=UTF-8")
public class AdminQnAController {

	@Autowired
	private AdminQnAService service;
	
	@Autowired
	private SendEmail sendEmail;
	
	/**
	 * List Page			목록 페이지
	 * @param 	
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listPage() {
	}//listPage()
	
	/**
	 * Regist Form Page		등록페이지
	 * @param 	
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public void registPage() {
	}//registPage()
	
	/**
	 * Modify Form Page		수정페이지
	 * @param 	
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public void modifyPage() {
	}//modifyPage()
	
	/**
	 * Get List					목록가져오기
	 * @param		PagingUtil	페이지, AdminSearchVO 검색
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getList(@RequestParam Map<String, Object> params, PagingUtil page, AdminSearchVO search) {
		params.put("page", page);
		params.put("search", search);
		page.setTotalItems(service.selectTotalCnt(params));
		if(page.getTotalItems() > 0) params.put("list", service.selectList(params));
		return params;
	}//list()
	
	/**
	 * Get Info				상세정보	
	 * @param		no 		고유번호
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getInfo(@RequestParam Map<String, Object> params) {
		params.put("vo", service.selectInfo(params));
		return params;
	}//getInfo()
	
	/**
	 * Modify Proc				정보수정
	 * @param		VO		 	입력정보
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public @ResponseBody String modify(AdminQnAVO vo) {
		int success = service.updateInfo(vo);
		if(vo.getState() == 'Y') sendEmail.sendAnswer(vo);	
		return String.valueOf(success);
	}//modify()
	
	/**
	 * Delete Proc	 			정보삭제
	 * @param		no			고유번호
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody String delete(@RequestParam Map<String, Object> params) {
		int success = service.deleteInfo(params);
		return String.valueOf(success);
	}//delete()
	
}//class end