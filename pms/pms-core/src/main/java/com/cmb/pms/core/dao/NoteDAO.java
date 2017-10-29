package com.cmb.pms.core.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.cmb.pms.core.model.Note;

public interface NoteDAO {
    int deleteByPrimaryKey(Integer noteID);

    int insert(Note record);

    int insertSelective(Note record);

    Note selectByPrimaryKey(Integer noteID);

    int updateByPrimaryKeySelective(Note record);

    int updateByPrimaryKey(Note record);
    
    int selectTotalNum(@Param("noteTitle") String noteTitle, @Param("noteKeyWord") String noteKeyWord);

   	List<Note> selectNotes(@Param("noteTitle") String noteTitle, @Param("noteKeyWord") String noteKeyWord,
   			@Param("startIndex") int startIndex, @Param("pageSize") int pageSize);
   	
   	List<String> selectKeyWords();
}