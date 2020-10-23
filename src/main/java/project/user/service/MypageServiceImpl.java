package project.user.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import project.common.FileUtils;
import project.user.dao.MypageDAO;
import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Service
public class MypageServiceImpl implements MypageService {
	public static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);

	@Autowired
	public MypageDAO mypageDAO;

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	@Override
	public void updateUser(UserVO userVO) throws Exception {
		mypageDAO.updateUser(userVO);
	}

	@Override
	public void deleteUser(LoginDTO loginDTO) throws Exception {
		mypageDAO.deleteUser(loginDTO);
	}

	@Override
	public int updateUserCont(int userNum, MultipartFile fileP, String path) throws IOException {
		Map map = fileUtils.saveSingleFile(userNum, fileP, path);
		return mypageDAO.updateUserCont(map);
	}

	@Override
	public void updateUserProf(Map<String, Object> profMap) {
		System.out.println("1");
		mypageDAO.updateUserProf(profMap);
	}

	@Override
	public UserVO getUserInfo(UserVO userVO) {
		return mypageDAO.getUserInfo(userVO);
	}

	@Override
	public UserVO pwdCheck(UserVO userVO) {
		return mypageDAO.pwdCheck(userVO);
	}

	@Override
	public void updatePwd(UserVO userVO) {
		mypageDAO.updatePwd(userVO);

	}

}