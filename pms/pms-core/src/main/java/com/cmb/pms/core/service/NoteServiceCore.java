package com.cmb.pms.core.service;

import java.util.List;
import java.util.Set;

import com.cmb.pms.core.model.Note;

/**
 * @author WuPing
 */

public interface NoteServiceCore {

    public String saveNote(Note note);
    
    public int getTotalNum(String noteTitle, String noteKeyWord);

    public List<Note> getNotes(String noteTitle, String noteKeyWord, int startIndex, int pageSize);
    
    public String deleteNote(Integer noteID);
    
    public String updateNote(Note note);
    
    public Set<String> getKeyWords();
    
    public Note getNoteByID(Integer noteID);
}