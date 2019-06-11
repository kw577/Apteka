package proj.kw.aptekaOnline.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import proj.kw.aptekaBackend.dao.UserDAO;
import proj.kw.aptekaBackend.dto.User;
import proj.kw.aptekaOnline.model.UserModel;


@ControllerAdvice
public class GlobalController {


	@Autowired
	private UserDAO userDAO;

	@Autowired
	private HttpSession session;

	private User user = null;
	private UserModel userModel = null;
		


	@ModelAttribute("userModel")
	public UserModel getUserModel() {		
		if(session.getAttribute("userModel")==null) {
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

				System.out.println("\n\n\n\n\nGlobal controller - searching user by email address: " + authentication.getName());
			
				user = userDAO.getByEmail(authentication.getName());
				
				
				
				if(user!=null) {
					
					userModel = new UserModel();
					

					userModel.setId(user.getId());
					userModel.setEmail(user.getEmail());
					userModel.setRole(user.getRole());
					userModel.setFullName(user.getName() + " " + user.getSurname());

					
					//System.out.println("\nGlobal controller - userModel id: " + user.getId());
				
					
					
					//uzupelnic przypisywanie koszyka po dodaniu klasy Cart  (odkomentowac)
					if(userModel.getRole().equals("USER")) {
						//userModel.setCart(user.getCart());					
					}				

					//dodanie atrybutu sesji
					session.setAttribute("userModel", userModel);
					return userModel;
				}			
			
		}

		return (UserModel) session.getAttribute("userModel");		
	}

}