package proj.kw.aptekaOnline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import proj.kw.aptekaBackend.dao.ProductDAO;
import proj.kw.aptekaBackend.dto.Product;



@Controller 
@RequestMapping("json/data")  
public class JsonDataController {

	@Autowired   
	private ProductDAO productDAO;

	//zwraca liste produktow wg kategorii - w formacie JSON
	@RequestMapping("/category/{id}/products")   
	@ResponseBody 
	public List<Product> getEquipmentByCategory(@PathVariable int id){


		return productDAO.listActiveProductByCategory(id);
	}

} 