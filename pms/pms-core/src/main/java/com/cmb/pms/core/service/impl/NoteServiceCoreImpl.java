package com.cmb.pms.core.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.cmb.pms.core.service.NoteServiceCore;
import com.cmb.pms.core.dao.NoteDAO;
import com.cmb.pms.core.model.Note;

public class NoteServiceCoreImpl implements NoteServiceCore {

	private NoteDAO noteDAO;

	@Override
	public String saveNote(Note note) {
		try {
			noteDAO.insertSelective(note);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public int getTotalNum(String noteTitle, String noteKeyWord) {
		return noteDAO.selectTotalNum(noteTitle, noteKeyWord);
	}
	
	@Override
	public List<Note> getNotes(String noteTitle, String noteKeyWord, int startIndex, int pageSize) {
		return noteDAO.selectNotes(noteTitle, noteKeyWord, startIndex, pageSize);
	}
	
	@Override
	public String deleteNote(Integer noteID) {
		try {
			noteDAO.deleteByPrimaryKey(noteID);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}

	@Override
	public String updateNote(Note note) {
		try {
			noteDAO.updateByPrimaryKeySelective(note);
			return "success";
		} catch(Exception e){
			e.printStackTrace();
			return "failure";
		}
	}
	
	@Override
	public Set<String> getKeyWords() {
		List<String> keyWordsList = noteDAO.selectKeyWords();
		Set<String> keyWordsSet = new HashSet<>();
		for (String str : keyWordsList) {
			String[] tempArray = str.split(",");
			for(String tempKeyWord : tempArray) {
				if ((!("".equals(tempKeyWord))) && (tempKeyWord != null)) {
					keyWordsSet.add(tempKeyWord);
				}
			}
		}
		return keyWordsSet;
	}
	
	@Override
	public Note getNoteByID(Integer noteID) {
		return noteDAO.selectByPrimaryKey(noteID);
	}
	
	public NoteDAO getNoteDAO() {
		return noteDAO;
	}

	public void setNoteDAO(NoteDAO noteDAO) {
		this.noteDAO = noteDAO;
	}

}
