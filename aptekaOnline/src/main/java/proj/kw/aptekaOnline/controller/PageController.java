package proj.kw.aptekaOnline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class PageController {

	//strona glowna
	@RequestMapping(value = {"/", "/home"})
	public ModelAndView startPage() {
		
		ModelAndView mv = new ModelAndView("page");
		mv.addObject("title", "Home");
		mv.addObject("isStartPage", true);
		
		return mv;
		
		
	}
	
	
	//strona z regulaminem zakupow
	@RequestMapping(value = { "terms" })
	public ModelAndView termsInfo() {

		ModelAndView mv = new ModelAndView("page");
		
		mv.addObject("title", "Terms");
		mv.addObject("isTermsPage", true);
		return mv;

	}
	
	
	
	
}
