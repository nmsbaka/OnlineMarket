package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.math.BigDecimal;
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
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * Event generated by hbm2java
 */
@Entity
@Table(name = "tb_event", schema = "dbo", catalog = "SmartMarket")
public class Event implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer id;
	private User publisher;
	private String name;
	private String content;
	private Integer status;
	private Byte percentValue;
	private BigDecimal value;
	private String code;
	private Date createDate;
	private Date updateDate;
	private Date dateFrom;
	private Date dateTo;
	private BigDecimal maxPrice;
	private BigDecimal minPrice;
	private Set<Order> orders = new HashSet<Order>(0);
	private Set<Product> products = new HashSet<Product>(0);
	private Set<ProductCategory> productCategories = new HashSet<ProductCategory>(0);
	private Set<Brand> brands = new HashSet<Brand>(0);

	public Event() {
	}

	
	
	public Event(User publisher, String name, Integer status, Date createDate, Date dateFrom, Date dateTo,
			BigDecimal maxPrice, BigDecimal minPrice) {
		super();
		this.publisher = publisher;
		this.name = name;
		this.status = status;
		this.createDate = createDate;
		this.dateFrom = dateFrom;
		this.dateTo = dateTo;
		this.maxPrice = maxPrice;
		this.minPrice = minPrice;
	}


	public Event(User publisher, String name, String content, Integer status, Byte percentValue,
			BigDecimal value, String code, Date createDate, Date updateDate, Date dateFrom, Date dateTo,
			BigDecimal maxPrice, BigDecimal minPrice, Set<Order> orders, Set<Product> products,
			Set<ProductCategory> productCategories, Set<Brand> brands) {
		this.publisher = publisher;
		this.name = name;
		this.content = content;
		this.status = status;
		this.percentValue = percentValue;
		this.value = value;
		this.code = code;
		this.createDate = createDate;
		this.updateDate = updateDate;
		this.dateFrom = dateFrom;
		this.dateTo = dateTo;
		this.maxPrice = maxPrice;
		this.minPrice = minPrice;
		this.orders = orders;
		this.products = products;
		this.productCategories = productCategories;
		this.brands = brands;
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
	@JoinColumn(name = "publisher_id", nullable = false)
	public User getPublisher() {
		return publisher;
	}

	public void setPublisher(User publisher) {
		this.publisher = publisher;
	}

	@Column(name = "[name]", nullable = false)
	@Size(min = 6, max = 255)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "content")
	@Size(max = 4000)
	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	@Column(name = "[status]", nullable = false)
	@Range(min = 0, max = 1)
	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	@Column(name = "percent_value")
	@Range(min = 0, max = 100)
	public Byte getPercentValue() {
		return this.percentValue;
	}

	public void setPercentValue(Byte percentValue) {
		this.percentValue = percentValue;
	}

	@Column(name = "value", precision = 13)
	@Range(max = 1000000000)
	public BigDecimal getValue() {
		return this.value;
	}

	public void setValue(BigDecimal value) {
		this.value = value;
	}

	@Column(name = "code", length = 32)
	@Size(max = 32)
	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
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

	@Temporal(TemporalType.TIMESTAMP)
	@Column(name = "date_from", nullable = false, length = 23)
	@DateTimeFormat(pattern = "DD-MM-YYYY")
	public Date getDateFrom() {
		return this.dateFrom;
	}

	public void setDateFrom(Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	@Temporal(TemporalType.TIMESTAMP)
	@DateTimeFormat(pattern = "DD-MM-YYYY")
	@Column(name = "date_to", nullable = false, length = 23)
	public Date getDateTo() {
		return this.dateTo;
	}

	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}

	@Column(name = "max_price", nullable = false, precision = 13)
	@Range(max = 1000000000)
	public BigDecimal getMaxPrice() {
		return this.maxPrice;
	}

	public void setMaxPrice(BigDecimal maxPrice) {
		this.maxPrice = maxPrice;
	}

	@Column(name = "min_price", nullable = false, precision = 13)
	@Range(max = 1000000000)
	public BigDecimal getMinPrice() {
		return this.minPrice;
	}

	public void setMinPrice(BigDecimal minPrice) {
		this.minPrice = minPrice;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_event_order", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "event_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "order_id", nullable = false, updatable = false) })
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_event_product", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "event_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "product_id", nullable = false, updatable = false) })
	public Set<Product> getProducts() {
		return this.products;
	}

	public void setProducts(Set<Product> products) {
		this.products = products;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_event_category", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "event_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "product_category_id", nullable = false, updatable = false) })
	public Set<ProductCategory> getProductCategories() {
		return this.productCategories;
	}

	public void setProductCategories(Set<ProductCategory> productCategories) {
		this.productCategories = productCategories;
	}

	@ManyToMany(fetch = FetchType.LAZY)
	@JoinTable(name = "tb_event_brand", schema = "dbo", catalog = "SmartMarket", joinColumns = {
			@JoinColumn(name = "event_id", nullable = false, updatable = false) }, inverseJoinColumns = {
					@JoinColumn(name = "brand_id", nullable = false, updatable = false) })
	public Set<Brand> getBrands() {
		return this.brands;
	}

	public void setBrands(Set<Brand> brands) {
		this.brands = brands;
	}

}
