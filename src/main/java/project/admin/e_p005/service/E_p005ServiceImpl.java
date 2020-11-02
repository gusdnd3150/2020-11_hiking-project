package project.admin.e_p005.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.admin.e_p005.dao.E_p005DAO;

@Service
public class E_p005ServiceImpl implements E_p005Service {
	@Autowired
	private E_p005DAO e_p005DAO; 

	//지정일자 매출 조회
	@Override
	public List searchPayList(Map<String, String> search_keyword)  throws Exception{
		List search = e_p005DAO.searchPayList(search_keyword);
		return  search;
	}
	
	//조회시 총 매출
	@Override
	public String sumPrice(Map<String, String> search_keyword) throws Exception {
	String sumPrice = e_p005DAO.sumPrice(search_keyword);
		return sumPrice;
	}

	//조회시 평균매출
	@Override
	public String avgPrice(Map<String, String> search_keyword) throws Exception {
		String avgPrice = e_p005DAO.avgPrice(search_keyword);
		return avgPrice;
	}

	@Override
	public List selectSearch(Map<String, String> select_keyword) throws Exception {
		List selectSearch = e_p005DAO.selectSearch(select_keyword);
		return selectSearch;
	}

	//금일 매출
	@Override
	public String toDaySales(Map map) throws Exception {
		return e_p005DAO.toDaySales(map);
	}

}
