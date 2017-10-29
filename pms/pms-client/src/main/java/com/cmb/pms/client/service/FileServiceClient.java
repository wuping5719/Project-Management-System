
package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.FileInfoDTO;

/**
 * @author WuPing
 */

public interface FileServiceClient {

	public String saveFileInfo(FileInfoDTO fileInfoDTO);
    
    public String getFileInfoList(String fileName, String fileType, int pageNum);
    
	public String deleteFileInfo(Integer fileID);
	
}