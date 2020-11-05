package project.admin.e_p001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;


import project.admin.e_p001.vo.E_p001VO;

public interface E_p001Service {


	//회원 조건별 검색
	public List userSearch(Map<String, String> search) throws Exception;

	//회원 정보 (상태) 수정
	public int upDateUser(Map map)throws Exception;

	//상세보기
	public List userView(int userNum)throws Exception;

	//포인트 추가
	public int updateUserPoint(Map map)throws Exception;

	//금일신규가입자
	public String toDayUser(Map map)throws Exception;

	//금일 신규가입자 리스트
	public List toDayUserList(String st)throws Exception;

}
