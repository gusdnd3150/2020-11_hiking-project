package project.user.dao;

import java.util.List;
import java.util.Map;

import org.springframework.transaction.annotation.Transactional;

import project.user.dto.LoginDTO;
import project.user.vo.UserVO;

public interface MypageDAO {
	
	
	@Transactional
	public void updateUser(UserVO userVO) throws Exception; // 회원수정
	
	@Transactional
	public void deleteUser(LoginDTO loginDTO) throws Exception; // 회원탈퇴

	@Transactional
	public int updateUserCont(Map map); // 프로필 사진 등록
	
	@Transactional
	public void updateUserProf(Map<String, Object> profMap);

	public UserVO getUserInfo(UserVO userVO);

	public UserVO pwdCheck(UserVO userVO);

	@Transactional
	public void updatePwd(UserVO userVO);





}
