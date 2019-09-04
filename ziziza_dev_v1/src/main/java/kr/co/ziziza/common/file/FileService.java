package kr.co.ziziza.common.file;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.ziziza.common.vo.FileVO;

@Service
public class FileService {

	@Autowired
	private FileDAO dao;
	
	public List<FileVO> selectList(Map<String, Object> params) {
		return dao.selectList(params);
	}//selectFileList()
	
	public FileVO selectInfo(Map<String, Object> params) {
		return dao.selectInfo(params);
	}//selectFileInfo()
	
	@Transactional(propagation=Propagation.REQUIRED)
	public int insertList(List<FileVO> list) {
		return dao.insertList(list);
	}//insertFileInfo()
	
	@Transactional
	public int insertInfo(FileVO vo) {
		return dao.insertInfo(vo);
	}//insertFileInfo()
	
	@Transactional(propagation=Propagation.REQUIRED)
	public int deleteInfo(Map<String, Object> params) {
		return dao.deleteInfo(params);
	}//deleteFile()

}//class end
