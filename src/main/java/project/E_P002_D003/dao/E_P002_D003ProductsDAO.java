package project.E_P002_D003.dao;


import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

public interface E_P002_D003ProductsDAO {

	void addProduct(Map<String, Object> datahMap) throws DataAccessException; //상품등록(detail)
	public void saveImage(Map<String, Object> hmap);                       //상품등록(image)
        //////////////위에는 작업 완료/////////////

}
