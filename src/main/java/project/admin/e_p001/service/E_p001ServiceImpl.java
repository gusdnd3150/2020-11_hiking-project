package project.admin.e_p001.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.admin.e_p001.dao.E_p001DAO;
import project.admin.e_p001.vo.E_p001VO;


@Service

public class E_p001ServiceImpl implements E_p001Service{
	
	@Autowired
	private E_p001DAO e_p001DAO;

	@Override //회원등록
	public int addUser(E_p001VO e_p001VO) throws Exception {
		return e_p001DAO.addUser(e_p001VO);
	}

	@Override //회원 조건검색
	public List userSearch(Map<String, String> search) throws Exception {
		 List userList = e_p001DAO.selectUser(search);
		return userList;
	}

	//회원 정보 수정 (상태)
	@Override
	public int upDateUser(Map map) throws Exception {
		// TODO Auto-generated method stub
		return e_p001DAO.upDateUser(map);
	}

	//상세보시
	@Override
	public List userView(int userNum) throws Exception {
		List list = e_p001DAO.userView(userNum); 
		return list;
	}	


	
}
