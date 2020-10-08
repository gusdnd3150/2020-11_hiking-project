package project.admin.e_p003.dao;

import java.util.List;
import java.util.Map;

import project.admin.e_p003.vo.E_p003VO;

public interface E_p003DAO {

	public int insertCSpost(E_p003VO e_p003VO)throws Exception;

	public List selectCsBoard(Map<String, String> search)throws Exception;

	public List selectviewDetaList(int csPostNum)throws Exception;

	public int upDateCsBoard(E_p003VO e_p003VO)throws Exception;

	public int deleteUserCsboard(int csPostNum)throws Exception;

	public String viewType(int csPostNum)throws Exception;

}
