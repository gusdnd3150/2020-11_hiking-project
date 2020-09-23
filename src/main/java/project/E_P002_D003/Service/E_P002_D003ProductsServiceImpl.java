package project.E_P002_D003.Service;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.E_P002_D003.dao.E_P002_D003ProductsDAO;
import project.E_P002_D003.vo.E_P002_D003PhotoVO;
import project.E_P002_D003.vo.E_P002_D003ProductsVO;


//@Transactional(propagation=Propagation.REQUIRED)
@Service
public class E_P002_D003ProductsServiceImpl implements E_P002_D003ProductsService {
	
	@Autowired
	private E_P002_D003ProductsDAO e_P002_D003ProductsDAO;
	
	@Override
	public void addProduct(Map<String, Object> datahMap)throws DataAccessException{
		e_P002_D003ProductsDAO.addProduct(datahMap);
	}
	@Override
	public void saveImage(Map<String, Object> datahMap) {
		e_P002_D003ProductsDAO.saveImage(datahMap);
	}
}