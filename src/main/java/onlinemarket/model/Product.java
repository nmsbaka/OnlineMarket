package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.util.*;

import javax.persistence.CascadeType;
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
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

import onlinemarket.model.other.AdvancedValidation;
import onlinemarket.validation.UniqueProductSlug;

/**
 * Product generated by hbm2java
 */
@Entity
@Table(name = "tb_product", schema = "dbo", catalog = "SmartMarket")
@UniqueProductSlug(groups = {AdvancedValidation.CheckSlug.class})
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
	private String beforeSlug;
	private String description;
	private long price;
	private int quantity;
	private Byte state;
	private Integer weight;
	private Date releaseDate;
	private String size;
	private Date createDate = new Date();
	private Date updateDate;
	private String featureImage;
	private Set<Rating> ratings = new HashSet<>(0);
	private Set<RatingStatistic> ratingStatistics = new HashSet<>(0);
	private Set<Event> events = new HashSet<>(0);
	private List<ProductAttributeValues> productAttributeValues = new ArrayList<>();
	private Set<ProductViews> productViewses = new HashSet<>(0);
	private Set<ProductViewsStatistc> productViewsStatistcs = new HashSet<>(0);
	private Set<Comment> comments = new HashSet<>(0);
	private Set<Cart> carts = new HashSet<>(0);
	private Integer countAttribute;

	public Product() {
	}

	public void updateProduct(Product product){
		brand = product.brand;
		productCategory = product.productCategory;
		user = product.user;
		name = product.name;
		slug = product.slug;
		description = product.description;
		price = product.price;
		quantity = product.quantity;
		state = product.state;
		weight = product.weight;
		size = product.size;
		updateDate = new Date();
		featureImage = product.featureImage;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@NotNull
	@JoinColumn(name = "brand_id", nullable = false)
	public Brand getBrand() {
		return this.brand;
	}

	public void setBrand(Brand brand) {
		this.brand = brand;
	}

	@ManyToOne(fetch = FetchType.EAGER)
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

	@Column(name = "name", nullable = false)
	@Size(max = 255)
	@NotEmpty
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
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

	@Transient
	public String getBeforeSlug() {
		return beforeSlug;
	}

	public void setBeforeSlug(String beforeSlug) {
		this.beforeSlug = beforeSlug;
	}

	@Column(name = "description")
	@Size(max = 1000000)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "price", nullable = false, precision = 13, scale = 6)
	@Range(max = 1000000000)
	public long getPrice() {
		return this.price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	@Column(name = "quantity", nullable = false)
	@Range(max = 10000)
	public int getQuantity() {
		return this.quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Column(name = "state", nullable = false)
	@Range(min = 0, max = 3)
	public Byte getState() {
		return this.state;
	}

	public void setState(Byte state) {
		this.state = state;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss a")
	@Column(name = "create_date", nullable = false, length = 23)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "dd/MM/yyyy hh:mm:ss a")
	@Column(name = "update_date", length = 23)
	public Date getUpdateDate() {
		return this.updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@Column(name = "feature_image", nullable = false, length = 1024)
	@NotEmpty
	@Size(max = 2048)
	public String getFeatureImage() {
		return this.featureImage;
	}

	public void setFeatureImage(String featureImage) {
		this.featureImage = featureImage;
	}


	@Column(name = "weight", nullable = false)
	@Range(min = 0, max = 1000000)
	public Integer getWeight() {
		return weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "MM/yyyy")
	@Column(name = "release_date", nullable = false, length = 23)
	public Date getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}

	@Column(name = "size", nullable = false)
	@Size(min = 3, max = 150)
	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}


	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.REMOVE)
	public Set<Rating> getRatings() {
		return this.ratings;
	}

	public void setRatings(Set<Rating> ratings) {
		this.ratings = ratings;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.REMOVE)
	public Set<RatingStatistic> getRatingStatistics() {
		return this.ratingStatistics;
	}

	public void setRatingStatistics(Set<RatingStatistic> ratingStatistics) {
		this.ratingStatistics = ratingStatistics;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JoinTable(name = "tb_event_product", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "event_id", nullable = false, updatable = false) })
	public Set<Event> getEvents() {
		return this.events;
	}

	public void setEvents(Set<Event> events) {
		this.events = events;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
	public List<ProductAttributeValues> getProductAttributeValues() {
		return productAttributeValues;
	}

	public void setProductAttributeValues(List<ProductAttributeValues> productAttributeValues) {
		this.productAttributeValues = productAttributeValues;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.REMOVE)
	public Set<ProductViews> getProductViewses() {
		return this.productViewses;
	}

	public void setProductViewses(Set<ProductViews> productViewses) {
		this.productViewses = productViewses;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.REMOVE)
	public Set<ProductViewsStatistc> getProductViewsStatistcs() {
		return this.productViewsStatistcs;
	}

	public void setProductViewsStatistcs(Set<ProductViewsStatistc> productViewsStatistcs) {
		this.productViewsStatistcs = productViewsStatistcs;
	}

	@ManyToMany(fetch = FetchType.LAZY, cascade = CascadeType.REMOVE)
	@JoinTable(name = "tb_comment_product", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "product_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "comment_id", nullable = false, updatable = false) })
	public Set<Comment> getComments() {
		return this.comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "product", cascade = CascadeType.REMOVE)
	public Set<Cart> getCarts() {
		return this.carts;
	}

	public void setCarts(Set<Cart> carts) {
		this.carts = carts;
	}

	@Override
	public boolean equals(Object o) {
		if (this == o) return true;
		if (o == null || getClass() != o.getClass()) return false;
		Product product = (Product) o;
		return Objects.equals(id, product.id) &&
				Objects.equals(slug, product.slug);
	}

	@Override
	public int hashCode() {

		return Objects.hash(id, slug);
	}

    @Transient
    public Integer getCountAttribute() {
	    if(countAttribute == null) countAttribute = 0;
        return countAttribute;
    }

    public void setCountAttribute(Integer countAttribute) {
        this.countAttribute = countAttribute;
    }

    public Integer processCount(){
	    if(countAttribute == null) countAttribute = -1;
	    return countAttribute++;
    }

    public boolean checkProductAttributes(AttributeValues attributeValues){
		ProductAttributeValues productAttributeValue = new ProductAttributeValues();
		productAttributeValue.setAttributeValuesId(attributeValues.getId());
		productAttributeValue.setProductId(this.getId());
		return productAttributeValues.contains(productAttributeValue);
	}
}
