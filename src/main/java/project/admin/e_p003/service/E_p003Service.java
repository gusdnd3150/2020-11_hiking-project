package project.admin.e_p003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import project.admin.e_p003.vo.E_p003VO;

public interface E_p003Service {

	public int addCSpost(Map map)throws Exception;

	public List viewDetaList(int csPostNum)throws Exception;

	public int upDateCsBoard(Map map)throws Exception;

	public int removeCsboard(int csPostNum)throws Exception;

	public int mailSending(Map<String, String> map)throws Exception;

	public String viewType(int csPostNum)throws Exception;

	public List searchCsBoard(Map<String, String> search)throws Exception;

	public String countBoard()throws Exception;

}
