package bath.group3.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.AbstractController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import bath.group3.dao.LoginDAO;
import bath.group3.model.Group;
import bath.group3.model.User;
import bath.group3.util.HibernateUtil;

@Controller
public class LoginController{
	
	
	
	@RequestMapping(value = "/login", method=RequestMethod.GET)
	public ModelAndView displayLogin(HttpServletRequest arg0, HttpServletResponse arg1){
		// TODO Auto-generated method stub
		// Gen Database
		/*Group group = new Group("G_002","Admin");
		Group group1 = new Group("G_002","User");
		User user = new User("1","Admin","Admin","1",group);
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		session.beginTransaction();
		session.save(user);
		session.getTransaction().commit();
		session.close();
		sessionFactory.close();*/
		return new ModelAndView("login");
	}
	
	@RequestMapping(value = "/handlingLogin", method=RequestMethod.POST)
	public String handlingLogin(HttpServletRequest arg0, HttpServletResponse arg1m,RedirectAttributes redirectAttributes,
	@RequestParam("loginid") String user,@RequestParam("loginpsw") String pass, HttpSession session){
		// TODO Auto-generated method stub
		LoginDAO loginDAO = new LoginDAO();
		if(loginDAO.checkLogin(user, pass)){
			List<User> list = loginDAO.getInforIfLoginSucess(user);
			session.setAttribute("name", list.get(0).getFirstName() + " " +list.get(0).getLastName());
			session.setAttribute("groupId", list.get(0).getGroup().getId());
			System.out.println(session.getAttribute("name"));
			return "redirect:importdata";
		}
		else{
			redirectAttributes.addFlashAttribute("notify","Tài khoản hoặc mật khẩu không chính xác.");
			return "redirect:login";
		}
	}
}
