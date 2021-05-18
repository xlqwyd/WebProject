package kr.or.connect.heatmap.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.xml.bind.DatatypeConverter;

import org.apache.commons.io.FileUtils;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.or.connect.heatmap.config.ApplicationConfig;
import kr.or.connect.heatmap.dao.HeatMapFormDao;
import kr.or.connect.heatmap.dto.HeatMapFormData;

@Controller
public class SurveyFormController {
	@GetMapping("/surveyform")
	public String surveyform() {
		return "surveyform";
	}
	@GetMapping("/surveyformUploadCheck")
	public String uploadcheck() {
		return "surveyformUploadCheck";
	}
	
	@PostMapping("/surveyformCheck")
	//@RequestMapping("",method=RequestMethod.Post)
	/*public String upload(@RequestParam("flexRadioDefault") String flexRadioDefault, 
			@RequestParam("assignmentNum")int assignmentNum,
			@RequestParam("area1")String area1,
			@RequestParam("namefull")String namefull,
			@RequestParam("phone")String phone,
			@RequestParam("temperatures")float temperatures,
			@RequestParam("weather")String weather,
			@RequestParam("surface1") String surface1,
			@RequestParam("surface2")String surface2,
			@RequestParam("traffic")String traffic,
			@RequestParam("filename1")MultipartFile filename1,
			@RequestParam("filename2")MultipartFile filename2) {*/
	public String uploadCheck(@ModelAttribute("data") HeatMapFormData data) {
		
		return "surveyformUploadCheck";
	
	}
	
	@PostMapping("/surveyformUpload")
	public String upload(@ModelAttribute HeatMapFormData data, HttpServletRequest request) {
		HttpSession session = request.getSession();
		String id = null;
		if(session.getAttribute("id") != null){
			id = (String) session.getAttribute("id");
			data.setId(id);
		}
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		HeatMapFormDao formdao=ac.getBean(HeatMapFormDao.class);
		//data.setDate();
		//data.setTime();
		int count = formdao.insert(data);
		
		//@RequestParam("file") MultipartFile[] file  @ModelAttribute HeatMapFormData data 
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		//decode base64
		String decfile1 = data.getEncfile1();
		
		File file1 = new File(data.getFilename1());
		byte[] decodeBytes1 = DatatypeConverter.parseBase64Binary(decfile1);
		
		
		int assignmentNum = data.getAssignmentNum();
		//MultipartFile file1 = data.getFile1();
		//MultipartFile file2 = data.getFile2();
		
		//String path="C:/Users//Pictures/"+sqlDate+"/";  //형준이꺼.
		String path="C:\\Users\\박재현\\eclipse-workspace\\heatmap2.6\\src\\main\\webapp\\resources\\img\\Picture/"+sqlDate+"/"; //사진 저장 경로. 자신의 컴퓨터에 맞게 바꿔야함.// 재훈이꺼
		File dir= new File(path);
		if(!dir.exists()){
	         dir.mkdirs();
	      }
		
		path = path + assignmentNum + "/";
		File dir2= new File(path);
		if(!dir2.exists()){
	         dir2.mkdirs();
	      }
		
        try(
                // 맥일 경우 
                //FileOutputStream fos = new FileOutputStream("/tmp/" + file.getOriginalFilename());
                // 윈도우일 경우
        		
                /*FileOutputStream fos = new FileOutputStream(path + file1.getOriginalFilename());
                InputStream is = file1.getInputStream();
        		FileOutputStream fos2 = new FileOutputStream(path + file2.getOriginalFilename());
                InputStream is2 = file2.getInputStream();*/
        		
        		OutputStream outputStream1 = new BufferedOutputStream(new FileOutputStream(path+file1));
        		
        ){
        	/*    int readCount = 0;
        	    byte[] buffer = new byte[1024];
            while((readCount = is.read(buffer)) != -1){
                fos.write(buffer,0,readCount);
            }
            while((readCount = is2.read(buffer)) != -1){
            	fos2.write(buffer,0,readCount);
            }*/
        	outputStream1.write(decodeBytes1);
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
        
		return "main";
	}
}
