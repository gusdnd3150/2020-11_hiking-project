package project.B_P003_D001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;

import project.B_P003_D001.dao.B_P003_D001productDAO;
import project.B_P003_D001.vo.productAfterVO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;

@Service
public class B_P003_D001productServiceImpl implements B_P003_D001productService{

	@Autowired
	B_P003_D001productDAO b_P003_D001productDAO;
	
	@Override
	public E_P002_D003ProductsVO topDetail(Map<String, Object> map) throws DataAccessException {
		E_P002_D003ProductsVO vo = b_P003_D001productDAO.topDetail(map);
		return vo;
	}

	@Override
	public List<E_P002_D003PhotoVO> detailImages(Map<String, Object> map) throws DataAccessException {
		List<E_P002_D003PhotoVO> list = b_P003_D001productDAO.detailImages(map);
		return list;
	}

	@Override
	public void addAfter(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.addAfter(map);
	}

	@Override
	public List<productAfterVO> afterList(Map<String, Object> map) throws DataAccessException {
		List<productAfterVO> list = b_P003_D001productDAO.afterList(map);
		return list;
	}

	@Override
	public int afterTotal(Map<String,Object> map) {
		int total = b_P003_D001productDAO.afterTotal(map);
		return total;
	}

	@Override
	public productAfterVO getImage(productAfterVO vo) throws DataAccessException {
		productAfterVO resutl = b_P003_D001productDAO.getImage(vo);
		return resutl;
	}

	@Override
	public void addComent(Map<String, Object> map) throws DataAccessException {
		b_P003_D001productDAO.addComent(map);
	}

	@Override
	public int average(Map<String, Object> map) throws DataAccessException {
        int average = b_P003_D001productDAO.average(map);
		return average;
	}
}
