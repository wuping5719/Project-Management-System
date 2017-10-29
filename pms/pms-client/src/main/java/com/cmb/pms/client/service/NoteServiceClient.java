
package com.cmb.pms.client.service;

import com.cmb.pms.client.dto.NoteDTO;

/**
 * @author WuPing
 */

public interface NoteServiceClient {

	public String saveNote(NoteDTO noteDTO);
    
    public String getNoteList(String noteTitle, String noteKeyWord, int pageNum);
    
	public String deleteNote(Integer noteID);
	
	public String modifyNote(NoteDTO noteDTO);
	
	public String getKeyWords();
	
	public String selectNoteByID(Integer noteID);
}