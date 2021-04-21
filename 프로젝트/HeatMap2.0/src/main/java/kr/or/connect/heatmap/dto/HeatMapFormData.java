package kr.or.connect.heatmap.dto;

import java.sql.Date;
import java.sql.Time;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import kr.or.connect.heatmap.config.*;
import kr.or.connect.heatmap.dao.HeatMapFormDao;

public class HeatMapFormData {
	private String flexRadioDefault;
	//private Date date;
	private int AssignmentNum;
	private String area1;
	private String namefull;
	private String phone;
	private float Temperatures;
	private String weather;
	private String surface;
	private String surface2;
	private String traffic;
	//private Time time;
	private String filename1;
	private String filename2;
	
	
	
	public String getFlexRadioDefault() {		
		return flexRadioDefault;
	}
	public void setFlexRadioDefault(String flexRadioDefault) {
		this.flexRadioDefault = flexRadioDefault;
	}
	/*public Date getDate() {		
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}*/
	public int getAssignmentNum() {
		return AssignmentNum;
	}
	public void setAssignmentNum(int assignmentNum) {
		this.AssignmentNum = assignmentNum;
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
		return Temperatures;
	}
	public void setTemperatures(float temperatures) {
		this.Temperatures = temperatures;
	}
	public String getWeather() {
		return weather;
	}
	public void setWeather(String weather) {
		this.weather = weather;
	}
	public String getSurface() {
		return surface;
	}
	public void setSurface(String surface) {
		this.surface = surface;
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
	/*public Time getTime() {		
		return time;
	}
	public void setTime(Time time) {
		this.time = time;
	}*/
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
		data.setSurface("44");
		data.setSurface2("44");
		data.setTraffic("tt");
		//data.setTime(sqlTime);
		data.setFilename1("44");
		data.setFilename2("44");
		System.out.println("시작");
		int count = formdao.insert(data);
		System.out.println(count + "건 입력하였습니다.");
	}*/
}
