package project.profile;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;

import java.util.List;
import java.util.Map;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{

    @Resource(name = "profileDAO")
    private ProfileDAO profileDAO;

    public Map selectUserProfileById(String userId) {
        return profileDAO.selectUserProfileById(userId);
    }

	@Override
	public int countFollowBoth(Map<String, Object> m) {
		return profileDAO.countFollowBoth(m);
	}

	@Override
	public int countFollowStatus(Map<String, Object> m) {
		return profileDAO.countFollowStatus(m);
	}
	
	@Override
	public int insertUserFollow(Map<String, Object> map) {
		return profileDAO.insertUserFollow(map);
	}

	@Override
	public int deleteUserFollow(Map<String, Object> map) {
		return profileDAO.deleteUserFollow(map);
	}

	@Override
	public List<Map> selectFollowingList(String userId) {
		return profileDAO.selectFollowingList(userId);
	}

	@Override
	public List<Map> selectFollowerList(String userId) {
		return profileDAO.selectFollowerList(userId);
	}
	
}
