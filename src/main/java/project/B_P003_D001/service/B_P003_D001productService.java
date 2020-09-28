package project.B_P003_D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

public interface B_P003_D001productService {
	
	public E_P002_D003ProductsVO topDetail(Map<String, Object> map) throws DataAccessException;
	public List<E_P002_D003PhotoVO> detailImages(Map<String, Object> map) throws DataAccessException;
	public void addAfter(Map<String, Object> map) throws DataAccessException;
	public void addComent(Map<String, Object> map) throws DataAccessException ;

	public int afterTotal(Map<String,Object> map) ;
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;

}
