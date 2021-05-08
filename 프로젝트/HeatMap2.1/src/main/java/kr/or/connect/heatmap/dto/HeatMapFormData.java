package kr.or.connect.heatmap.dto;

import java.io.IOException;
import java.sql.Date;
import java.sql.Time;
import java.util.List;
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
	private String flexRadioDefault;
	private Date date;
	private int assignmentNum;
	private String area1;
	private String namefull;
	private String phone;
	private float temperatures;
	private String weather;
	private String surface1;
	private String surface2;
	private String traffic;
	private Time time;
	private String filename1;
	private String filename2;
	private MultipartFile file1;
	private MultipartFile file2;
	private String encfile1;
	private String encfile2;

	java.util.Date utilDate = new java.util.Date();
	java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
	java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
	
	public HeatMapFormData(){
		date = sqlDate;
		time = sqlTime;
	}
	
	public String getFlexRadioDefault() {		
		return flexRadioDefault;
	}
	public void setFlexRadioDefault(String flexRadioDefault) {
		this.flexRadioDefault = flexRadioDefault;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
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
	public String getSurface1() {
		return surface1;
	}
	public void setSurface1(String surface1) {
		this.surface1 = surface1;
	}
	public String getSurface2() {
		return surface2;
	}
	public void setSurface2(String surface2) {
		this.surface2 = surface2;
	}
	public String getTraffic() {
		return traffic;
	}
	public void setTraffic(String traffic) {
		this.traffic = traffic;
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
	public String getFilename2() {
		return filename2;
	}
	public void setFilename2(String filename2) {
		this.filename2 = filename2;
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
	public MultipartFile getFile2() {
		return file2;
	}
	public void setFile2(MultipartFile file2) throws IOException {
		this.file2 = file2;
		this.filename2 = file2.getOriginalFilename();
		
		Encoder encoder = Base64.getEncoder();
		this.encfile2 = new String(encoder.encode(file2.getBytes()));
	}
	
	public String getEncfile1() {
		return encfile1;
	}

	public void setEncfile1(String encfile1) {
		this.encfile1 = encfile1;
	}
	public String getEncfile2() {
		return encfile2;
	}

	public void setEncfile2(String encfile2) {
		this.encfile2 = encfile2;
	}
	
	@Override
	public String toString() {
		return "참가자유형: " + flexRadioDefault + " 날짜: " + date + " 배정번호: " + assignmentNum
				+ " 배정위치: " + area1 + " 이름: "+namefull+" 전화번호: "+phone
				+ " 온도: "+temperatures+" 날씨: "+weather+" 장소1: "+surface1+" 장소2: "+surface2
				+" 교통상황: "+traffic+" 시간: "+time+" 사진이름1: "+filename1 +" 사진이름2: "
				+ filename2;
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
