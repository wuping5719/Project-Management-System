package com.cmb.pms.client.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.cmb.pms.client.dto.NoteDTO;
import com.cmb.pms.client.service.NoteServiceClient;
import com.cmb.pms.client.util.PagingParameters;
import com.cmb.pms.core.service.NoteServiceCore;
import com.cmb.pms.core.service.UserServiceCore;
import com.cmb.pms.core.model.Note;
import com.cmb.pms.core.model.User;

public class NoteServiceClientImpl implements NoteServiceClient {

	private NoteServiceCore noteServiceCore;

	private UserServiceCore userServiceCore;
	
	private static Map<Integer, String> USER_NAME_MAP = new HashMap<>();
	
	private boolean hasInited = false;  // 判断用户名字典是否已经初始化
	
	// 无参构造函数，初始化用户名字典 Map
	public void initUserNameMap() {
		List<User> usersList = new ArrayList<>();
		usersList = userServiceCore.getAllUsers();
		// 初始化先清空 Map
		if(USER_NAME_MAP.size()>0) {
			USER_NAME_MAP.clear();
		}
		
		if (usersList != null) {
			for(User user: usersList) {
				USER_NAME_MAP.put(user.getUserID(), user.getUserName());
			}
		}
		
		hasInited = true;
	}
	
	@Override
	public String saveNote(NoteDTO noteDTO) {
		Note note = new Note();

		note.setNoteTitle(noteDTO.getNoteTitle());
		note.setNoteContent(noteDTO.getNoteContent());
		note.setNoteAttachment(noteDTO.getNoteAttachment());
		note.setNoteKeyWord(noteDTO.getNoteKeyWord());
		note.setNotePublisherID(noteDTO.getNotePublisherID());
		
		Date now = new Date();
		note.setNotePublishDate(now);
		note.setNoteModifyDate(now);
		
		String result = noteServiceCore.saveNote(note);
		return result;
	}
	
	@Override
	public String getNoteList(String noteTitle, String noteKeyWord, int pageNum) {
		if (!hasInited) {
			initUserNameMap();
		}
		
		int totalNum = 0; // 总记录数
		int totalPage = 1; // 总页数
		int pageSize = PagingParameters.PAGE_SIZE;
		int startIndex = 0; // 开始索引

		totalNum = noteServiceCore.getTotalNum(noteTitle, noteKeyWord);

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
		
		List<Note> noteList = new ArrayList<>();
		noteList = noteServiceCore.getNotes(noteTitle, noteKeyWord, startIndex, pageSize);

	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

		int n = startIndex + 1;    // 设置序号
		JSONArray jsonArray = new JSONArray();
		for (Note note : noteList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("sortIndex", n);
			jsonObject.put("noteTitle", note.getNoteTitle());
			jsonObject.put("noteContent", note.getNoteContent());
			jsonObject.put("noteAttachment", note.getNoteAttachment());
			jsonObject.put("noteKeyWord", note.getNoteKeyWord());
			
            try {
            	jsonObject.put("notePublisher", USER_NAME_MAP.get(note.getNotePublisherID()));
            } catch (Exception e) {
				jsonObject.put("notePublisher", "");
				e.printStackTrace();
			}
			
			try {
				jsonObject.put("notePublishDate", sdf.format(note.getNotePublishDate()));
			} catch (Exception e) {
				jsonObject.put("notePublishDate", "");
				e.printStackTrace();
			}
			
			try {
				jsonObject.put("noteModifyDate", sdf.format(note.getNoteModifyDate()));
			} catch (Exception e) {
				jsonObject.put("noteModifyDate", "");
				e.printStackTrace();
			}
			
			jsonObject.put("noteID", note.getNoteID());

			jsonArray.add(jsonObject);
			n++;
		}

		Map<String, Object> result = new HashMap<String, Object>(3);
		result.put("noteDTOsList", jsonArray);
		result.put("notesTotalNum", totalNum);
		result.put("notesTotalPage", totalPage);
		return JSONObject.fromObject(result).toString();
	}
	
	@Override
	public String deleteNote(Integer noteID) {
		return noteServiceCore.deleteNote(noteID);
	}
	
	@Override
	public String modifyNote(NoteDTO noteDTO) {
		Note note = new Note();
		note.setNoteID(noteDTO.getNoteID());
		
		note.setNoteTitle(noteDTO.getNoteTitle());
		note.setNoteContent(noteDTO.getNoteContent());
		note.setNoteAttachment(null);
		note.setNoteKeyWord(noteDTO.getNoteKeyWord());
		note.setNotePublisherID(noteDTO.getNotePublisherID());
		
		Date now = new Date();
		note.setNoteModifyDate(now);
		
		String result = noteServiceCore.updateNote(note);
		return result;
	}
	
	@Override
	public String getKeyWords() {
		Set<String> keyWordsSet = noteServiceCore.getKeyWords();
		JSONObject jsonObject = new JSONObject();
		jsonObject.put("keyWordsSet", keyWordsSet);
		return JSONObject.fromObject(jsonObject).toString();
	}
	
	@Override
	public String selectNoteByID(Integer noteID) {
		Note note = noteServiceCore.getNoteByID(noteID);
		Map<String, String> result = new HashMap<String, String>(1);   
		result.put("noteTitle", note.getNoteTitle());
		result.put("noteContent", note.getNoteContent());
		result.put("noteKeyWord",  note.getNoteKeyWord());
		result.put("noteAttachment",  note.getNoteAttachment());
		return JSONObject.fromObject(result).toString();     
	}
	
	public NoteServiceCore getNoteServiceCore() {
		return noteServiceCore;
	}

	public void setNoteServiceCore(NoteServiceCore noteServiceCore) {
		this.noteServiceCore = noteServiceCore;
	}
	
	public UserServiceCore getUserServiceCore() {
		return userServiceCore;
	}

	public void setUserServiceCore(UserServiceCore userServiceCore) {
		this.userServiceCore = userServiceCore;
	}
}
