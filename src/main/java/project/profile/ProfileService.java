package project.profile;

import java.util.List;
import java.util.Map;

public interface ProfileService {

    Map selectUserProfileById(String userId);

    //맞팔중인지?  
	int countFollowBoth(Map<String, Object> m);

    //로그인 아이디가 해당 유저를 팔로우 중인
	int countFollowStatus(Map<String, Object> m);

	//팔로우
	int insertUserFollow(Map<String, Object> map);

	//팔로우 취소
	int deleteUserFollow(Map<String, Object> map);

	List<Map> selectFollowingList(String userId);

	List<Map> selectFollowerList(String userId);
	
	Map<String, Object> selectFollowCnt(String userId);
}
