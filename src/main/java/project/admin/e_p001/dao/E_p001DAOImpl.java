package project.admin.e_p001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.admin.e_p001.vo.E_p001VO;

@Repository
public class E_p001DAOImpl implements E_p001DAO{
	@Autowired
	private SqlSession sqlSession;
	

	@Override //회원등록
	public int addUser(E_p001VO e_p001VO) throws Exception {	
		return sqlSession.insert("admin.mapper.e_p001.insertUsers", e_p001VO);
	}

	@Override //회원 조건 검색
	public List selectUser(Map<String, String> search) throws Exception {
		System.out.println("조건 검색들어옴");
		 List<E_p001VO> userList=sqlSession.selectList("admin.mapper.e_p001.selectUser", search);
		return userList;
	}

	@Override // 회원 삭제
	public int deleteUser(String id) throws Exception {
		return sqlSession.delete("admin.mapper.e_p001.deleteUser",id);
	}

	@Override //회원 정보 수정전 list 출력
	public List selectUpdateUserList(String userNum) throws Exception {
		List upDateUserList=sqlSession.selectList("admin.mapper.e_p001.selectUpdateUserList",userNum);
		return upDateUserList;
	}

	@Override //회원 정보 수정
	public int upDaet(E_p001VO e_p001VO) throws Exception {
		int result = 0;
		result=sqlSession.update("admin.mapper.e_p001.updateUser", e_p001VO);
		return result;
	}

}