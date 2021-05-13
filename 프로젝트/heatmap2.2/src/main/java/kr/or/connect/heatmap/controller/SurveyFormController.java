package kr.or.connect.heatmap.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Base64;

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
		//ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		//HeatMapFormDao formdao=ac.getBean(HeatMapFormDao.class);
		//data.setDate();
		//data.setTime();
		return "surveyformUploadCheck";
		/*HeatMapFormData data= new HeatMapFormData();
		
		data.setFlexRadioDefault(flexRadioDefault);
		data.setDate();//
		data.setAssignmentNum(assignmentNum);
		data.setArea1(area1);
		data.setNamefull(namefull);
		data.setPhone(phone);
		data.setTemperatures(temperatures);
		data.setWeather(weather);
		data.setSurface1(surface1);
		data.setSurface2(surface2);
		data.setTraffic(traffic);
		data.setTime();//
		data.setFilename1(filename1.getOriginalFilename());
		data.setFilename2(filename2.getOriginalFilename());
		System.out.println("시작");
		System.out.println("신규기존:"+flexRadioDefault+" 배정번호:"+assignmentNum+" 장소:"+area1
				+" 이름:"+namefull+" 전화번호:"+phone+" 기온:"+temperatures+" 기상상태:"+weather
				+" 지면상태1:"+surface1+" 지면상태2:"+surface2+" 교통상황:"+traffic
				+" 파일1:"+filename1.getOriginalFilename()+" 파일2:"+filename2.getOriginalFilename());*/
		/*int count = formdao.insert(data);
		
		//@RequestParam("file") MultipartFile[] file  @ModelAttribute HeatMapFormData data 
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		int assignmentNum = data.getAssignmentNum();
		MultipartFile file1 = data.getFile1();
		MultipartFile file2 = data.getFile2();
		
		String path="C:/Users/tongsu/Pictures/"+sqlDate+"/";
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
        
		return "main";*/
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
		
		//decode base64
		String decfile1 = data.getEncfile1();
		
		File file1 = new File(data.getFilename1());
		byte[] decodeBytes1 = DatatypeConverter.parseBase64Binary(decfile1);
		
		
		int assignmentNum = data.getAssignmentNum();
		//MultipartFile file1 = data.getFile1();
		//MultipartFile file2 = data.getFile2();
		
		String path="C:/Users/tongsu/Pictures/"+sqlDate+"/";
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
