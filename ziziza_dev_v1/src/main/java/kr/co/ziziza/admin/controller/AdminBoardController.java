package kr.co.ziziza.admin.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ziziza.admin.service.AdminBoardService;
import kr.co.ziziza.admin.service.AdminCommentService;
import kr.co.ziziza.admin.vo.AdminBoardVO;
import kr.co.ziziza.admin.vo.AdminSearchVO;
import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.util.FileUtil;
import kr.co.ziziza.common.util.PagingUtil;
import kr.co.ziziza.common.vo.FileVO;

@Controller
@RequestMapping(value = "/admin/board/{boardCode}/*", produces = "application/json;charset=UTF-8")
public class AdminBoardController {

	@Autowired
	private AdminBoardService service;

	@Autowired
	private AdminCommentService commentService;
	
	@Autowired
	private FileService fileService;

	@Autowired
	private FileUtil fileUtil;
	
	/**
	 * List Page			목록페이지
	 * @param 	boardCode	게시물 구분 코드
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String listPage(@PathVariable String boardCode){
		return "admin/" + boardCode + "/list";
	}//listPage()
	
	/**
	 * Regist Form Page		등록페이지
	 * @param 	boardCode	게시물 구분 코드
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "regist", method = RequestMethod.GET)
	public String registPage(@PathVariable String boardCode) {
		return "admin/" + boardCode + "/regist";
	}//registPage()
	
	/**
	 * Modify Form Page		수정페이지
	 * @param 	boardCode	게시물 구분 코드
	 * @return 	View
	 * @exception
	 */
	@RequestMapping(value = "modify", method = RequestMethod.GET)
	public String modifyPage(@PathVariable String boardCode) {
		return "admin/" + boardCode + "/modify";
	}//modifyPage()
	
	/**
	 * Get List				목록가져오기
	 * @param 	boardCode	게시물 구분 코드
	 * @return 	JSON
	 * @exception
	 */
	@RequestMapping(value = "list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getList(@PathVariable String boardCode, PagingUtil page, AdminSearchVO search, @RequestParam Map<String, Object> params) {
		params.put("page", page);
		params.put("search", search);
		params.put("boardCode", boardCode.toUpperCase());
		page.setTotalItems(service.selectTotalCnt(params));
		if(page.getTotalItems() > 0) params.put("list", service.selectList(params));
		return params;
	}//getList()
	
	/**
	 * Get Info					상세정보	
	 * @param		boardCode	게시물 구분 코드,	no 		고유번호
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "detail", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> getInfo(@PathVariable String boardCode, @RequestParam Map<String, Object> params) {
		AdminBoardVO vo = service.selectInfo(params);
		vo.setBoardCode(boardCode);
		params.put("vo", vo);
		params.put("menuType", boardCode.toUpperCase());
		params.put("menuNo", vo.getBoardNo());
		params.put("files", fileService.selectList(params));
		params.put("commentCnt", commentService.selectTotalCnt(params));
		return params;
	}//getInfo()
	
	/**
	 * Regist Proc			정보등록
	 * @param		VO		입력정보	attachments 첨부파일	banner 이벤트배너이미지
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "regist", method = RequestMethod.POST)
	public @ResponseBody String regist(@PathVariable String boardCode, AdminBoardVO vo,
										MultipartFile[] attachments, MultipartFile banner) {
		vo.setBoardCode(boardCode);
		int success = service.insertInfo(vo);
		int boardNo = vo.getBoardNo();
		if(success > 0) {
			if(attachments != null && attachments.length > 0) {	//첨부파일
				List<FileVO> list = fileUtil.saveFiles(attachments, boardCode, boardNo);
				if(list.size() > 0) fileService.insertList(list);
			}//if end
			if(banner != null && banner.getSize() > 0) {		//이벤트 배너이미지
				FileVO fileVO = fileUtil.saveFile(banner, boardCode, boardNo);
				if(fileVO != null) fileService.insertInfo(fileVO);
			}//if end
		}//if end
		return String.valueOf(boardNo);
	}//regist()
	
	/**
	 * Modify Proc			정보수정
	 * @param		VO		입력정보
	 * @return		Json
	 * @exception
	 */
	@RequestMapping(value = "modify", method = RequestMethod.POST)
	public @ResponseBody String modify(@PathVariable String boardCode, AdminBoardVO vo, MultipartFile[] attachments, MultipartFile[] banner) {
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
	public @ResponseBody String delete(@PathVariable String boardCode, @RequestParam Map<String, Object> params) {
		int success = service.deleteInfo(params);
		if(success > 0) {
			params.put("target", "board");
			params.put("menuType", boardCode);
			fileService.deleteInfo(params);
			commentService.deleteInfo(params);
		}//if end
		return String.valueOf(success);
	}//delete()
	
}//class end