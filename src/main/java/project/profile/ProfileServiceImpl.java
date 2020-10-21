package project.profile;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.Map;

@Service("profileService")
public class ProfileServiceImpl implements ProfileService{

    @Resource(name = "profileDAO")
    private ProfileDAO profileDAO;

    public Map selectUserProfileById(String userId) {
        return profileDAO.selectUserProfileById(userId);
    }
}
