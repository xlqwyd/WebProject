package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DataDao {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public DataDao() {
		try {
			String dbURL = "jdbc:mysql://localhost:3306/testing1";
					String dbID = "root";
			String dbPassword = "1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int join(Data data) {
		String SQL = "INSERT INTO data VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		//SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss", Locale.KOREA);
		
		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
		try {
			
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, data.getFlexRadioDefault());
			pstmt.setDate(2, sqlDate);
			pstmt.setInt(3, data.getAssignmentNum());
			pstmt.setString(4, data.getArea1());
			pstmt.setString(5, data.getNamefull());
			pstmt.setString(6, data.getPhone());
			pstmt.setFloat(7, data.getTemperatures());
			pstmt.setString(8, data.getWeather());
			pstmt.setString(9, data.getSurface());
			pstmt.setString(10, data.getSurface2());
			pstmt.setString(11, data.getTraffic());
			pstmt.setTime(12, sqlTime);
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db오류
		
	}

}
