package bath.group3.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import bath.group3.model.Group;
import bath.group3.model.User;
import bath.group3.util.HibernateUtil;

public class ImportDataDAO {
	/*-------------Tìm hiểu thêm để thay thế ----------*/
	Session session;
	public Session insertDataFormFile(User user){
		session = HibernateUtil.getSessionFactory().openSession();
		session.beginTransaction();
		try {
			session.save(user);
			session.getTransaction().commit();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return session;
	}

}
