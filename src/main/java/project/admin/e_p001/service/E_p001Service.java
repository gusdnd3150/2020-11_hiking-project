package project.admin.e_p001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import project.admin.e_p001.vo.E_p001VO;

public interface E_p001Service {

	//회원 등록
	public int addUser(E_p001VO e_p001VO) throws Exception;

	//회원 조건별 검색
	public List userSearch(Map<String, String> search) throws Exception;

	//회원 삭제
	public int removeUser(int userNum) throws Exception;

	//정보 수정전 회원정보 출력매소드
	public List upDateUserList(String userId)throws Exception;
	
	//회원 정보 수정
	public int upDateUser(E_p001VO e_p001VO)throws Exception;

}
