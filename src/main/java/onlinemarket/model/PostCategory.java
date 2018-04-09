package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import org.hibernate.validator.constraints.NotEmpty;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

/**
 * PostCategory generated by hbm2java
 */
@Entity
@Table(name = "tb_post_category", schema = "dbo", catalog = "SmartMarket")
public class PostCategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private String slug;
	private String name;
	private Date createDate;
	private Date updateDate;
	private String description;
	private Set<Post> posts = new HashSet<>(0);

	public PostCategory() {
	}

	public PostCategory(String slug, String name, Date createDate) {
		this.slug = slug;
		this.name = name;
		this.createDate = createDate;
	}

	public PostCategory(String slug, String name, Date createDate, Date updateDate, String description,
			Set<Post> posts) {
		this.slug = slug;
		this.name = name;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.description = description;
		this.posts = posts;
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

	@Column(name = "slug", nullable = false)
	@Size(max = 255)
	@NotEmpty
	public String getSlug() {
		return this.slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	@Column(name = "name", nullable = false)
	@Size(max = 255)
	@NotEmpty
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "create_date", nullable = false, length = 23)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "update_date", length = 23)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "description")
	@Size(max = 1000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "postCategory")
	public Set<Post> getPosts() {
		return this.posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

}
