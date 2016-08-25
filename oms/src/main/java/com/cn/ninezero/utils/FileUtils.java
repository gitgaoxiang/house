package com.cn.ninezero.utils;


import net.sf.json.JSONObject;
import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;

/**
 * 文件处理的Utility类
 */
public class FileUtils {
	/**
	 * 获取文件的后缀
	 * @param fileName 文件名
	 * @return 文件后缀
	 */
	public static String getFileExtension(String fileName) {
		int idx = fileName.lastIndexOf(".");
		if (idx >= 0) return fileName.substring(idx + 1);
		else return fileName;
	}

	/**
	 * 创建文件,如果文件所在的目录不存在，先创建文件的目录
	 * @param path 文件全路径
	 * @return 创建的文件
	 * @throws java.io.IOException
	 */
	public static File createFile(String path) throws IOException {
		path = FileUtils.resolveDir(path);
		int idx = path.lastIndexOf("/");
		if (idx > 0) {
			File dir = new File(path.substring(0, idx));
			dir.mkdirs();
		}
		File file = new File(path);
		if (file.exists()) file.delete();
		file.createNewFile();
		return file;
	}

	/**
	 * 解决Windows,Linux等操作系统文件分隔符不同的问题，统一使用/作为文件分隔符
	 *
	 * @param dirPath 文件路径
	 * @return 处理后的文件路径
	 */
	public static String resolveDir(String dirPath) {
		dirPath = StringUtils.replaceChars(dirPath, '\\', '/');
		dirPath = StringUtils.replace(dirPath, "//", "/");
		return dirPath;
	}

	/**
	 * 获取文件的父目录
	 * @param file 文件
	 * @return 父目录
	 */
	public static File getFileDir(File file) {
		String path = file.getAbsolutePath();
		path = FileUtils.resolveDir(path);
		int idx = path.lastIndexOf("/");
		return new File(path.substring(0, idx));
	}

	/**
	 * 创建临时文件
	 * @param fileName 文件名
	 * @return 临时文件
	 * @throws java.io.IOException
	 */
	public static File createTempFile(String fileName) throws IOException {
		String tempDir = System.getProperty("java.io.tmpdir");
		File tempFile = new File(new File(tempDir), fileName);
		tempFile.createNewFile();
		return tempFile;
	}

	public static File createTempDir(String dir) throws IOException {
		String tempDir = System.getProperty("java.io.tmpdir");
		File dirFile = new File(new File(tempDir), dir);
		if(!dirFile.exists()) dirFile.mkdirs();
		return dirFile;
	}

	/**
	 * 去掉文件名中的文件后缀名
	 * @param fileName 文件名
	 * @return 去掉后缀名后的文件名
	 */
	public static String getFileNameWithoutExtension(String fileName) {
		int idx = fileName.lastIndexOf(".");
		if (idx >= 0) return fileName.substring(0, idx);
		else return fileName;
	}

	public static void deleteFile(File file) throws IOException {
		if(file == null) return;
		if(!file.exists()) return;
		if(file.isDirectory()) {
			File[] files = file.listFiles();
			if(files != null) {
				for(File f : files) {
					deleteFile(f);
				}
			}
			file.delete();
		} else {
			file.delete();
		}
	}

	public static void downloadFile(String contentType, InputStream fileInputStream, String fileName, HttpServletRequest request, HttpServletResponse response) throws IOException {
		response.reset();
		response.setContentType(contentType);
		if(request.getHeader("User-Agent").toLowerCase().indexOf("msie") > 0) {
			fileName = URLEncoder.encode(fileName, "UTF-8");
		} else {
			fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");
		}

		response.setHeader("Content-Disposition", "attachment;filename=\"" + fileName + "\"");
		response.setHeader("Connection", "close");
		IOUtils.copy(fileInputStream, response.getOutputStream());
		response.flushBuffer();
		fileInputStream.close();
		response.getOutputStream().close();
	}

	public static boolean getCurrentPermission(HttpServletRequest request) throws IOException {
		File permissionFile = new File(request.getSession().getServletContext().getRealPath("/WEB-INF/classes/permission/permission.json"));
		Boolean permission;
		if(permissionFile.exists()){
			FileReader reader = new FileReader(permissionFile);
			JSONObject o = JSONObject.fromObject(reader.readFileContents());
			permission = (Boolean)o.get("permission");
			reader.close();
		}else{
			permissionFile.createNewFile();
			FileWriter writer = new FileWriter(permissionFile);
			JSONObject o = new JSONObject();
			o.put("permission",false);
			writer.writer(o.toString());
			writer.close();
			permission = false;
		}
		return permission;
	}
}
