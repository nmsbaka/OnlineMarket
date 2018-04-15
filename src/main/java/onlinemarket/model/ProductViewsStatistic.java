package onlinemarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import javax.persistence.*;

/**
 * ProductViewsStatistic generated by hbm2java
 */
@Entity
@Table(name = "tb_statistic_product_views", schema = "dbo", catalog = "SmartMarket")
public class ProductViewsStatistic implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int id;
	private Product product;
	private Integer week;
	private Integer month;
	private Integer year;
	private Integer total;

	public ProductViewsStatistic() {
	}

	public ProductViewsStatistic(int id, Product product) {
		this.id = id;
		this.product = product;
	}

	public ProductViewsStatistic(int id, Product product, Integer week, Integer month, Integer year, Integer total) {
		this.id = id;
		this.product = product;
		this.week = week;
		this.month = month;
		this.year = year;
		this.total = total;
	}

	@Id

	@Column(name = "_id", unique = true, nullable = false)
	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false)
	public Product getProduct() {
		return this.product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "[week]")
	public Integer getWeek() {
		return this.week;
	}

	public void setWeek(Integer week) {
		this.week = week;
	}

	@Column(name = "[month]")
	public Integer getMonth() {
		return this.month;
	}

	public void setMonth(Integer month) {
		this.month = month;
	}

	@Column(name = "[year]")
	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	@Column(name = "total")
	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

}
