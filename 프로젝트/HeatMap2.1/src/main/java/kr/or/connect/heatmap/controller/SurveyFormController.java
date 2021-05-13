package kr.or.connect.heatmap.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

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

	public String uploadCheck(@ModelAttribute("data") HeatMapFormData data) {
		
		return "surveyformUploadCheck";
		
	}
	

	
	@PostMapping("/surveyformUpload")
	
	public String upload(@ModelAttribute HeatMapFormData data) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		HeatMapFormDao formdao=ac.getBean(HeatMapFormDao.class);
		//data.setDate();
		//data.setTime();
		int count = formdao.insert(data);
		
		//@RequestParam("file") MultipartFile[] file  @ModelAttribute HeatMapFormData data 
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		int assignmentNum = data.getAssignmentNum();
		MultipartFile file1 = data.getFile1();
		MultipartFile file2 = data.getFile2();
		
		String path="C:/Users/user/Pictures/"+sqlDate+"/";
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
        		
                FileOutputStream fos = new FileOutputStream(path + file1.getOriginalFilename());
                InputStream is = file1.getInputStream();
        		FileOutputStream fos2 = new FileOutputStream(path + file2.getOriginalFilename());
                InputStream is2 = file2.getInputStream();
        ){
        	    int readCount = 0;
        	    byte[] buffer = new byte[1024];
            while((readCount = is.read(buffer)) != -1){
                fos.write(buffer,0,readCount);
            }
            while((readCount = is2.read(buffer)) != -1){
            	fos2.write(buffer,0,readCount);
            }
        }catch(Exception ex){
            throw new RuntimeException("file Save Error");
        }
        
		return "main";
	}
}
