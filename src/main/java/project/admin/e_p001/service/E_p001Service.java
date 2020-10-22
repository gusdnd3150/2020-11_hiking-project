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

	//회원 정보 (상태) 수정
	public int upDateUser(Map map)throws Exception;

	//상세보기
	public List userView(int userNum)throws Exception;



}
