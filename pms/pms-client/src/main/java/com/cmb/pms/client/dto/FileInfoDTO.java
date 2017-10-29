package com.cmb.pms.client.dto;

import java.io.Serializable;

public class FileInfoDTO implements Serializable {

	private static final long serialVersionUID = 5145314335247711029L;

	private Integer fileID;        // 主键 ID 

    private String fileName;    // 文件名

    private String fileDescription;  // 文件描述

    private String fileType;  // 文件类型

    private Double fileSize;  // 文件大小

    private String originalFileName;   

    public Integer getFileID() {
        return fileID;
    }

    public void setFileID(Integer fileID) {
        this.fileID = fileID;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName == null ? null : fileName.trim();
    }

    public String getFileDescription() {
        return fileDescription;
    }

    public void setFileDescription(String fileDescription) {
        this.fileDescription = fileDescription == null ? null : fileDescription.trim();
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType == null ? null : fileType.trim();
    }

    public Double getFileSize() {
        return fileSize;
    }

    public void setFileSize(Double fileSize) {
        this.fileSize = fileSize;
    }

    public String getOriginalFileName() {
        return originalFileName;
    }

    public void setOriginalFileName(String originalFileName) {
        this.originalFileName = originalFileName == null ? null : originalFileName.trim();
    }
}