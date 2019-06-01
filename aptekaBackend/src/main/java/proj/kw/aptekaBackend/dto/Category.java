package proj.kw.aptekaBackend.dto;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class Category {

	
	@Id 
	@GeneratedValue(strategy = GenerationType.IDENTITY) 
	private int id;
	private String name;
	private boolean active = true;
	
	//atrybut okresla czy ta kategoria bedzie wyswietlona na pasku nawigacji
	private boolean navbar = true;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
	}

	public boolean isNavbar() {
		return navbar;
	}

	public void setNavbar(boolean navbar) {
		this.navbar = navbar;
	}




	



}