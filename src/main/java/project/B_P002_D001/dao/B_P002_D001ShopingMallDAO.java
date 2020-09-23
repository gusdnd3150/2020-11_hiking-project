package project.B_P002_D001.dao;


import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Paging;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

public interface B_P002_D001ShopingMallDAO {

	public List<E_P002_D003PhotoVO> shopListImage(Paging vo) throws DataAccessException;  //쇼핑몰 메인이미지
	public List<E_P002_D003ProductsVO> shopListText2(Paging vo) throws DataAccessException;  //쇼핑몰 메인이미지
	public int totalCount();
	public E_P002_D003PhotoVO getImage(E_P002_D003PhotoVO vo) throws DataAccessException;  // 메인 이미지
	
        //////////////위에는 작업 완료/////////////
	
	
	public List<E_P002_D003ProductsVO> shopListText() throws DataAccessException;  //쇼핑몰 메인텍스트


}

