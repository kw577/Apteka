package proj.kw.aptekaOnline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import proj.kw.aptekaBackend.dao.CategoryDAO;
import proj.kw.aptekaBackend.dao.ProductDAO;

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
	
	
	
	
}
