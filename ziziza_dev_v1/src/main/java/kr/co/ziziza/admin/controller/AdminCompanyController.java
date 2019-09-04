package kr.co.ziziza.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.ziziza.admin.service.AdminCompanyService;
import kr.co.ziziza.admin.vo.AdminChargeVO;
import kr.co.ziziza.admin.vo.AdminCompanyVO;
import kr.co.ziziza.admin.vo.AdminPlantsVO;
import kr.co.ziziza.admin.vo.AdminSearchVO;
import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.util.PagingUtil;

@Controller
@RequestMapping(value = "/admin/company/*", produces = "application/json;charset=UTF-8")
public class AdminCompanyController {

	@Autowired
	private AdminCompanyService service;
	
	@Autowired
	private FileService fileService;
	
	/**
	 * List Page			목록페이지
	 * @param 	
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public void listPage() {
	}//listPage()
	
	
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
	 * Get List				목록가져오기
	 * @param 	
	 * @return 	JSON
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
	 * Get Info					
	 * @param		no 		사업장고유번호
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getInfo(@RequestParam Map<String, Object> params) {
		AdminCompanyVO vo = service.selectInfo(params);
		params.put("vo", vo);
		if(vo != null) {
			List<AdminChargeVO> chList = service.selectChargeList(vo.getCompanyNo());
			params.put("charge", chList);
			List<AdminPlantsVO> plList = service.selectPlantsList(vo.getCompanyNo());
			params.put("plants", plList);
			params.put("menuType", "COMPANY");
			params.put("menuNo", vo.getCompanyNo());
			params.put("files", fileService.selectList(params));
		}//
		return params;
	}//getInfo()
	
	/**
	 * Modify Proc			정보수정
	 * @param		VO		입력정보
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public @ResponseBody String modify(AdminCompanyVO vo) {
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
		int success = service.deleteInfo(params);
		if(success > 0) {
			params.put("target", "board");
			params.put("menuType", "COMPANY");
			fileService.deleteInfo(params);
		}//if end
		return String.valueOf(success);
	}//delete()
	
	
}//class end