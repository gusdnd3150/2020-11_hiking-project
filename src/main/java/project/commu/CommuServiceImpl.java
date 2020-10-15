package project.commu;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.group.GroupDAO;

@Service
public class CommuServiceImpl implements CommuService{
	
	@Autowired
	private CommuDAO commuDAO;
	
	@Autowired
    private GroupDAO groupDAO;


	@Override
	public void insertGroup(Map map) throws Exception {
	    commuDAO.insertGroup(map);
	    groupDAO.insertGroupLeader(map);
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

}
