package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.FileInfo;

public interface FileInfoDAO {
    
	int deleteByPrimaryKey(Integer fileID);

    int insert(FileInfo record);

    int insertSelective(FileInfo record);

    FileInfo selectByPrimaryKey(Integer fileID);

    int updateByPrimaryKeySelective(FileInfo record);

    int updateByPrimaryKey(FileInfo record);
    
    int selectTotalNum(@Param("fileName") String fileName, @Param("fileType") String fileType);

   	List<FileInfo> selectFileInfos(@Param("fileName") String fileName, @Param("fileType") String fileType,
   			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
}