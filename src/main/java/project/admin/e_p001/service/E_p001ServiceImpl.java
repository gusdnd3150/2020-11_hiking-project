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


	@Override //회원 조건검색
	public List userSearch(Map<String, String> search) throws Exception {
		 List userList = e_p001DAO.selectUser(search);
		return userList;
	}

	//회원 정보 수정 (상태)
	@Override
	public int upDateUser(Map map) throws Exception {
		return e_p001DAO.upDateUser(map);
	}

	//상세보시
	@Override
	public List userView(int userNum) throws Exception {
		List list = e_p001DAO.userView(userNum); 
		return list;
	}

	//포인트 추가
	@Override
	public int updateUserPoint(Map map) throws Exception {
		return e_p001DAO.updateUserPoint(map);
	}

	//금일 신규가입자 카운트
	@Override
	public String toDayUser(Map map) throws Exception {
		return e_p001DAO.toDayUser(map);
	}

	//금일 신규가입자 리스트
	@Override
	public List toDayUserList(String st) throws Exception {
		List list = e_p001DAO.toDayUserList(st);
		return list;
	}	


	
}
