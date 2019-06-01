package proj.kw.aptekaBackend.dao;

import java.util.List;

import proj.kw.aptekaBackend.dto.Category;


public interface CategoryDAO {

	//lista kategorii na pasku nawigacji
	List<Category> onNavbarList();
	
	//lista wszystkich aktywnych kategorii
	List<Category> list();

	//zwraca pojedyncza kategorie
	Category getSingleCategory(int id);
	
}