package project.admin.e_p006.service;

import java.util.Map;

import org.json.simple.JSONObject;

public interface E_p006Service {

	public JSONObject boardChart()throws Exception;

	public JSONObject searchDatePieChart(Map<String, String> search_keyword)throws Exception;

	public JSONObject selectPieChart(Map<String, String> select_keyword)throws Exception;

	public JSONObject searchDateColumnChart(Map<String, String> search_keyword)throws Exception;

	public JSONObject selectColumnChart(Map<String, String> select_keyword)throws Exception;

	
}
