package mybean.upload.basic;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BasicBean {
	private MultipartRequest multi;
	private String path;
	private int max;
	private String encType;
	
	public void setPath(HttpServletRequest servlet, String path){
		this.path = servlet.getServletContext().getRealPath(path);
	}
	
	public void setMax(int max){
		this.max = max;
	}
	
	public void setEncType(String encType){
		this.encType = encType;
	}
	
	public void setMulti(HttpServletRequest req) {
		try{
			multi = new MultipartRequest(req, path, max, encType, 
								new DefaultFileRenamePolicy());
		}
		catch(IOException err){
			System.out.println("setMulti : " + err);
		}
	}
	
	public String getUser(){
		return multi.getParameter("user");
	}
	
	public String getTitle(){
		return multi.getParameter("title");
	}
	
	public String getUpFile(){
		String result = "";
		Enumeration enumer = multi.getFileNames();
		while(enumer.hasMoreElements()){
			String name = (String)enumer.nextElement();
			
			result = "실제 파일명 : " + multi.getOriginalFileName(name) + "<br/>";
			result += "저장될 파일명 : " + multi.getFilesystemName(name) + "<br/>";
			result += "파일 타입 : " + multi.getContentType(name) + "<br/>";
			
			File f = multi.getFile(name);
			result += "파일의 크기 : " + f.length() + "byte <br/>";
			result += "파일 경로 : " + f.getPath();
		}
		return result;
	}
}
