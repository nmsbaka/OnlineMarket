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
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "tb_product", schema = "dbo", catalog = "SmartMarket")
public class Product implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private Brand brand;
	private ProductCategory productCategory;
	private User user;
	private String name;
	private String slug;
	private String description;
	private long price;
	private int quantity;
	private byte state;
	private Date createDate;
	private Date updateDate;
	private String featureImage;
	private Set<Rating> ratings = new HashSet<Rating>(0);
	private Set<RatingStatistic> ratingStatistics = new HashSet<RatingStatistic>(0);
	private Set<Event> events = new HashSet<Event>(0);
	private Set<ProductAttribute> productAttributes = new HashSet<ProductAttribute>(0);
	private Set<ProductViews> productViewses = new HashSet<ProductViews>(0);
	private Set<ProductViewsStatistc> productViewsStatistcs = new HashSet<ProductViewsStatistc>(0);
	private Set<Comment> comments = new HashSet<Comment>(0);
	private Set<Cart> carts = new HashSet<Cart>(0);

	public Product() {
	}

	public Product(Brand brand, ProductCategory productCategory, User user, String name, String slug, long price,
			int quantity, byte state, Date createDate, String featureImage) {
		this.brand = brand;
		this.productCategory = productCategory;
		this.user = user;
		this.name = name;
		this.slug = slug;
		this.price = price;
		this.quantity = quantity;
		this.state = state;
		this.createDate = createDate;
		this.featureImage = featureImage;
	}

	public Product(Brand brand, ProductCategory productCategory, User user, String name, String slug,
			String description, long price, int quantity, byte state, Date createDate, Date updateDate,
			String featureImage, Set<Rating> ratings, Set<RatingStatistic> ratingStatistics, Set<Event> events,
			Set<ProductAttribute> productAttributes, Set<ProductViews> productViewses,
			Set<ProductViewsStatistc> productViewsStatistcs, Set<Comment> comments, Set<Cart> carts) {
		this.brand = brand;
		this.productCategory = productCategory;
		this.user = user;
		this.name = name;
		this.slug = slug;
		this.description = description;
		this.price = price;
		this.quantity = quantity;
		this.state = state;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.featureImage = featureImage;
		this.ratings = ratings;
		this.ratingStatistics = ratingStatistics;
		this.events = events;
		this.productAttributes = productAttributes;
		this.productViewses = productViewses;
		this.productViewsStatistcs = productViewsStatistcs;
		this.comments = comments;
		this.carts = carts;
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

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "brand_id", nullable = false)
	public Brand getBrand() {
		return this.brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id", nullable = false)
	public ProductCategory getProductCategory() {
		return this.productCategory;
	}

	public void setProductCategory(ProductCategory productCategory) {
		this.productCategory = productCategory;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "publisher_id", nullable = false)
	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Column(name = "[name]", nullable = false)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "slug", nullable = false)
	public String getSlug() {
		return this.slug;
	}

	public void setSlug(String slug) {
		this.slug = slug;
	}

	@Column(name = "description")
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "price", nullable = false, precision = 13, scale = 0)
	public long getPrice() {
		return this.price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	@Column(name = "quantity", nullable = false)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "state", nullable = false)
	public byte getState() {
		return this.state;
	}

	public void setState(byte state) {
		this.state = state;
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

	@Column(name = "feature_image", nullable = false, length = 1024)
	public String getFeatureImage() {
		return this.featureImage;
	}

	public void setFeatureImage(String featureImage) {
		this.featureImage = featureImage;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<RatingStatistic> getRatingStatistics() {
		return this.ratingStatistics;
	}

	public void setRatingStatistics(Set<RatingStatistic> ratingStatistics) {
		this.ratingStatistics = ratingStatistics;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_event_product", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "event_id", nullable = false, updatable = false) })
	public Set<Event> getEvents() {
		return this.events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<ProductAttribute> getProductAttributes() {
		return this.productAttributes;
	}

	public void setProductAttributes(Set<ProductAttribute> productAttributes) {
		this.productAttributes = productAttributes;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<ProductViews> getProductViewses() {
		return this.productViewses;
	}

	public void setProductViewses(Set<ProductViews> productViewses) {
		this.productViewses = productViewses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<ProductViewsStatistc> getProductViewsStatistcs() {
		return this.productViewsStatistcs;
	}

	public void setProductViewsStatistcs(Set<ProductViewsStatistc> productViewsStatistcs) {
		this.productViewsStatistcs = productViewsStatistcs;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_comment_product", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "comment_id", nullable = false, updatable = false) })
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product")
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

}
