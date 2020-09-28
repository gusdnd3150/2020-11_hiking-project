package project.admin.e_p003.dao;

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
	public int insertCSpost(E_p003VO e_p003VO) throws Exception {
		return  sqlSession.insert("admin.mapper.e_p003.insertCSPost", e_p003VO);
	}
	//조건검색
	@Override
	public List selectCsBoard(Map<String, String> search) throws Exception {
		List<E_p003VO> csBoardList=sqlSession.selectList("admin.mapper.e_p003.selectUser", search);
		return csBoardList;
	}
	//상세보기
	@Override
	public List selectviewDetaList(int csPostNum) throws Exception {
		List viewDetaList = sqlSession.selectList("admin.mapper.e_p003.selectViewDetaListt",csPostNum);
		return viewDetaList;
	}
	//수정
	@Override
	public int upDateCsBoard(E_p003VO e_p003VO) throws Exception {
		int result = 0;
		result=sqlSession.update("admin.mapper.e_p003.upDateCsBoard",e_p003VO);
		return result;
	}
	// 글 삭제
	@Override
	public int deleteUserCsboard(int csPostNum) throws Exception {
		return sqlSession.delete("admin.mapper.e_p003.deleteUserCsboard",csPostNum);
	}

}
