package project.admin.e_p005.dao;

import java.util.List;
import java.util.Map;

public interface E_p005DAO {

	List searchPayList(Map<String, String> search_keyword)throws Exception;

}
