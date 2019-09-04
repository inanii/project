package kr.co.ziziza.common.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.ziziza.common.vo.FileVO;

/**
 * FileUtil
 * @author Park
 * @version 19-07-15
 */
@Component("fileUtil")
public class FileUtil {
	private String units[] = { "B", "KB", "MB", "GB", "TB" };
	@Value("${file.root.path}") 
	private String rootPath;		//기준 경로
	@Value("${file.tmp.path}") 
	private String tmpPath;			//임시 경로
	@Value("${file.save.path}") 
	private String savePath;		//저장 경로
	
	/**
	 * saveFiles		파일 목록 저장
	 * @param 	files	저장 파일 목록,		menu	메뉴명,		menuNo	게시물번호
	 * @return	List<FileVO>	파일 저장완료 List
	 */
	public List<FileVO> saveFiles(MultipartFile[] files, String menu, int menuNo) {
		List<FileVO> list = new ArrayList<FileVO>();
		for(MultipartFile file : files) {
			FileVO vo = setFileInfo(file, menu, menuNo);
			if(vo != null) {
				saveLocalFile(file, vo);
				list.add(vo);				
			}//if end
		}//for end
		return list;
	}//saveFile()
	
	/**
	 * saveFile			파일 저장
	 * @param 	banner	저장 파일 목록,		menu	메뉴명,		menuNo	게시물번호
	 * @return	List<FileVO>	파일 저장완료 List
	 */
	public FileVO saveFile(MultipartFile file, String menu, int menuNo) {
		FileVO vo = setFileInfo(file, menu, menuNo);
		if(vo != null) saveLocalFile(file, vo);
//				convertThumnail(vo);		//추가 예정
		return vo;
	}//

	/**
	 * setFileInfo			파일 정보 Set	VO 
	 * @param 	file		저장 파일 ,		menu	메뉴명,		menuNo	게시물번호
	 * @return	FileVO
	 */
	private FileVO setFileInfo(MultipartFile file, String menu, int menuNo) {
		FileVO vo = null;
		long size = file.getSize();
		if(size > 0) {
			vo = new FileVO();
			String fileStorage = getFileSize(size);
			String fileName = file.getOriginalFilename();
			String ext = FilenameUtils.getExtension(fileName);
			vo.setFileStorage(fileStorage);
			vo.setMenuType(menu.toUpperCase());
			vo.setMenuNo(menuNo);
			vo.setOriginName(fileName);
			vo.setFileType(file.getName().toUpperCase());
			vo.setFileContentType(file.getContentType());
			vo.setSavePath(getSavePath(menu));
			vo.setSaveName(getSaveFileName(ext));
		}//if end
		return vo;
	}//setFileInfo()
	
	/**
	 * saveFile				파일 로컬 저장
	 * @param 	file		파일, 		vo	파일 정보
	 * @return
	 */
	private void saveLocalFile(MultipartFile file, FileVO vo) {	//배너 분리 Thumnail 추가 예정
		InputStream is = null;
		OutputStream os = null;
		try {
			is = file.getInputStream();
			os = new FileOutputStream(savePath + vo.getSavePath() + File.separator + vo.getSaveName());
			FileCopyUtils.copy(is, os);
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try { if(is != null) is.close(); if(os != null) os.close();} 
			catch (Exception e2) {	e2.printStackTrace();	}
		}//try
	}//saveFile()

	/**
	 * getSavePath			저장 경로
	 * @param 	menu		메뉴명
	 * @return	String		저장 경로
	 */
	private String getSavePath(String menu){
		Date today = new Date();
		DateFormat siganFormat = new SimpleDateFormat("YYYYMMdd");
		String date = siganFormat.format(today);
		String fullPath = File.separator + menu + File.separator + date;
		File saveDir = new File(savePath + fullPath);
		if(!saveDir.exists()) saveDir.mkdirs();
		return fullPath;
	}//getSavePath()
	
	/**
	 * getSaveFileName		저장 파일 이름
	 * @param 	size		확장자
	 * @return	String		저장 파일 이름
	 */
	private String getSaveFileName(String ext) {
		String uuid = UUID.randomUUID().toString().replace("-", "");
		return uuid + "." + ext;
	}//getSaveFileName()

	/**
	 * getFileSize		파일 용량
	 * @param 	size	파일 용량	
	 * @return	String	크기별 용량
	 */
	private String getFileSize(long size) {
		int digitGroups = (int) (Math.log10(size)/Math.log10(1024));
		return new DecimalFormat("#,##0.#").format(size/Math.pow(1024, digitGroups)) + units[digitGroups];
	}//getFileSize()
	
	/**
	 * thumnailImage	썸네일 변환
	 * @param 	vo		파일 정보	
	 * @return	vo		파일 정보	
	 */
	private void convertThumnail(FileVO vo) {
		//나중에
	}//thumnailImage()
	
	/**
	 * Delete File		파일 삭제
	 * @param 	vo		파일 정보
	 * @return		
	 */
	public void fileDelete(FileVO vo) {
		File delFile = new File(savePath + vo.getSavePath() + File.separator + vo.getSaveName());
		delFile.delete();
	}//fileDelete()

	/**
	 * Get Thumnail		썸네일 파일 가져오기 (변경예정)
	 * @param 	vo		파일 정보
	 * @return		
	 */
	public File getFile(FileVO vo){
		return new File(savePath + vo.getSavePath() + File.separator + vo.getSaveName());
	}//getThumnail()
	
	/**
	 * Get Thumnail		썸네일 파일 가져오기 (변경예정)
	 * @param 	vo		파일 정보
	 * @return		
	 */
	public File getThumnail(FileVO vo){
		return new File(savePath + vo.getSavePath() + File.separator + vo.getSaveName());
	}//getThumnail()

}//class end