package project.commu;

import java.util.List;
import java.util.Map;

import project.Paging;

public interface CommuDAO {

	public Map<String, Object> insertGroup(Map map);

	public List<Map> selectCreatedCommu(String id);

	public List<Map> selectJoinedCommu(String id);

	public List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception;

	public List<Map> selectAllCommuList(Map map);

	public void updateBoardAccess(int groupNum, int boardAccess);

	public void updateGroup(Map map);

	public void insertAlbum(Map m);

	public void insertPost(Map m);

	public List<Map> selectCommuPosts(Map<String, Object> m);

	public List<Map> selectAlbumPosts(Map<String, Object> m);

	public int countAlbumPosts(Map<String, Object> m);

	public List<CommuVO> selectPgAlbumPosts(Map<String, Object> vM);

	public int deletePost(int postNum);

	public void updatePostType(Map m);

	public String selectACommuPost(int postNum);

	public List<Map> selectMemberList(Map groupNum);

	public Map<String, Object> selectLeader(Map groupNum);

	public List<Map> selectScheduleList(Map groupNum);

	public void updatePost(Map m);

	public List<Map> selectSearchPosts(Map<String, Object> map) throws Exception;

	public List<Map> selectCommuPageInfo2(Map<String, Object> map) throws Exception;

	public int commuMandate(Map map);

}
