package project.user.service;

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
	public void updateUser(LoginDTO loginDTO) throws Exception {
		mypageDAO.updateUser(loginDTO);
	}
	
	@Override
	public void deleteUser(LoginDTO loginDTO) throws Exception {
		mypageDAO.deleteUser(loginDTO);
	}


	
	

}
