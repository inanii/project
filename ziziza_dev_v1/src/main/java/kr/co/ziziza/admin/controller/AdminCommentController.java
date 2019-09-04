package kr.co.ziziza.admin.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.ziziza.admin.service.AdminCommentService;
import kr.co.ziziza.admin.vo.AdminCommentVO;

@RestController
@RequestMapping(value = "/admin/comment/*", produces = "application/json;charset=UTF-8")
public class AdminCommentController {

	@Autowired
	private AdminCommentService service;
	
	/**
	 * Get List				목록가져오기
	 * @param 	
	 * @return 	JSON
	 * @exception
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getList(@RequestParam Map<String, Object> params) {
		int total = service.selectTotalCnt(params);
		params.put("total", total);
		if(total > 0) params.put("list", service.selectList(params));
		return params;
	}//list()
	
	/**
	 * Modify Proc			정보수정
	 * @param		VO		입력정보
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public @ResponseBody String modify(AdminCommentVO vo) {
		int success = service.updateInfo(vo);
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
		params.put("target", "comment");
		int success = service.deleteInfo(params);
		return String.valueOf(success);
	}//delete()
	
}//class end