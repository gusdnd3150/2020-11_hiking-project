package project.B_P002_D001.dao;


import java.util.ArrayList;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.Paging;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

public interface B_P002_D001ShopingMallDAO {

	public List<E_P002_D003ProductsVO> shopListText2(Paging vo) throws DataAccessException;  //쇼핑몰 메인 상세글
	
	public List<Map> shopListTextCate(Map<String,Object> map) throws DataAccessException;  //쇼핑몰 상세글 2
	
	public int totalCount(); //쇼핑몰 메인 페이지 카운트
	public E_P002_D003PhotoVO getImage(E_P002_D003PhotoVO vo) throws DataAccessException;  // 메인 이미지
	public List<Map> searchResult(Map<String, Object> info) throws DataAccessException;  //검색기능 	
	public int SearchTotalCount(Map<String, Object> info); //검색토탈
	
	public List<Map> searchAllResult(Map<String, Object> info) throws DataAccessException;  //검색기능
	public int SearchAllTotalCount(Map<String, Object> info); //전체검색토탈
	
	public List<Map> lastItems() throws DataAccessException;  //최신 상품 5개
	
	//////////////위에는 작업 완료/////////////
	
	
	public int totalCount2(Map<String, Object> info); //그룹별 카운트
	
	
	
	
	
	
	public List<E_P002_D003PhotoVO> shopListImage(Map<String,Object> map) throws DataAccessException;  
	public List<E_P002_D003ProductsVO> shopListText() throws DataAccessException;  //쇼핑몰 메인텍스트


}

