package kr.or.connect.heatmap.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
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
	
	@PostMapping("/surveyform")
	//@RequestMapping("",method=RequestMethod.Post)
	public String upload(@RequestParam("flexRadioDefault") String flexRadioDefault, 
			@RequestParam("AssignmentNum")int AssignmentNum,
			@RequestParam("area1")String area1,
			@RequestParam("namefull")String namefull,
			@RequestParam("phone")String phone,
			@RequestParam("temperatures")float temperatures,
			@RequestParam("weather")String weather,
			@RequestParam("surface") String surface,
			@RequestParam("surface2")String surface2,
			@RequestParam("traffic")String traffic,
			@RequestParam("filename1")MultipartFile filename1,
			@RequestParam("filename2")MultipartFile filename2) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		HeatMapFormDao formdao=ac.getBean(HeatMapFormDao.class);
		
		HeatMapFormData data= new HeatMapFormData();
		
		data.setFlexRadioDefault(flexRadioDefault);
		//data.setDate(sqlDate);
		data.setAssignmentNum(AssignmentNum);
		data.setArea1(area1);
		data.setNamefull(namefull);
		data.setPhone(phone);
		data.setTemperatures(temperatures);
		data.setWeather(weather);
		data.setSurface(surface);
		data.setSurface2(surface2);
		data.setTraffic(traffic);
		//data.setTime(sqlTime);
		data.setFilename1(filename1.getOriginalFilename());
		data.setFilename2(filename2.getOriginalFilename());
		System.out.println("??????");
		System.out.println("????????????:"+flexRadioDefault+" ????????????:"+AssignmentNum+" ??????:"+area1
				+" ??????:"+namefull+" ????????????:"+phone+" ??????:"+temperatures+" ????????????:"+weather
				+" ????????????1:"+surface+" ????????????2:"+surface2+" ????????????:"+traffic
				+" ??????1:"+filename1.getOriginalFilename()+" ??????2:"+filename2.getOriginalFilename());
		int count = formdao.insert(data);
		
		//@RequestParam("file") MultipartFile[] file  @ModelAttribute HeatMapFormData data 
		//System.out.println("?????? ?????? : " + file.getOriginalFilename());
		//System.out.println("?????? ?????? : " + file.getSize());
		
		//System.out.println("?????? ?????? : " + file[1].getSize());
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		
		String path="C:/Users/tongsu/Pictures/"+sqlDate+"/";
		File dir= new File(path);
		if(!dir.exists()){
	         dir.mkdirs();
	      }
		
		path = path + AssignmentNum + "/";
		File dir2= new File(path);
		if(!dir2.exists()){
	         dir2.mkdirs();
	      }
		
        try(
                // ?????? ?????? 
                //FileOutputStream fos = new FileOutputStream("/tmp/" + file.getOriginalFilename());
                // ???????????? ??????
        		
                FileOutputStream fos = new FileOutputStream(path + filename1.getOriginalFilename());
                InputStream is = filename1.getInputStream();
        		FileOutputStream fos2 = new FileOutputStream(path + filename2.getOriginalFilename());
                InputStream is2 = filename2.getInputStream();
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
