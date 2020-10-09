package project.admin.e_p006.dao;

import java.util.List;
import java.util.Map;

import project.admin.e_p006.vo.E_p006VO;

public interface E_p006DAO {

	//지정일자 조회
	List<E_p006VO> searchDatePieChart(Map<String, String> search_keyword)throws Exception;
	List<E_p006VO> serchUserLineChart(Map<String, String> search_keyword)throws Exception;
	List<E_p006VO> serchUserBarChart(Map<String, String> search_keyword)throws Exception;
	List<E_p006VO> searchDateColumnChart(Map<String, String> search_keyword)throws Exception;

	//셀렉트 조회
	List<E_p006VO> selectPieChart(Map<String, String> select_keyword)throws Exception;
	List<E_p006VO> selectColumnChart(Map<String, String> select_keyword)throws Exception;
	List<E_p006VO> selectUserLineChart(Map<String, String> select_keyword)throws Exception;
	List<E_p006VO> selectUserBarChart(Map<String, String> select_keyword)throws Exception;

	

	

}
