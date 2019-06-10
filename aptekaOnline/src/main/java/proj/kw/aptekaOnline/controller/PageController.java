package proj.kw.aptekaOnline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj.kw.aptekaBackend.dao.CategoryDAO;
import proj.kw.aptekaBackend.dao.ProductDAO;
import proj.kw.aptekaBackend.dto.Category;

@Controller
public class PageController {

	@Autowired 
	private CategoryDAO categoryDAO;
	
	@Autowired // polaczenie z projektem Backendu 
	private ProductDAO productDAO;
	
	
	//strona glowna
	@RequestMapping(value = {"/", "/home"})
	public ModelAndView startPage() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("isStartPage", true);
		
		//lista kategorii na pasku nawigacji
		mv.addObject("categoriesList", categoryDAO.onNavbarList());
		
		//dodanie produktow krote sa na promocji
		mv.addObject("discountsList", productDAO.getProductsDiscount());
		
		return mv;
		
		
	}
	
	
	//strona z regulaminem zakupow
	@RequestMapping(value = { "terms" })
	public ModelAndView termsInfo() {

		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title", "Terms");
		mv.addObject("isTermsPage", true);
		
		//lista kategorii na pasku nawigacji
		mv.addObject("categoriesList", categoryDAO.onNavbarList());
		
		return mv;

	}
	
	
	//pokzuje liste produktow wg kategorii
	@RequestMapping(value = { "show/category/{id}/offer" }) 
	public ModelAndView showProductsByCategory(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView("page");
		
			
		mv.addObject("isShowOfferPage", true);
		
		//lista kategorii na pasku nawigacji
		mv.addObject("categoriesList", categoryDAO.onNavbarList());
		
		
		//zwraca wybrana kategorie
		Category category = null;
		category = categoryDAO.getSingleCategory(id);
		mv.addObject("category", category);	
		
		
		
		//lista produktow zostaeni pobrana poprzez AJAX - mapowanie z JsonController.java
				
		return mv;
}
	
	
	
	
	/*
	 * Wyswietla oferte wg podanego slowa kluczowego
	 */
	@RequestMapping(value = { "offer/search" }) 
	public ModelAndView searchProductsWithCriteria(
			@RequestParam("searchPhrase") String searchPhrase) {


		String searchCriteria;
		searchCriteria = "?searchPhrase=" + searchPhrase;

		ModelAndView mv = new ModelAndView("page");
				
		mv.addObject("isSearchOfferPage", true);
		mv.addObject("searchingCriteria", searchCriteria);
		
		//lista kategorii na pasku nawigacji
		mv.addObject("categoriesList", categoryDAO.onNavbarList());
		
		mv.addObject("title", "Search offer");
		
		
		return mv;

	}
	
	
	
	
	
}
