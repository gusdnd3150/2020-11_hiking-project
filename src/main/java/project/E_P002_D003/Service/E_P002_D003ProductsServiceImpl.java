package project.E_P002_D003.Service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.E_P002_D003.dao.E_P002_D003ProductsDAO;


@Service
@Transactional(propagation=Propagation.REQUIRED)
public class E_P002_D003ProductsServiceImpl implements E_P002_D003ProductsService {
	
	@Autowired
	private E_P002_D003ProductsDAO e_P002_D003ProductsDAO;
	
	@Override
	public void addProduct(Map<String, Object> datahMap) throws Exception {
		e_P002_D003ProductsDAO.addProduct(datahMap);
	}
	
	/*
	@Override
	public void saveImage(Map<String, Object> hmap) {
		e_P002_D003ProductsDAO.saveImage(hmap);
	}
	@Override
	public Map<String, Object> getByteImage() {
		return e_P002_D003ProductsDAO.getByteImage();
	}*/

}