package project.user.service;

import project.user.vo.UserVO;

public interface UserService {

	public void insertUser(UserVO userVO) throws Exception;

	public int userIdCheck(String userId) throws Exception;

}
