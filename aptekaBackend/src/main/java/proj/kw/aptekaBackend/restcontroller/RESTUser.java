package proj.kw.aptekaBackend.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import proj.kw.aptekaBackend.dao.CategoryDAO;
import proj.kw.aptekaBackend.dao.UserDAO;
import proj.kw.aptekaBackend.dto.Category;
import proj.kw.aptekaBackend.dto.User;

@Transactional
@Repository("userDAO")
public class RESTUser implements UserDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public boolean addUser(User user) {
		try {			
			sessionFactory.getCurrentSession().persist(user);			
			return true;
		}
		catch(Exception ex) {
			return false;
		}
	}
	
	
	@Override
	public User getByEmail(String email) {
		
		String selectQuery = "FROM User WHERE email = :email";
		
		try {
			return sessionFactory.getCurrentSession()
					.createQuery(selectQuery, User.class)
					.setParameter("email", email)
					.getSingleResult();
		}
		catch (Exception ex) {
			//System.out.println("\n\n\n\nBrak wynikow!!!");
			//ex.printStackTrace();
			return null;
		}
		
		
		
	}
		
}
