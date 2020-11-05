package project.admin.e_p003.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.admin.e_p003.vo.E_p003VO;

@Repository
public class E_p003DAOImpl implements E_p003DAO{
	@Autowired
	private SqlSession sqlSession;

	//공지사항 등록
	@Override
	public int addCSpost(Map map) throws Exception {
		return sqlSession.insert("admin.mapper.e_p003.addCSpost", map);
	}

	//상세보기
	@Override
	public List selectviewDetaList(int csPostNum) throws Exception {
		List viewDetaList = sqlSession.selectList("admin.mapper.e_p003.selectViewDetaListt",csPostNum);
		return viewDetaList;
	}
	//수정
	@Override
	public int upDateCsBoard(Map map) throws Exception {
		return sqlSession.update("admin.mapper.e_p003.upDateCsBoard",map);
	}
	// 글 삭제
	@Override
	public int deleteUserCsboard(int csPostNum) throws Exception {
		return sqlSession.delete("admin.mapper.e_p003.deleteUserCsboard",csPostNum);
	}
	@Override
	public String viewType(int csPostNum) throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p003.viewType",csPostNum);
	}
	
	//조회
	@Override
	public List searchBoard(Map<String, String> search) throws Exception {
		List list = sqlSession.selectList("admin.mapper.e_p003.selectUser", search);
		return list;
	}

	//문의글 카운트 알림
	@Override
	public String countBoard() throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p003.countBoard");
	}

	//신고글 카운트 알림
	@Override
	public String countBoard300() throws Exception {
		return sqlSession.selectOne("admin.mapper.e_p003.countBoard300");
	}
	

}
