package project.admin.e_p002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface E_p002DAO {

	int insertProd(Map map)throws Exception;

	int insertProdPhoto(List<Map> list);

	List<HashMap<String, String>> selectProd(Map<String, String> search)throws Exception;

	int deleteProd(int prodNum)throws Exception;

}
