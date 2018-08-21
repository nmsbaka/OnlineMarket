package OnlineMarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import com.fasterxml.jackson.annotation.*;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

/**
 * MenuGroup generated by hbm2java
 */
@Entity
@Table(name = "tb_menu_group", schema = "dbo", catalog = "SmartMarket")
public class MenuGroup implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String name;
	private String description;
	private Set<Menu> menus = new HashSet<>(0);

	public MenuGroup() {
	}

	public MenuGroup(String name) {
		this.name = name;
	}

	public MenuGroup(String name, String description, Set<Menu> menus) {
		this.name = name;
		this.description = description;
		this.menus = menus;
	}

	@Id
	@GeneratedValue(strategy = IDENTITY)

	@Column(name = "_id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@Column(name = "name", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "menuGroup", cascade = CascadeType.ALL)
	@Fetch(FetchMode.SELECT)
	@JsonIgnore
	@OrderBy("priority")
	public Set<Menu> getMenus() {
		return this.menus;
	}

	public void setMenus(Set<Menu> menus) {
		this.menus = menus;
	}

}