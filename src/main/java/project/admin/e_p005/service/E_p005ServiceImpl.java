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

	@Override
	public List searchPayList(Map<String, String> search_keyword)  throws Exception{
		System.out.println("서비스 들어옴");
		List search = e_p005DAO.searchPayList(search_keyword);
		return  search;
	}

}
