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
		 List<E_p001VO> userList=sqlSession.selectList("admin.mapper.e_p001.selectUser", search);
		return userList;
	}

	//회원 정보 수정 (상태)
	@Override
	public int upDateUser(Map map) throws Exception {
		return sqlSession.update("admin.mapper.e_p001.upDateUser", map);
	}

	//상세보기
	@Override
	public List userView(int userNum) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p001.usetView", userNum);
		return list;
	}

	//포인트 지급
	@Override
	public int updateUserPoint(Map map) throws Exception {
		return sqlSession.insert("admin.mapper.e_p001.updateUserPoint", map);
	}

	//금일신규가입자 카운트
	@Override
	public String toDayUser(Map map) throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p001.toDayUser",map);
	}


}