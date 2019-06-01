package proj.kw.aptekaBackend.dao;

import java.util.List;

import proj.kw.aptekaBackend.dto.Product;


public interface ProductDAO {

	//zwraca pojedynczy produkt
	Product get(int productId);
	
	//zwraca liste wszystkich produktow
	List<Product> listAll();	

	//zwraca liste produktow oznaczonych w bazie jako aktywne
	List<Product> listActiveProduct();
	
	//zwraca liste aktywnych produktow wg kategorii
	List<Product> listActiveProductByCategory(int categoryId);
	
	//zwraca liste produktow na promocji
	List<Product> getProductsDiscount();
	
	
	
	

}