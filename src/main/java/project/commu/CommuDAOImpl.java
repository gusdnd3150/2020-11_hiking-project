package project.commu;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.group.GroupVO;


@Repository
public class CommuDAOImpl implements CommuDAO {

	@Autowired
	private CommuVO commuVO;
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public Map<String, Object> insertGroup(Map map) {
		sqlSession.insert("commuMapper.insertGroup", map);
		Map<String, Object> m = sqlSession.selectOne("commuMapper.selectMaxGroupNum");
		Map<String, Object> mm = m;
		for(int i=1; i<=5; i++) {
			m.put("boardType", i);
			System.out.println(mm);
			sqlSession.insert("commuMapper.insertGroupsBoard", mm);
		}
		//sqlSession.insert("commuMapper.insertGroupsBoardPost", list);
	return	m;
	} 

	@Override
	public List<Map> selectCreatedCommu(String id) {
		List<GroupVO> list = sqlSession.selectList("commuMapper.selectCreatedGroupNum", id);
		List<Map> list2 = new ArrayList<Map>();
		if(!list.isEmpty()) {
			list2 = sqlSession.selectList("commuMapper.selectCommu", list);
		}else {
			Map map = new HashMap();
			map.put("NAME", "내가 만든 산모임이 아직 없습니다.");
			map.put("STOREDFILENAME","home.png");
			map.put("GROUPNUM","0");
			list2.add(map);
		}
		return list2;
	}

	@Override
	public List<Map> selectJoinedCommu(String id) {
		List<GroupVO> list = sqlSession.selectList("commuMapper.selectJoinedGroupNum", id);
		List<Map> list2 = new ArrayList<Map>();
		if(!list.isEmpty()) {
			list2 = sqlSession.selectList("commuMapper.selectCommu", list);
		}else {
			Map map = new HashMap();
			map.put("NAME", "내가 가입한 산모임이 아직 없습니다.");
			map.put("STOREDFILENAME","home.png");
			map.put("GROUPNUM","0");
			list2.add(map);
		}
		return list2;
	}

	@Override
	public List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception {
		List<Map> list =new ArrayList<Map>();
		list.add(sqlSession.selectOne("commuMapper.selectGroups", map));
		list.add(sqlSession.selectOne("commuMapper.selectUserWaiting", map));
		list.add(sqlSession.selectOne("commuMapper.selectGroupsMedia", map));
		list.addAll(sqlSession.selectList("commuMapper.selectGroupsBoard", map));
		list.add(sqlSession.selectOne("commuMapper.selectImportantPost", map));
		return list;
	}

	@Override
	public List<Map> selectAllGroupList() {
		return sqlSession.selectList("commuMapper.selectAllGroupList");
	}

	@Override
	public void updateBoardAccess(int groupNum, int boardAccess) {
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("groupNum",groupNum);
		m.put("boardAccess",boardAccess);
		sqlSession.update("commuMapper.updateBoardAccess", m);		
	}

	@Override
	public void updateGroup(Map map) {
		sqlSession.update("commuMapper.updateGroup", map);
	}

	@Override
	public void insertAlbum(Map m) {
		System.out.println("m:  "+ m);
		sqlSession.insert("commuMapper.insertAlbum",m);
	}

	@Override
	public void insertPost(Map m) {
		System.out.println(",....m,........"+ m);
		sqlSession.insert("commuMapper.insertPost", m);
	}

	@Override
	public List<Map> selectCommuPosts(Map<String, Object> m) {
		return sqlSession.selectList("commuMapper.selectCommuPosts", m);
	}

	@Override
	public List<Map> selectAlbumPosts(Map<String, Object> m) {
		return sqlSession.selectList("commuMapper.selectAlbumPosts", m);
	}

	@Override
	public int countAlbumPosts(Map<String, Object> m) {
		return sqlSession.selectOne("commuMapper.countAlbumPosts", m);
	}

	@Override
	public List<CommuVO> selectPgAlbumPosts(Map<String, Object> vM) {
		return sqlSession.selectList("commuMapper.selectPgAlbumPosts", vM);
	}

	@Override
	public int deletePost(int postNum) {
		sqlSession.delete("commuMapper.deletePost", postNum);
		return 1;
		
	}

	@Override
	public void updatePostType(Map m) {
		sqlSession.update("commuMapper.updatePostType", m);
	}

	@Override
	public String selectACommuPost(int postNum) {
		return sqlSession.selectOne("commuMapper.selectACommuPost", postNum);
	}

}
