package project.commu;

import java.util.List;
import java.util.Map;

import project.Paging;

public interface CommuDAO {

	public Map<String, Object> insertGroup(Map map);

	public List<Map> selectCreatedCommu(String id);

	public List<Map> selectJoinedCommu(String id);

	public List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception;

	public List<Map> selectAllGroupList();

	public void updateBoardAccess(int groupNum, int boardAccess);

	public void updateGroup(Map map);

	public void insertAlbum(Map m);

	public void insertPost(Map m);

	public List<Map> selectCommuPosts(Map<String, Object> m);

	public List<Map> selectAlbumPosts(Map<String, Object> m);

	public int countAlbumPosts(Map<String, Object> m);

	public List<CommuVO> selectPgAlbumPosts(Map<String, Object> vM);

}
