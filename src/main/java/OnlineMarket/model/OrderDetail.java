package OnlineMarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import org.hibernate.validator.constraints.Range;

import javax.persistence.AttributeOverride;
import javax.persistence.AttributeOverrides;
import javax.persistence.Column;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;

/**
 * OrderDetail generated by hbm2java
 */
@Entity
@Table(name = "tb_order_detail", schema = "dbo", catalog = "SmartMarket")
public class OrderDetail implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private OrderDetailId id;
	private Order order;
	private Product product;
	private int productQuantity;
	private long productPrice;
	private double productWeight;
	private String productName;

	public OrderDetail() {
	}

	public OrderDetail(OrderDetailId id, Order order, int productQuantity, long productPrice, double productWeight,
			String productName) {
		this.id = id;
		this.order = order;
		this.productQuantity = productQuantity;
		this.productPrice = productPrice;
		this.productWeight = productWeight;
		this.productName = productName;
	}

	@EmbeddedId

	@AttributeOverrides({
			@AttributeOverride(name = "productId", column = @Column(name = "product_id", nullable = false)),
			@AttributeOverride(name = "orderId", column = @Column(name = "order_id", nullable = false)) })
	public OrderDetailId getId() {
		return this.id;
	}

	public void setId(OrderDetailId id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "order_id", nullable = false, insertable = false, updatable = false)
	public Order getOrder() {
		return this.order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "product_id", nullable = false, insertable = false, updatable = false)
	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Column(name = "product_quantity", nullable = false)
    @Range(max = 10)
    @NotNull
	public int getProductQuantity() {
		return this.productQuantity;
	}

	public void setProductQuantity(int productQuantity) {
		this.productQuantity = productQuantity;
	}

	@Column(name = "product_price", nullable = false, precision = 13, scale = 0)
	public long getProductPrice() {
		return this.productPrice;
	}

	public void setProductPrice(long productPrice) {
		this.productPrice = productPrice;
	}

	@Column(name = "product_weight", nullable = false, precision = 53, scale = 0)
	public double getProductWeight() {
		return this.productWeight;
	}

	public void setProductWeight(double productWeight) {
		this.productWeight = productWeight;
	}

	@Column(name = "product_name", nullable = false)
	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

}
