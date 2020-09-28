package project.admin.e_p006.dao;

import java.util.List;
import java.util.Map;

import project.admin.e_p006.vo.E_p006VO;

public interface E_p006DAO {

	List<E_p006VO> boardChart()throws Exception;

	List<E_p006VO> searchDatePieChart(Map<String, String> search_keyword)throws Exception;

	List<E_p006VO> selectPieChart(Map<String, String> select_keyword)throws Exception;

	List<E_p006VO> searchDateColumnChart(Map<String, String> search_keyword)throws Exception;

	List<E_p006VO> selectColumnChart(Map<String, String> select_keyword)throws Exception;

	

}
