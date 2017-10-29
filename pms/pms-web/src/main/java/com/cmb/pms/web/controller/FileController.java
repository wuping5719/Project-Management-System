package com.cmb.pms.web.controller;

import java.io.File;
import java.io.IOException;

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

import com.cmb.pms.client.dto.FileInfoDTO;
import com.cmb.pms.client.service.FileServiceClient;
import com.cmb.pms.web.utils.FileUtil;

@Controller
public class FileController {

	// 文件保存路径-相对路径
	static String FILE_PATH = "/static/file/team_elegant/";
	
	@Resource(name = "fileServiceClient")
	private FileServiceClient fileServiceClient;

	@RequestMapping(value = "loadFilesList.do", method = RequestMethod.GET)
	public String loadFilesList(HttpServletRequest request,
			HttpServletResponse response) {
		return "pages/auths/files_list";
	}
	
	@RequestMapping(value = "searchFiles.do", produces = "text/html;charset=UTF-8")
	public @ResponseBody String searchFiles(HttpServletRequest request, HttpServletResponse response) {
		String fileName = request.getParameter("fileName").trim(); 
		String fileType = request.getParameter("fileType").trim(); 
		int pageNum = Integer.parseInt(request.getParameter("pageNum")); // 当前页号

		String result = fileServiceClient.getFileInfoList(fileName, fileType, pageNum);

		return result;
	}
	
	@RequestMapping(value = "deleteFile.do", produces = "text/html;charset=UTF-8")
	public  void deleteFile(HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		Integer fileID = Integer.parseInt(request.getParameter("fileID"));   // 主键
		String originalFileName = request.getParameter("originalFileName");   // 文件全名
		
		// 删除目录下的文件
		String savePath = session.getServletContext().getRealPath(FILE_PATH);
		FileUtil.deleteFile(savePath + "/" + originalFileName);
		
		// 删除数据库保存的文件信息
		fileServiceClient.deleteFileInfo(fileID);
	}
	
	@RequestMapping(value = "uploadPicture.do")  
	public String uploadPicture(@RequestParam("file") MultipartFile uploadfile, HttpSession session) {
		if (uploadfile.getSize() > 0) {   // 未选择文件，跳转
			String originalFilename = uploadfile.getOriginalFilename();
			long size = uploadfile.getSize();
			
			// 如果想获得不带点的后缀，变为 fileName.lastIndexOf(".") + 1
			String prefix = originalFilename.substring(originalFilename.lastIndexOf(".")); 
			//得到后缀名长度
			int num = prefix.length();
		    //得到文件名, 去掉了后缀
		    String fileName = originalFilename.substring(0, originalFilename.length() - num); 

			boolean picTypeIsRight = false;
			String picFileType = "";
			if(originalFilename.toLowerCase().endsWith("jpg")) {
				picFileType = "jpg";
				picTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("jpeg")) {
				picFileType = "jpeg";
				picTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("png")) {
				picFileType = "png";
				picTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("bmp")) {
				picFileType = "bmp";
				picTypeIsRight = true;
			} else if (originalFilename.toLowerCase().endsWith("gif")) {
				picFileType = "gif";
				picTypeIsRight = true;
			}
			
			// 限制文件上传的文件格式
			if(picTypeIsRight) {
				String savePath = session.getServletContext().getRealPath(FILE_PATH);
				File file = new File(savePath, originalFilename);
				try {
					FileUtils.copyInputStreamToFile(uploadfile.getInputStream(), file);
				} catch (IOException e) {
					e.printStackTrace();
				}  
				
				// 图片文件信息存库
				FileInfoDTO fileInfoDTO = new FileInfoDTO();
				fileInfoDTO.setFileName(fileName);
				fileInfoDTO.setFileDescription("首页-团队风采");
				fileInfoDTO.setFileSize(FileUtil.bytesToKB(size));
				fileInfoDTO.setFileType(picFileType);
				fileInfoDTO.setOriginalFileName(originalFilename);

				fileServiceClient.saveFileInfo(fileInfoDTO);
			}
		}
		return "pages/auths/files_list";
	}
	
}
