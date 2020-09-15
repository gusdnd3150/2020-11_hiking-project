package project.user.dao;

import project.user.vo.UserVO;

public interface UserDAO {

	public void insertUser(UserVO userVO) throws Exception;

	public int userIdCheck(String userId)throws Exception;

}
