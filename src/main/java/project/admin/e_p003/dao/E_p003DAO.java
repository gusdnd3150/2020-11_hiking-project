package project.admin.e_p003.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.admin.e_p003.vo.E_p003VO;

public interface E_p003DAO {

	public int addCSpost(Map map)throws Exception;

	public List selectviewDetaList(int csPostNum)throws Exception;

	public int upDateCsBoard(Map map)throws Exception;

	public int deleteUserCsboard(int csPostNum)throws Exception;

	public String viewType(int csPostNum)throws Exception;

	public List searchBoard(Map<String, String> search)throws Exception;

	public String countBoard()throws Exception;

	public String countBoard300()throws Exception;



}
