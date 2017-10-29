package com.cmb.pms.web.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.cmb.pms.client.dto.NoteDTO;
import com.cmb.pms.client.service.NoteServiceClient;
import com.cmb.pms.web.utils.FileUtil;
import com.cmb.pms.web.utils.SessionConstants;

@Controller
public class NoteController {
	
	static String FILE_PATH = "/static/file/note/";   	// 文件保存路径-相对路径
	
	String NOTE_ATTACHMENT = "";    // 笔记附件
	
	@Resource(name = "noteServiceClient")
	private NoteServiceClient noteServiceClient;
		
	@RequestMapping(value = "loadNotesList.do", method = RequestMethod.GET)
	public String loadNotesList(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/notes/notes_list";
	}
	
	@RequestMapping(value = "searchNotes.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchNotes(HttpServletRequest request, HttpServletResponse response) {
		String noteTitle = request.getParameter("noteTitle").trim(); 
		String noteKeyWord = request.getParameter("noteKeyWord").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));  // 当前页号

		String result = noteServiceClient.getNoteList(noteTitle, noteKeyWord, pageNum);

		return result;
	}
	
	@RequestMapping(value = "deleteNote.do", produces = "text/html;charset=UTF-8")
	public  void deleteNote(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Integer noteID = Integer.parseInt(request.getParameter("noteID"));   // 主键
		String originalFileName = request.getParameter("originalFileName");   // 文件全名
		
		// 删除目录下的笔记附件文件
		String savePath = session.getServletContext().getRealPath(FILE_PATH);
		FileUtil.deleteFile(savePath + "/" + originalFileName);
		
		// 删除数据库保存的笔记信息
		noteServiceClient.deleteNote(noteID);
	}
	
	@RequestMapping(value = "addNote.do", produces = "text/html;charset=UTF-8")
	public void addNote(HttpServletRequest request, HttpServletResponse response) {
		String newNoteTitle = request.getParameter("newNoteTitle").trim(); 
		String newNoteContent = request.getParameter("newNoteContent").trim();
		String newNoteKeyWord = request.getParameter("newNoteKeyWord").trim();
				
		NoteDTO noteDTO = new NoteDTO();	
		
		noteDTO.setNoteTitle(newNoteTitle);
		noteDTO.setNoteContent(newNoteContent);
		noteDTO.setNoteKeyWord(newNoteKeyWord);
		
		noteDTO.setNoteAttachment(NOTE_ATTACHMENT);
		
		HttpSession session = request.getSession();
		Integer notePublisherID = Integer.parseInt(session.getAttribute(SessionConstants.KEY_USER_ID).toString());
		noteDTO.setNotePublisherID(notePublisherID);
		
		noteServiceClient.saveNote(noteDTO);
	}
	
	@RequestMapping(value = "addNoteAttachment.do")  
	public void addNoteAttachment(@RequestParam("file") MultipartFile uploadfile, HttpSession session,
			HttpServletRequest request, HttpServletResponse response) {
		if (uploadfile.getSize() > 0) {   // 未选择文件，跳转
			String originalFilename = uploadfile.getOriginalFilename();
			// long size = uploadfile.getSize();
			
			NOTE_ATTACHMENT = originalFilename;
			
			// 如果想获得不带点的后缀，变为 fileName.lastIndexOf(".") + 1
			// String prefix = originalFilename.substring(originalFilename.lastIndexOf(".")); 
			//得到后缀名长度
			// int num = prefix.length();
		    //得到文件名, 去掉了后缀
		    // String fileName = originalFilename.substring(0, originalFilename.length() - num); 

			boolean fileTypeIsRight = false;
			// String fileType = "";
			if(originalFilename.toLowerCase().endsWith("jpg")) {
				// fileType = "jpg";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("jpeg")) {
				// fileType = "jpeg";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("png")) {
				// fileType = "png";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("bmp")) {
				// fileType = "bmp";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("gif")) {
				// fileType = "gif";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("gif")) {
				// fileType = "gif";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("gif")) {
				// fileType = "gif";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("pdf")) {
				// fileType = "pdf";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("txt")) {
				// fileType = "txt";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("doc")) {
				// fileType = "doc";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("docx")) {
				// fileType = "docx";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("xls")) {
				// fileType = "xls";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("xlsx")) {
				// fileType = "xlsx";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("ppt")) {
				// fileType = "ppt";
				fileTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("pptx")) {
				// fileType = "pptx";
				fileTypeIsRight = true;
			}
			
			// 限制文件上传的文件格式
			if(fileTypeIsRight) {
				String savePath = session.getServletContext().getRealPath(FILE_PATH);
				File file = new File(savePath, originalFilename);
				try {
					FileUtils.copyInputStreamToFile(uploadfile.getInputStream(), file);
				} catch (IOException e) {
					e.printStackTrace();
				}  
				
				// 文件信息存库
			}
		}
	}
	
	@RequestMapping(value = "searchKeyWords.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchKeyWords(
			HttpServletRequest request, HttpServletResponse response) {	
		return noteServiceClient.getKeyWords();
	}	
    
	@RequestMapping(value = "getNoteByID.do", produces = "text/html;charset=UTF-8")
	public  @ResponseBody  String getNoteByID(HttpServletRequest request, HttpServletResponse response) {
		Integer noteID = Integer.parseInt(request.getParameter("noteID"));   // 主键

		String result = noteServiceClient.selectNoteByID(noteID);
		return result;
	}
	
	@RequestMapping(value = "updateNote.do", produces = "text/html;charset=UTF-8")
	public void updateNote(HttpServletRequest request, HttpServletResponse response) {
		Integer noteID = Integer.parseInt(request.getParameter("noteID"));   // 主键
		
		String newNoteTitle = request.getParameter("newNoteTitle").trim(); 
		String newNoteContent = request.getParameter("newNoteContent").trim();
		String newNoteKeyWord = request.getParameter("newNoteKeyWord").trim();
				
		NoteDTO noteDTO = new NoteDTO();	
		noteDTO.setNoteID(noteID);
		noteDTO.setNoteTitle(newNoteTitle);
		noteDTO.setNoteContent(newNoteContent);
		noteDTO.setNoteKeyWord(newNoteKeyWord);
		
		HttpSession session = request.getSession();
		Integer notePublisherID = Integer.parseInt(session.getAttribute(SessionConstants.KEY_USER_ID).toString());
		noteDTO.setNotePublisherID(notePublisherID);
		
		noteServiceClient.modifyNote(noteDTO);
	}
	
	@RequestMapping(value = "downloadAttachment.do", produces = "text/html;charset=UTF-8")
    public void downloadAttachment(@RequestParam("fileName") String fileName, HttpSession session,
            HttpServletRequest request, HttpServletResponse response) {
        if (fileName != null) {
            String realPath = session.getServletContext().getRealPath(FILE_PATH);
            File file = new File(realPath, fileName);
            if (file.exists()) {
                // response.setContentType("application/force-download"); // 设置强制下载不打开
                try {
					response.addHeader("Content-Disposition","attachment;fileName=" 
                                + new String(fileName.getBytes("GBK"),"iso-8859-1"));   // 设置文件名
				} catch (UnsupportedEncodingException e1) {
					e1.printStackTrace();
				} 
                byte[] buffer = new byte[1024];
                FileInputStream fis = null;
                BufferedInputStream bis = null;
                try {
                    fis = new FileInputStream(file);
                    bis = new BufferedInputStream(fis);
                    OutputStream os = response.getOutputStream();
                    int i = bis.read(buffer);
                    while (i != -1) {
                        os.write(buffer, 0, i);
                        i = bis.read(buffer);
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (bis != null) {
                        try {
                            bis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                    if (fis != null) {
                        try {
                            fis.close();
                        } catch (IOException e) {
                            e.printStackTrace();
                        }
                    }
                }
            }
        }
    }
	
}
