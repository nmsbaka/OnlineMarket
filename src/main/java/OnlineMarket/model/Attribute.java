package OnlineMarket.model;
// default package

// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import java.util.List;
import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import OnlineMarket.validation.StringContain;

/**
 * Attribute generated by hbm2java
 */
@Entity
@Table(name = "tb_attribute", schema = "dbo", catalog = "SmartMarket")
public class Attribute implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer id;
	private AttributeGroup attributeGroup;
	private String name;
	private String description;
	private String type;
	private int priority;
	private List<AttributeValues> attributeValues;

	public Attribute() {
	}

	public Attribute(AttributeGroup attributeGroup, String name) {
		this.attributeGroup = attributeGroup;
		this.name = name;
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
	@JoinColumn(name = "attribute_group_id", nullable = false)
	public AttributeGroup getAttributeGroup() {
		return this.attributeGroup;
	}

	public void setAttributeGroup(AttributeGroup attributeGroup) {
		this.attributeGroup = attributeGroup;
	}

	@Column(name = "name", nullable = false)
	@Size(max = 128)
	@NotEmpty
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "description")
	@Size(min = 50, max = 500)
	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	@Column(name = "type", nullable = false)
	@Size( max = 50)
	@StringContain(acceptedValues = { "text", "url", "date", "hidden", "number", "email", "tel", "range", "select", "checkbox", "select-multiple" })
	@NotEmpty
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@Column(name = "priority")
	@Range(min = 0, max = 1000)
	public int getPriority() {
		return priority;
	}

	public void setPriority(int priority) {
		this.priority = priority;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "attribute")
	@OrderBy("value")
	public List<AttributeValues> getAttributeValues() {
		return this.attributeValues;
	}

	public void setAttributeValues(List<AttributeValues> attributeValues) {
		this.attributeValues = attributeValues;
	}

}