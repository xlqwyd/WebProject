package kr.or.connect.heatmap.dao;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.BeanPropertySqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcInsert;
import org.springframework.stereotype.Repository;

import kr.or.connect.heatmap.dto.HeatMapFormData;

@Repository
public class HeatMapFormDao {
	private NamedParameterJdbcTemplate jdbc;
	private SimpleJdbcInsert insertAction;
	private RowMapper<HeatMapFormData> rowMapper = BeanPropertyRowMapper.newInstance(HeatMapFormData.class);

	public HeatMapFormDao(DataSource dataSource) {
		this.jdbc = new NamedParameterJdbcTemplate(dataSource);
		
		this.insertAction = new SimpleJdbcInsert(dataSource)
                .withTableName("surveyform");//table 명
	}
	
	public int insert(HeatMapFormData formdata) {
		SqlParameterSource params = new BeanPropertySqlParameterSource(formdata);
		return insertAction.execute(params);
		/*Map<String, Object> params = new HashMap<String,Object>();

		java.util.Date utilDate = new java.util.Date();
		java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
		java.sql.Time sqlTime = new java.sql.Time(utilDate.getTime());
		
		params.put("참가자유형", formdata.getFlexRadioDefault());
		//params.put("측정날짜", formdata.getDate());
		params.put("측정날짜", sqlDate);
		params.put("배정번호", formdata.getAssignmentNum());
		params.put("측정지", formdata.getArea1());
		params.put("측정자성명", formdata.getNamefull());
		params.put("측정자연락처", formdata.getPhone());
		params.put("기온", formdata.getTemperatures());
		params.put("기상상태", formdata.getWeather());
		params.put("지면상태1", formdata.getSurface1());
		params.put("지면상태2", formdata.getSurface2());
		params.put("교통사항", formdata.getTraffic());
		//params.put("측정시간", formdata.getTime());
		params.put("측정시간", sqlTime);
		params.put("fileName", formdata.getFilename1());
		params.put("fileName2", formdata.getFilename2());

		String sql = "INSERT INTO data VALUES"
				+ "(:참가자유형,:측정날짜,:배정번호,:측정지,:측정자성명,:측정자연락처,:기온,:기상상태,"
				+ ":지면상태1,:지면상태2,:교통사항,:측정시간,:fileName,:fileName2)";
		//String sql = "INSERT INTO data VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)";
		return jdbc.update(sql, params);*/
	}
	
	public List<HeatMapFormData> selectAll(){
		String sql = "SELECT * FROM surveyform";
		return jdbc.query(sql, Collections.emptyMap(), rowMapper);
		//바인딩 값을 전달할 목적 22
		//select 한건 한건의 결과를 dto에 저장하는 목적 33 beanpropertyrowmapper를 이용해 컬럼 값을 dto에 자동으로 담음
	}
}
