package project.B_P003_D001.dao;

import java.util.List;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

public interface B_P003_D001productDAO {
	public E_P002_D003ProductsVO topDetail(Map<String,Object> map) throws DataAccessException;  //쇼핑몰 상세 상단 정보
	public List<E_P002_D003PhotoVO> detailImages(Map<String,Object> map)throws DataAccessException;
	public void addAfter(Map<String,Object> map)throws DataAccessException;
	public void addComent(Map<String,Object> map)throws DataAccessException;
	public int average(Map<String,Object> map)throws DataAccessException; //평균값 구하는 메서드

	public int afterTotal(Map<String,Object> map);
	public List<productAfterVO> afterList(Map<String,Object> map)throws DataAccessException;
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException;  // 
	
}
