package kr.or.connect.heatmap.dto;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;
import java.util.Base64;
import java.util.Base64.Decoder;
import java.util.Base64.Encoder;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.web.multipart.MultipartFile;

import kr.or.connect.heatmap.config.*;
import kr.or.connect.heatmap.dao.HeatMapFormDao;
import kr.or.connect.heatmap.dto.HeatMapFormData;

public class HeatMapFormData {
	
	private Date date;
	private int assignmentNum;
	private String area1;
	private String namefull;

	private float temperatures;
	private String weather;


	private Time time;
	private String filename1;

	private MultipartFile file1;

	private String encfile1;
	private String id;   //id추가

	


	//SimpleDateFormat dateSdf = new SimpleDateFormat("yyyy-MM-dd", Locale.KOREA);
	//SimpleDateFormat timeSdf = new SimpleDateFormat("HH:mm:ss", Locale.KOREA);
	//String strdate = dateSdf.format(new java.util.Date());
	//String strtime = timeSdf.format(new java.util.Date());
	//java.util.Date utilDate = new java.util.Date();
	//java.util.Date datetime = dateSdf.parse(strtime);
	//java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	//java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
	
	public HeatMapFormData(){
		TimeZone.setDefault(TimeZone.getTimeZone("Asia/Seoul"));//서버 시간설정 관계없이 한국시간이 객체에 기록 
		java.util.Date utilDate = new java.util.Date();//실제 적용되는지 확인 불가
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
		date = sqlDate;
		time = sqlTime;
	}
	
	
	public Date getDate() {		
		return date;
	}
	public void setDate(Date date) {//
		this.date = date;
	}
	public int getAssignmentNum() {
		return assignmentNum;
	}
	public void setAssignmentNum(int assignmentNum) {
		this.assignmentNum = assignmentNum;
	}
	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getNamefull() {
		return namefull;
	}
	public void setNamefull(String namefull) {
		this.namefull = namefull;
	}
	public float getTemperatures() {
		return temperatures;
	}
	public void setTemperatures(float temperatures) {
		this.temperatures = temperatures;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public Time getTime() {		
		return time;
	}
	public void setTime(Time time) {//
		this.time = time;
	}
	public String getFilename1() {
		return filename1;
	}
	public void setFilename1(String filename1) {
		this.filename1 = filename1;
	}

	public MultipartFile getFile1() {
		return file1;
	}
	public void setFile1(MultipartFile file1) throws IOException {
		this.file1 = file1;
		this.filename1 = file1.getOriginalFilename();
		
		Encoder encoder = Base64.getEncoder();
		this.encfile1 = new String(encoder.encode(file1.getBytes()));
	}

	
	public String getEncfile1() {
		return encfile1;
	}

	public void setEncfile1(String encfile1) {
		this.encfile1 = encfile1;
	}
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	@Override
	public String toString() {
		return "";
	}
	/*public static void main(String[] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		HeatMapFormDao formdao=ac.getBean(HeatMapFormDao.class);
		
		HeatMapFormData data= new HeatMapFormData();
		
		data.setFlexRadioDefault("44");
		//data.setDate(sqlDate);
		data.setAssignmentNum(77);
		data.setArea1("44");
		data.setNamefull("홍길동");
		data.setPhone("01044444444");
		data.setTemperatures((float)44.4);
		data.setWeather("55");
		data.setSurface1("44");
		data.setSurface2("44");
		data.setTraffic("tt");
		//data.setTime(sqlTime);
		data.setFilename1("44");
		data.setFilename2("44");
		System.out.println("시작");
		int count = formdao.insert(data);
		System.out.println(count + "건 입력하였습니다.");
	}*/
	/*public static void main(String [] args) {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		HeatMapFormDao formdao=ac.getBean(HeatMapFormDao.class);
		List<HeatMapFormData> list = formdao.selectAll();
		
		for (HeatMapFormData data: list) {
			System.out.println(data);
		}
	}*/
}
