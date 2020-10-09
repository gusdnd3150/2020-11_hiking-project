package project.user.dao;

import java.util.List;
import java.util.Map;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageDAO {
	
	
	
	public void updateUser(UserVO userVO) throws Exception; // 회원수정
	
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

	public int updateUserCont(Map map); // 프로필 사진 등록
	
	public void updateUserProf(Map<String, Object> profMap);

	public UserVO getUserInfo(UserVO userVO);

	public UserVO pwdCheck(UserVO userVO);

	public void updatePwd(UserVO userVO);





}
