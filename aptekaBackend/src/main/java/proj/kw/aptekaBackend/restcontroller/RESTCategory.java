package proj.kw.aptekaBackend.restcontroller;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import proj.kw.aptekaBackend.dao.CategoryDAO;
import proj.kw.aptekaBackend.dto.Category;

@Transactional
@Repository("categoryDAO")
public class RESTCategory implements CategoryDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	
		
	@Override
	public List<Category> onNavbarList() {
		
		String selectActiveCategory = "FROM Category WHERE active = :active and navbar = :navbar";

		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		query.setParameter("active", true);
		query.setParameter("navbar", true);

		return query.getResultList();
	}


	//zwraca liste wszssytkich aktywnych kategorii
	@Override
	public List<Category> list() {

		String selectActiveCategory = "FROM Category WHERE active = :active";

		Query query = sessionFactory.getCurrentSession().createQuery(selectActiveCategory);
		query.setParameter("active", true);

		return query.getResultList();
	}


	//zwraca pojedyncza kategorie
	@Override
	public Category getSingleCategory(int id) {
		
		return sessionFactory.getCurrentSession().get(Category.class, Integer.valueOf(id));
		
	}

	



	
}
