package project.commu;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import project.common.FileUtils;
import project.group.GroupDAO;

@Service("commuService")
public class CommuServiceImpl implements CommuService {

	@Autowired
	private CommuDAO commuDAO;

	@Autowired
	private GroupDAO groupDAO;

	@Autowired
	private FileUtils fileUtils;

	@Override
	public Map<String, Object> insertGroup(Map map) throws Exception {
		Map<String, Object> m = commuDAO.insertGroup(map);
		groupDAO.insertGroupLeader(map);
		return m;
	}

	@Override
	public List<Map> selectCreatedCommu(String Id) {
		return commuDAO.selectCreatedCommu(Id);
	}

	@Override
	public List<Map> selectJoinedCommu(String Id) {
		return commuDAO.selectJoinedCommu(Id);
	}

	@Override
	public List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception {
		return commuDAO.selectCommuPageInfo(map);
	}

	@Override
	public List<Map> selectAllGroupList() {
		return commuDAO.selectAllGroupList();
	}

	@Override
	public void updateBoardAccess(int groupNum, int boardAccess) {
		commuDAO.updateBoardAccess(groupNum, boardAccess);

	}

	@Override
	public void updateGroup(Map map) {
		commuDAO.updateGroup(map);
	}

	@Override
	public void insertAlbum(Map m) {

		commuDAO.insertAlbum(m);
	}

	@Override
	public void insertPost(Map m) {
		commuDAO.insertPost(m);
	}

	@Override
	public List<Map> selectCommuPosts(Map<String, Object> m) throws Exception {
		return commuDAO.selectCommuPosts(m);
	}

	@Override
	public List<Map> selectAlbumPosts(Map<String, Object> m) {
		return commuDAO.selectAlbumPosts(m);
	}

	@Override
	public int countAlbumPosts(Map<String, Object> m) {
		return commuDAO.countAlbumPosts(m);
	}

	@Override
	public List<CommuVO> selectPgAlbumPosts(Map<String, Object> vM) {
		return commuDAO.selectPgAlbumPosts(vM);
	}

	@Override
	public void insertAlbum(int groupNum, List<MultipartFile> files, String path, Map<String, Object> m)
			throws Exception {
		List<Map> list = fileUtils.saveCKFile(groupNum, files, path);
		Map<String, Object> map = m;
		for (Map mm : list) {
			map.putAll(mm);
			commuDAO.insertAlbum(map);
		}

	}

}
