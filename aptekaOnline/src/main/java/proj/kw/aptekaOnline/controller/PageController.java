package proj.kw.aptekaOnline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import proj.kw.aptekaBackend.dao.CategoryDAO;
import proj.kw.aptekaBackend.dao.ProductDAO;
import proj.kw.aptekaBackend.dao.UserDAO;
import proj.kw.aptekaBackend.dto.Category;
import proj.kw.aptekaBackend.dto.Product;
import proj.kw.aptekaBackend.dto.User;

@Controller
public class PageController {

	@Autowired 
	private CategoryDAO categoryDAO;
	
	@Autowired // polaczenie z projektem Backendu 
	private ProductDAO productDAO;
	
	@Autowired
	private UserDAO userDAO;
	
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
	
	
	
	@RequestMapping(value = "/view/id/{id}/product")
	public ModelAndView showSingleProduct(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("page");

		Product product = null;
		product = productDAO.get(id);

		//lista kategorii na pasku nawigacji
		mv.addObject("categoriesList", categoryDAO.onNavbarList());
		
		

		mv.addObject("product", product);

		mv.addObject("productDetailsPage", true); 

		return mv;
	}
	
	
	
	//rejestracja
		@RequestMapping(value = "register", method = RequestMethod.GET)
		public ModelAndView register() {
			
			ModelAndView mv = new ModelAndView("page");
			mv.addObject("title", "Registration");
			mv.addObject("isRegisterPage", true);
			
			User nUser = new User();
			mv.addObject("newUser", nUser);
			
			//lista kategorii na pasku nawigacji
			mv.addObject("categoriesList", categoryDAO.onNavbarList());
						
			return mv;
			
			
		}
	
	
		// dodawanie nowego uzytkownika
		@RequestMapping(value = "register", method = RequestMethod.POST) 
		public String handleProductSubmission(@ModelAttribute("newUser") User nUser) { 




			System.out.println("\n\n\nAdding new user");
			System.out.println("New user id: " + nUser.getId());
			System.out.println("New user name: " + nUser.getName());
			System.out.println("New user surname: " + nUser.getSurname());
			System.out.println("New user email: " + nUser.getEmail());
			System.out.println("New user address: " + nUser.getAddress());
			System.out.println("New user password: " + nUser.getPassword());
			System.out.println("New user role: " + nUser.getRole());
			
			nUser.setRole("USER");
			nUser.setEnabled(true);
			// create a new product record
			userDAO.addUser(nUser);
			
			
			return "redirect:/login";
		}


		
		// strona logowania
		@RequestMapping(value = { "/login" })
		public ModelAndView login() {

			
			ModelAndView mv = new ModelAndView("page");
			mv.addObject("title", "Login");
			mv.addObject("isLoginPage", true);
			
						
			//lista kategorii na pasku nawigacji
			mv.addObject("categoriesList", categoryDAO.onNavbarList());
						
			return mv;
			
			

		}
		
		
		
		@RequestMapping(value = "/cart/add/id/{id}/product")
		public ModelAndView addToCart(@PathVariable int id) {
			ModelAndView mv = new ModelAndView("page");

			Product product = null;
			product = productDAO.get(id);

			//lista kategorii na pasku nawigacji
			mv.addObject("categoriesList", categoryDAO.onNavbarList());
			
			

			mv.addObject("product", product);

			mv.addObject("addToCartPage", true); 
						
			return mv;
		}
		
		
	
}
