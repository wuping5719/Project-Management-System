package com.cmb.pms.core.service;

import java.util.List;

import com.cmb.pms.core.model.FileInfo;

/**
 * @author WuPing
 */

public interface FileServiceCore {

    public String saveFileInfo(FileInfo fileInfo);
    
    public int getTotalNum(String fileName, String fileType);

    public List<FileInfo> getFileInfos(String fileName, String fileType, int startIndex, int pageSize);
    
    public String deleteFileInfo(Integer fileID);
}