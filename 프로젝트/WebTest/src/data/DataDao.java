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
			String dbPassword = "971008";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public int join(Data data) {
		String SQL = "INSERT INTO data VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, data.getFlexRadioDefault());
			pstmt.setInt(2, data.getAssignmentNum());
			pstmt.setString(3, data.getArea1());
			pstmt.setString(4, data.getNamefull());
			pstmt.setString(5, data.getPhone());
			pstmt.setInt(6, data.getTemperatures());
			pstmt.setString(7, data.getWeather());
			pstmt.setString(8, data.getSurface());
			pstmt.setString(9, data.getSurface2());
			pstmt.setString(10, data.getTraffic());
			return pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1; //db오류
		
	}

}
