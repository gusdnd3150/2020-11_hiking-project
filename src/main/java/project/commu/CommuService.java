package project.commu;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import project.Paging;

public interface CommuService {

	Map<String, Object> insertGroup(Map map) throws Exception;

	List<Map> selectCreatedCommu(String Id);

	List<Map> selectJoinedCommu(String Id);

	List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception;

	List<Map> selectAllGroupList();

	void updateBoardAccess(int groupNum, int boardAccess);

	void updateGroup(Map map);

	void insertAlbum(Map m);

	void insertPost(Map m);

	List<Map> selectCommuPosts(Map<String, Object> m) throws Exception;

	List<Map> selectAlbumPosts(Map<String, Object> m);

	int countAlbumPosts(Map<String, Object> m);

	List<CommuVO> selectPgAlbumPosts(Map<String, Object> vM);

	void insertAlbum(int userNum, List<MultipartFile> files, String path, Map<String, Object> m) throws Exception;

	int deletePost(int postNum);

	void updatePostType(Map m);

	String selectACommuPost(int postNum);

}
