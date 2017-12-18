package bath.group3.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;

@Controller
public class LoginController{

	public LoginController() {
		// TODO Auto-generated constructor stub
	}

	@RequestMapping(value = "/login", method=RequestMethod.GET)
	protected ModelAndView displayLogin(HttpServletRequest arg0, HttpServletResponse arg1){
		// TODO Auto-generated method stub
		return new ModelAndView("login");
	}

}
