package project.commu;

import java.util.List;
import java.util.Map;


public interface CommuDAO {

	public Map<String, Object> insertGroup(Map map);

	public List<Map> selectCreatedCommu(String id);

	public List<Map> selectJoinedCommu(String id);

	public List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception;

	public List<Map> selectAllGroupList();

}
