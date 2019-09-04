package kr.co.ziziza.manager.company;

import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ziziza.common.file.FileService;
import kr.co.ziziza.common.util.FileUtil;
import kr.co.ziziza.common.util.PagingUtil;
import kr.co.ziziza.common.vo.FileVO;




@Controller
public class MngCompanyListController {
	
	@Autowired
	MngCompanyListService service;	
	
	@Autowired
	private FileService fileService;

	@Autowired
	private FileUtil fileUtil;
	
	private static final Logger logger = LoggerFactory.getLogger(MngCompanyListController.class);
	
	@RequestMapping(value="/mng/company/list" ,method=RequestMethod.GET)
	public String list(Model model, MngRegistVO vo, PagingUtil page) {
		logger.info("list");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("vo", vo);
		int totalItems = service.selectTotalCnt(params);
		page.setTotalItems(totalItems);
		params.put("page", page);
		List<MngRegistVO> list = service.selectRegistList(params);
		model.addAttribute("list", list);
		model.addAttribute("page", page);
		return "manager/list/list_form";
	}//list
	
	@RequestMapping(value="/mng/company/regist" ,method=RequestMethod.GET)
	public String regist() {
		logger.info("regist");
		return "manager/list/regist_form";
	}//regist

	@RequestMapping(value="/mng/company/detail" ,method=RequestMethod.GET)
	public String detail(Model model, MngRegistVO vo) {
		logger.info("detail");
		vo = service.selectDetail(vo);
		int companyNo = vo.getCompanyNo();
		model.addAttribute("detailVO", vo);
		model.addAttribute("chargeList", service.selectDetailCharge(vo));
		model.addAttribute("plantList", service.selectDetailPlants(vo));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("menuType", "COMPANY");
		params.put("menuNo", companyNo);
		model.addAttribute("files", fileService.selectList(params));
		return "manager/list/detail_form";
	}//detail
	
	@RequestMapping(value="/mng/company/modify" ,method=RequestMethod.GET)
	public String modify(Model model, MngRegistVO vo) {
		logger.info("modify");
		vo = service.selectDetail(vo);
		int companyNo = vo.getCompanyNo();
		model.addAttribute("detailVO", vo);
		model.addAttribute("chargeList", service.selectDetailCharge(vo));
		model.addAttribute("plantList", service.selectDetailPlants(vo));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("menuType", "COMPANY");
		params.put("menuNo", companyNo);
		model.addAttribute("files", fileService.selectList(params));
		return "manager/list/modify_form";
	}//modify
	
	@RequestMapping(value="/mng/company/insert" ,method=RequestMethod.POST)
	public void companyInsert(MngRegistVO vo, PrintWriter out, MultipartFile[] slide,MultipartFile banner) {
		//요금, 편의시설 따로 파라미터(List<charge>) 설정 No받고 list for
		logger.info("companyInsert");
		int count = service.companyInsert(vo);
		if(count > 0) {
			List<MngChargeVO> chargeList = vo.getChargeList();
			if(chargeList != null && chargeList.size() > 0) {
				service.companyCharge(vo);
			}//
			List<MngPlantsVO> plantList = vo.getPlantList();
			if(plantList != null && plantList.size() > 0) {
				service.companyPlant(vo);
			}//
			if(slide != null && slide.length > 0) {	//첨부파일
				List<FileVO> list = fileUtil.saveFiles(slide, "COMPANY", vo.getCompanyNo());
				if(list.size() > 0) fileService.insertList(list);
			}//if end
			if(banner != null && banner.getSize() > 0) {		//이벤트 배너이미지
				FileVO fileVO = fileUtil.saveFile(banner,"COMPANY", vo.getCompanyNo());
				if(fileVO != null) fileService.insertInfo(fileVO);
			}//if end
		}//
		out.print(count);
		out.flush();
		out.close();
	}//companyInsert
	
	@RequestMapping(value="/mng/company/update" ,method=RequestMethod.POST)
	public void companyUpdate(MngRegistVO vo, PrintWriter out) {
		logger.info("companyUpdate");
		int count = 0;
		count = service.companyUpdate(vo);
		out.print(count);
		out.flush();
		out.close();
	}//companyInsert
	
	@RequestMapping(value="/mng/company/delete",method=RequestMethod.GET)
	public void boardDelete(MngRegistVO vo, PrintWriter out) {
		int count = 0; 
		count = service.deleteCompany(vo);
		out.print(count);
		out.flush();
		out.close();
	}//boardDelete
	
	@RequestMapping(value="/mng/company/chargeInsert",method=RequestMethod.POST)
	public void chargeInsert(MngChargeVO vo, PrintWriter out) {
		int count = 0; 
		count = service.chargeInsert(vo);
		out.print(vo.getChargeNo());
		out.flush();
		out.close();
	}//boardDelete
	
	@RequestMapping(value="/mng/company/chargeUpdate",method=RequestMethod.POST)
	public void chargeUpdate(MngChargeVO vo, PrintWriter out) {
		int count = 0; 
		count = service.updateCharge(vo);
		out.print(count);
		out.flush();
		out.close();
	}//boardDelete
	
	@RequestMapping(value="/mng/company/chargeDelete",method=RequestMethod.POST)
	public void chargeDelete(MngChargeVO vo, PrintWriter out) {
		int count = 0; 
		count = service.chargeDelete(vo);
		out.print(count);
		out.flush();
		out.close();
	}//boardDelete
	
	@RequestMapping(value="/mng/company/plantInsert",method=RequestMethod.POST)
	public void chargeInsert(MngPlantsVO vo, PrintWriter out) {
		int count = 0; 
		count = service.plantInsert(vo);
		out.print(vo.getPlantNo());
		out.flush();
		out.close();
	}//boardDelete
	
	@RequestMapping(value="/mng/company/plantUpdate",method=RequestMethod.POST)
	public void chargeUpdate(MngPlantsVO vo, PrintWriter out) {
		int count = 0; 
		count = service.plantUpdate(vo);
		out.print(count);
		out.flush();
		out.close();
	}//boardDelete
	
	@RequestMapping(value="/mng/company/plantDelete",method=RequestMethod.POST)
	public void chargeDelete(MngPlantsVO vo, PrintWriter out) {
		int count = 0; 
		count = service.plantDelete(vo);
		out.print(count);
		out.flush();
		out.close();
	}//boardDelete
}//
