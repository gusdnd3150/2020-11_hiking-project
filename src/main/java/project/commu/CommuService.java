package project.commu;

import java.util.List;
import java.util.Map;


public interface CommuService {

	 void insertGroup(Map map) throws Exception;

	 List<Map> selectCreatedCommu(String Id);
	 List<Map> selectJoinedCommu(String Id);

	 List<Map> selectCommuPageInfo(Map<String, Object> map) throws Exception;

	 List<Map> selectAllGroupList();

}
