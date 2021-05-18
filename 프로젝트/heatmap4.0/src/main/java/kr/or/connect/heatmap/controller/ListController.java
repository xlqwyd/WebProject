package kr.or.connect.heatmap.controller;

import java.sql.Time;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.connect.heatmap.config.ApplicationConfig;
import kr.or.connect.heatmap.dao.HeatMapFormDao;
import kr.or.connect.heatmap.dto.HeatMapFormData;

@Controller
public class ListController {
	
	@GetMapping("/myList")
	public String mylist() { //회원이 자신의 리스트를 볼때
		return "myList";
	}
	
	@GetMapping("/result")
	public String result() { //관리자가 리스트를 볼때
		return "result";
	}
	
	@PostMapping("/result2")
	public String result2() { //게시판에서 검색시
		return "result";
	}
	
	
	// 엑셀저장구현 부분
	@RequestMapping(value ="/result3", produces = "application/text; charset = utf8", method = RequestMethod.POST)
	public  String result3(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ApplicationContext ac = new AnnotationConfigApplicationContext(ApplicationConfig.class);
		HeatMapFormDao formdao3 = ac.getBean(HeatMapFormDao.class);
		
		List<HeatMapFormData> list = null;
		
		String s_type = request.getParameter("s_type");
		String s_value = request.getParameter("s_value");
		
		if(s_type != null && s_type.trim().length()>0){
			list = formdao3.selectForSearch(s_type, s_value);
		} else list = formdao3.selectAll();
		
		XSSFRow row = null;
		XSSFCell cell = null;
		
		//String [] sKey = {"측정날짜", "측정시간", "측정지", "배정번호", "온도", "기상상태", "사진"};
		
		 XSSFWorkbook workBook = new XSSFWorkbook();

		 XSSFSheet sheet = workBook.createSheet("시트명");
		 
		 if( list.isEmpty() == false && list.size() > 0 ){



			 for(int i = 0; i < list.size(); i++){

			 // 1.row에 시트를 생성

			 row = sheet.createRow(i);



			 



			// 2.생성된 Row에 Cell생성
			 
			Date from = list.get(i).getDate();
			SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd");
			String to = transFormat.format(from);
			Time time =list.get(i).getTime();
			SimpleDateFormat transFormat2 = new SimpleDateFormat("HH:mm:ss");
			String to2 = transFormat2.format(time);

			

			

			cell = row.createCell(0);
			cell.setCellValue( to );
			cell = row.createCell(1);
			cell.setCellValue( to2 );
			cell = row.createCell(2);
			cell.setCellValue( list.get(i).getArea1() );
			cell = row.createCell(3);
			cell.setCellValue( list.get(i).getAssignmentNum() );
			cell = row.createCell(4);
			cell.setCellValue( list.get(i).getTemperatures() );
			cell = row.createCell(5);
			cell.setCellValue( list.get(i).getWeather() );
			cell = row.createCell(6);
			cell.setCellValue( list.get(i).getId() );
			cell = row.createCell(7);
			cell.setCellValue( list.get(i).getFilename1() );



		

			

			}

			 }



			 //FileOutputStream fileOutPut = new FileOutputStream("D:\\ProjectExcel");
		 response.setContentType("ms-vnd/excel");
         response.setHeader("Content-Disposition", "attachment;filename=test.xls");



			

         workBook.write(response.getOutputStream());



			 





		
		return "main";
	}
	
	

}
