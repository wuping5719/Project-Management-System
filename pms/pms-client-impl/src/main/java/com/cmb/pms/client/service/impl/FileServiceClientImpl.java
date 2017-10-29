package com.cmb.pms.client.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.FileInfoDTO;
import com.cmb.pms.client.service.FileServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.FileServiceCore;
import com.cmb.pms.core.model.FileInfo;

public class FileServiceClientImpl implements FileServiceClient {

	private FileServiceCore fileServiceCore;

	@Override
	public String saveFileInfo(FileInfoDTO fileInfoDTO) {
		FileInfo fileInfo = new FileInfo();

		fileInfo.setFileName(fileInfoDTO.getFileName());
		fileInfo.setFileDescription(fileInfoDTO.getFileDescription());
		fileInfo.setFileSize(fileInfoDTO.getFileSize());
		fileInfo.setFileType(fileInfoDTO.getFileType());
		fileInfo.setOriginalFileName(fileInfoDTO.getOriginalFileName());
		
		Date now = new Date();
		fileInfo.setCreateTime(now);
		fileInfo.setModifyTime(now);
		
		String result = fileServiceCore.saveFileInfo(fileInfo);
		return result;
	}
	
	@Override
	public String getFileInfoList(String fileName, String fileType, int pageNum) {
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = fileServiceCore.getTotalNum(fileName, fileType);

		totalPage = totalNum % pageSize == 0 ? totalNum / pageSize : totalNum / pageSize + 1;

		if (totalNum > 0) {
			if (pageNum <= 1) {
				startIndex = 0;
			} else {
				startIndex = pageNum * pageSize - pageSize;
			}
		} else {
			totalPage = 1;
		}
		
		List<FileInfo> fileInfoList = new ArrayList<>();
		fileInfoList = fileServiceCore.getFileInfos(fileName, fileType, startIndex, pageSize);

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (FileInfo fileInfo : fileInfoList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("fileName", fileInfo.getFileName());
			jsonObject.put("fileDescription", fileInfo.getFileDescription());
			jsonObject.put("fileType", fileInfo.getFileType());
			
			try {
				jsonObject.put("createTime", sdf.format(fileInfo.getCreateTime()));
			} catch (Exception e) {
				jsonObject.put("createTime", "");
				e.printStackTrace();
			}
			
			jsonObject.put("fileSize", fileInfo.getFileSize());
			jsonObject.put("originalFileName", fileInfo.getOriginalFileName());
			jsonObject.put("fileID", fileInfo.getFileID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("fileDTOsList", jsonArray);
		result.put("filesTotalNum", totalNum);
		result.put("filesTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteFileInfo(Integer fileID) {
		return fileServiceCore.deleteFileInfo(fileID);
	}
	
	public FileServiceCore getFileServiceCore() {
		return fileServiceCore;
	}

	public void setFileServiceCore(FileServiceCore fileServiceCore) {
		this.fileServiceCore = fileServiceCore;
	}
}
