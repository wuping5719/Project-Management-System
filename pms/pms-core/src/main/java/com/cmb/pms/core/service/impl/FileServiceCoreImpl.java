package com.cmb.pms.core.service.impl;

import java.util.List;

import com.cmb.pms.core.service.FileServiceCore;
import com.cmb.pms.core.dao.FileInfoDAO;
import com.cmb.pms.core.model.FileInfo;

public class FileServiceCoreImpl implements FileServiceCore {

	private FileInfoDAO fileInfoDAO;

	@Override
	public String saveFileInfo(FileInfo fileInfo) {
		try {
			fileInfoDAO.insertSelective(fileInfo);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public int getTotalNum(String fileName, String fileType) {
		return fileInfoDAO.selectTotalNum(fileName, fileType);
	}
	
	@Override
	public List<FileInfo> getFileInfos(String fileName, String fileType, int startIndex, int pageSize) {
		return fileInfoDAO.selectFileInfos(fileName, fileType, startIndex, pageSize);
	}
	
	@Override
	public String deleteFileInfo(Integer fileID) {
		try {
			fileInfoDAO.deleteByPrimaryKey(fileID);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	public FileInfoDAO getFileInfoDAO() {
		return fileInfoDAO;
	}

	public void setFileInfoDAO(FileInfoDAO fileInfoDAO) {
		this.fileInfoDAO = fileInfoDAO;
	}

}
