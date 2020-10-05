package project.user.service;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import project.user.dao.MypageDAO;
import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

@Service
public class MypageServiceImpl implements MypageService{
	public static final Logger logger = LoggerFactory.getLogger(MypageServiceImpl.class);
	
	@Autowired
	public MypageDAO mypageDAO;

	@Override
	public void updateUser(UserVO userVO) throws Exception {
		mypageDAO.updateUser(userVO);
	}
	
	@Override
	public void deleteUser(LoginDTO loginDTO) throws Exception {
		mypageDAO.deleteUser(loginDTO);
	}

	@Override
	public void updateUserCont(Map<String, Object> contMap) {
		mypageDAO.updateUserCont(contMap);
		
	}

	@Override
	public void updateUserProf(Map<String, Object> profMap) {
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
