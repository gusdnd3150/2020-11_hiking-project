package project.admin.e_p006.service;

import java.util.Map;

import org.json.simple.JSONObject;

public interface E_p006Service {

	//지정일자 조회
	public JSONObject searchDatePieChart(Map<String, String> search_keyword)throws Exception;
	public JSONObject searchDateColumnChart(Map<String, String> search_keyword)throws Exception;
	public JSONObject serchUserLineChart(Map<String, String> search_keyword)throws Exception;
	public JSONObject serchUserBarChart(Map<String, String> search_keyword)throws Exception;
	public JSONObject serchCategoryChart(Map<String, String> search_keyword)throws Exception;

	//셀렉트 조회
	public JSONObject selectPieChart(Map<String, String> select_keyword)throws Exception;
	public JSONObject selectColumnChart(Map<String, String> select_keyword)throws Exception;
	public JSONObject selectUserLineChart(Map<String, String> select_keyword)throws Exception;
	public JSONObject selectUserBarChart(Map<String, String> select_keyword)throws Exception;
	public JSONObject selectCategoryChart(Map<String, String> select_keyword)throws Exception;
	

	
	
}
