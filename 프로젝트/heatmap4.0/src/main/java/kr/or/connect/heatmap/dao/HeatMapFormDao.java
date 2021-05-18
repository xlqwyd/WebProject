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
	
	public int insert(HeatMapFormData formdata) { //id까지 넣음
		
		SqlParameterSource params = new BeanPropertySqlParameterSource(formdata);
		return insertAction.execute(params);
		
	}
	
	public List<HeatMapFormData> selectAll(){
		String sql = "SELECT * FROM surveyform";
		return jdbc.query(sql, Collections.emptyMap(), rowMapper);
		//바인딩 값을 전달할 목적 22
		//select 한건 한건의 결과를 dto에 저장하는 목적 33 beanpropertyrowmapper를 이용해 컬럼 값을 dto에 자동으로 담음
	}
	
	/*
	public List<HeatMapFormData> searchList(String id){
		String sql = "SELECT * FROM surveyform where id = " + id;
		return jdbc.query(sql, Collections.emptyMap(), rowMapper);
		//바인딩 값을 전달할 목적 22
		//select 한건 한건의 결과를 dto에 저장하는 목적 33 beanpropertyrowmapper를 이용해 컬럼 값을 dto에 자동으로 담음
	}*/
	
	public List<HeatMapFormData> selectIdAll(String id){
	      String sql = "SELECT * FROM surveyform where id= '"+id+"'";
	      return jdbc.query(sql, Collections.emptyMap(), rowMapper);
	      
	   }
	
	public List<HeatMapFormData> selectForSearch(String s_type, String s_value){
		//게시판 검색 부분
		s_type = s_type==null?"":s_type.trim();
		s_value = s_value==null?"":s_value.trim();
		
		String sql = "SELECT * FROM surveyform";
		
		String where = "";
		if("1".equals(s_type)) {
			//where = "where date_format(date, '%Y%m%d') = '"+s_value+"'";
			where = "where date like '%"+s_value+"%'";
		}else if("2".equals(s_type)) {
			where = "where area1 like '%"+s_value+"%'";
		}else if("3".equals(s_type)) {
			where = "where assignment_num like '%"+s_value+"%'";
		}else if("4".equals(s_type)) {
			where = "where id like '%"+s_value+"%'";
		}
		
		sql = sql + " " + where;
		System.out.println(sql);
		
		return jdbc.query(sql, Collections.emptyMap(), rowMapper);
		//바인딩 값을 전달할 목적 22
		//select 한건 한건의 결과를 dto에 저장하는 목적 33 beanpropertyrowmapper를 이용해 컬럼 값을 dto에 자동으로 담음
	}
	
}
