package OnlineMarket.model;
// default package

// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import OnlineMarket.util.group.AdvancedValidation;
import com.fasterxml.jackson.annotation.*;
import org.hibernate.validator.constraints.NotEmpty;




@Entity
@Table(name = "tb_address", schema = "dbo", catalog = "SmartMarket")
@JsonInclude(JsonInclude.Include.NON_NULL)
public class Address implements java.io.Serializable {


	private static final long serialVersionUID = 1L;
	private Integer id;
	private User user;
	private Integer userId;
	private Province province;
	private Integer provinceId;
	private String firstName;
	private String lastName;
	private String address;
	private String phoneNumber;
	private String city;
	private Set<Order> orders = new HashSet<>(0);

	public Address(Province province, User user, String firstName, String lastName, String address, String phoneNumber,
			String city) {
		this.province = province;
		this.user = user;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.city = city;
	}

	public Address(Province province, User user, String firstName, String lastName, String address, String phoneNumber,
			String city, Set<Order> orders) {
		this.province = province;
		this.user = user;
		this.firstName = firstName;
		this.lastName = lastName;
		this.address = address;
		this.phoneNumber = phoneNumber;
		this.city = city;
		this.orders = orders;
	}

	public Address() {
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
	@JoinColumn(name = "user_id", nullable = false)
    @NotNull(groups = AdvancedValidation.AddNew.class)
    public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "province_id", nullable = false)
	@NotNull
	public Province getProvince() {
		return this.province;
	}

	public void setProvince(Province province) {
		this.province = province;
	}

	@Column(name = "first_name", nullable = false)
	@Size(max = 64)
	@NotEmpty(groups = AdvancedValidation.AddNew.class)
	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	@Column(name = "last_name", nullable = false)
	@Size(max = 64)
	@NotEmpty(groups = AdvancedValidation.AddNew.class)
	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	@Column(name = "address", nullable = false)
	@NotEmpty
	@Size(max = 255)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "phone_number", nullable = false, length = 11)
    @NotEmpty
	@Pattern(regexp = "(^$|[0-9]{10,11})")
	public String getPhoneNumber() {
		return this.phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	@Column(name = "city", nullable = false)
	@Size(max = 32)
	@NotEmpty
	public String getCity() {
		return this.city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	@OneToMany(mappedBy = "address", fetch = FetchType.LAZY)
    @JsonIgnore
	public Set<Order> getOrders() {
		return this.orders;
	}

	public void setOrders(Set<Order> orders) {
		this.orders = orders;
	}

	@Transient
    @NotNull(groups = AdvancedValidation.AddNew.class)
	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.user = new User();
		this.user.setId(userId);
		this.userId = userId;
	}

    @Transient
    @NotNull(groups = AdvancedValidation.AddNew.class)
    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
	    this.province = new Province();
	    this.province.setId(provinceId);
        this.provinceId = provinceId;
    }
}
