package proj.kw.aptekaBackend.restcontroller;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import proj.kw.aptekaBackend.dao.ProductDAO;
import proj.kw.aptekaBackend.dto.Product;

@Repository("ProductDAO") 
@Transactional 
public class RESTProduct implements ProductDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	public Product get(int productId) {
		
		try {			
			return sessionFactory
					.getCurrentSession()
					.get(Product.class,Integer.valueOf(productId));			
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}
		return null;
		
	}

	@Override
	public List<Product> listAll() {
		return sessionFactory
				.getCurrentSession()
				.createQuery("FROM Product" , Product.class)
				.getResultList();
	}

	@Override
	public List<Product> listActiveProduct() {
		String query = "FROM Product WHERE active = :active";
		
		return sessionFactory
				.getCurrentSession()
				.createQuery(query,Product.class)
				.setParameter("active", true)
				.getResultList();
	}

	@Override
	public List<Product> listActiveProductByCategory(int category_id) {
		String query = "FROM Product WHERE active = :active AND category_id = :category_id";
		
		return sessionFactory
				.getCurrentSession()
				.createQuery(query,Product.class)
				.setParameter("active", true)
				.setParameter("category_id", category_id)
				.getResultList();
	}

	@Override
	public List<Product> getProductsDiscount() {
		String query = "FROM Product WHERE active = :active AND discount > 0";
		
		return sessionFactory
				.getCurrentSession()
				.createQuery(query,Product.class)
				.setParameter("active", true)
				.getResultList();
	}

}
