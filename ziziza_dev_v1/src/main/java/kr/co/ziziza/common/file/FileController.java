package kr.co.ziziza.common.file;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ziziza.common.util.FileUtil;
import kr.co.ziziza.common.vo.FileVO;

@Controller
@RequestMapping("/file/*")
public class FileController {
	
	@Autowired
	private FileService service;
	
	@Autowired
	private FileUtil fileUtil;
	
	@RequestMapping(value = "upload", method = RequestMethod.POST)
	public @ResponseBody FileVO uploadFile(@RequestParam Map<String, Object> params, MultipartFile file, HttpSession session) {
		FileVO vo = null;
		int success = 0;
		String menuType = (String) params.get("menuType");
		int menuNo = Integer.parseInt((String) params.get("menuNo"));
		if(file != null) {
			vo = fileUtil.saveFile(file, menuType, menuNo);
			vo.setFileType(((String) params.get("fileType")).toUpperCase());
			if(vo != null) success = service.insertInfo(vo);	
			if(success > 0) success = vo.getFileNo();
		}//
		return vo;
	}//uploadFile()
	
	@RequestMapping(value = "download", method = RequestMethod.GET)
	public void downloadFile(@RequestParam Map<String, Object> params, HttpServletResponse response) {
		FileVO vo = service.selectInfo(params);
		if(vo != null) {
			try {
				File  file = fileUtil.getFile(vo);
				response.setContentType("application/octet-stream");
				response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(vo.getOriginName(), "UTF-8")+"\";");
				response.setContentType(vo.getFileContentType());
		    	InputStream in = new FileInputStream(file);
				IOUtils.copy(in, response.getOutputStream());			
			} catch (IOException e) {
				e.printStackTrace();
			}//try  ~ catch
		}//if end
	}//fileDownload()
	
	@RequestMapping(value = "delete", method = RequestMethod.POST)
	public @ResponseBody String deletefile(@RequestParam Map<String, Object> params) {
		int success = 0;
		FileVO vo = service.selectInfo(params);
		if(vo != null) {
			params.put("target", "file");
			success = service.deleteInfo(params);
			if(success > 0)	fileUtil.fileDelete(vo);
		}//if end
		return String.valueOf(success);
	}//fileDelete()
	
	@RequestMapping(value = "imageView", method = RequestMethod.GET)
	public void imageView(@RequestParam Map<String, Object> params, HttpServletResponse response) {
		FileVO vo = service.selectInfo(params);
		if(vo != null) {
		    try {
		    	File  file = fileUtil.getThumnail(vo);
		    	response.setHeader("Content-Disposition", "attachment; fileName=\"" + URLEncoder.encode(vo.getOriginName(),"UTF-8")+"\";");
		    	response.setContentType(vo.getFileContentType());
		    	InputStream in = new FileInputStream(file);
				IOUtils.copy(in, response.getOutputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}//try  ~ catch
		}//if end
	}//imageView()
	
}//class end