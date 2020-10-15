package project.user.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageService {



	public void updateUser(UserVO userVO) throws Exception; // 회원수정

	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

	public int updateUserCont(int userNum, MultipartFile fileP, String path)throws IOException;

	public void updateUserProf(Map<String, Object> profMap);

	public UserVO getUserInfo(UserVO userVO);

	public UserVO pwdCheck(UserVO userVO);

	public void updatePwd(UserVO userVO);







}