package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import static javax.persistence.GenerationType.IDENTITY;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.UniqueConstraint;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import onlinemarket.model.other.AdvancedValidation;
import onlinemarket.validation.BeforeToday;
import onlinemarket.validation.StringContain;
import onlinemarket.validation.UniqueEmail;

/**
 * User generated by hbm2java
 */
@Entity
@Table(name = "tb_user", schema = "dbo", catalog = "SmartMarket", uniqueConstraints = @UniqueConstraint(columnNames = "email"))
public class User implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private byte gender;
	private String firstName;
	private String lastName;
	private String email;
	private String password;
	private Date birthday;
	private Date createDate = new Date();
	private Date updateDate;
	private String state = State.ACTIVE.getState();
	private String avatar;
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<Rating> ratings = new HashSet<Rating>(0);
	private Set<Address> addresses = new HashSet<Address>(0);
	private Set<Image> images = new HashSet<Image>(0);
	private Set<Notification> notifications = new HashSet<Notification>(0);
	private Set<Cart> carts = new HashSet<Cart>(0);
	private Set<Post> posts = new HashSet<Post>(0);
	private Set<Product> products = new HashSet<Product>(0);
	private Set<Role> roles = new HashSet<Role>(0);
	private Set<Event> events = new HashSet<Event>(0);
	
	public User() {
	}

	public User(byte gender, String firstName, String lastName, String email, String password,
			Date createDate, String state) {
		this.gender = gender;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.createDate = createDate;
		this.state = state;
	}

	public User(byte gender, String firstName, String lastName, String email, String password,
			Date birthday, Date createDate, Date updateDate, String state, String avatar, Set<Order> orders,
			Set<Comment> comments, Set<Rating> ratings, Set<Address> addresses, Set<Image> images,
			Set<Notification> notifications, Set<Cart> carts, Set<Post> posts, Set<Product> products, Set<Role> roles) {
		this.gender = gender;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.password = password;
		this.birthday = birthday;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.state = state;
		this.avatar = avatar;
		this.orders = orders;
		this.comments = comments;
		this.ratings = ratings;
		this.addresses = addresses;
		this.images = images;
		this.notifications = notifications;
		this.carts = carts;
		this.posts = posts;
		this.products = products;
		this.roles = roles;
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

	@Column(name = "gender", nullable = false)
	@Range(min=0, max=2, message = "Giới tính không hợp lệ")
	@NotNull
	public byte getGender() {
		return this.gender;
	}

	public void setGender(byte gender) {
		this.gender = gender;
	}

	@Column(name = "first_name", nullable = false)
	@NotEmpty
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "last_name", nullable = false)
	@NotEmpty
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "email", unique = true, nullable = false, length = 128)
	@Size(max=128)
	@Email
	@NotEmpty
	@UniqueEmail(groups= { AdvancedValidation.CheckEmail.class })
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	@NotEmpty
	@Size(min=6, max=60)
	@JsonIgnore
	@Column(name = "password", nullable = false, length = 60)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Temporal(TemporalType.DATE)
	@DateTimeFormat(pattern = "DD/MM/YYYY")
	@NotNull
	@BeforeToday
	@Column(name = "birthday", length = 23)
	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm a")
	@Column(name = "create_date", nullable = false, length = 23)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "dd-MM-yyyy hh:mm a")
	@Column(name = "update_date", length = 23)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "[state]", nullable = false, length = 10)
	@Size(max=10)
	@NotEmpty
	@StringContain(acceptedValues= {"Active","Inactive","Deleted","Locked"},message="State is invalid")
	public String getState() {
		return this.state;
	}

	public void setState(String state) {
		this.state = state;
	}

	@Column(name = "avatar", length = 1024)
	@Size(max=1024)
	public String getAvatar() {
		return this.avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	@JsonIgnore
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Image> getImages() {
		return this.images;
	}

	public void setImages(Set<Image> images) {
		this.images = images;
	}
	
	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(Set<Address> addresses) {
		this.addresses = addresses;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Notification> getNotifications() {
		return this.notifications;
	}

	public void setNotifications(Set<Notification> notifications) {
		this.notifications = notifications;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Post> getPosts() {
		return this.posts;
	}

	public void setPosts(Set<Post> posts) {
		this.posts = posts;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@JsonIgnore
	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_user_role", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "user_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "user_role_id", nullable = false, updatable = false) })
	public Set<Role> getRoles() {
		return this.roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	@JsonIgnore
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "publisher")
	public Set<Event> getEvents() {
		return events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}

}
