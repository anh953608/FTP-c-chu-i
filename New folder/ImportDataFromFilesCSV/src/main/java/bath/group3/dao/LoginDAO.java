package bath.group3.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import bath.group3.model.User;
import bath.group3.util.HibernateUtil;
import java.util.List;

public class LoginDAO {
	Session session = null;
	public boolean checkLogin(String user, String pass){
		session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From User u where u.id=:user and u.password=:pass");
        query.setParameter("user", user);
        query.setParameter("pass", pass);
        List<User> list = query.list();
        if (list.size() > 0) {
            return true;
        }
        session.close();
        return false;
	}
	public List getInforIfLoginSucess(String id){
		session = HibernateUtil.getSessionFactory().openSession();
        Query query = session.createQuery("From User u where u.id=:id");
        query.setParameter("id", id);
        List<User> list = query.list();
        if (list.size() > 0) {
            return list;
        }
        session.close();
        return null;
	}
	
}
