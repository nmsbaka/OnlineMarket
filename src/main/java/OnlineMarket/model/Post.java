package OnlineMarket.model;
// default package
// Generated Jan 2, 2018 4:57:38 PM by Hibernate Tools 4.3.5.Final

import OnlineMarket.util.group.AdvancedValidation;
import OnlineMarket.validation.UniquePostSlug;
import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.*;

import static javax.persistence.GenerationType.IDENTITY;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

/**
 * Post generated by hbm2java
 */
@Entity
@Table(name = "tb_post", schema = "dbo", catalog = "SmartMarket")
@UniquePostSlug(groups = {AdvancedValidation.CheckSlug.class})
public class Post implements java.io.Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;
    private Integer id;
    private PostCategory postCategory;
    private User user;
    private String title;
    private String slug;
    private String beforeSlug;
    private String content;
    private Date createDate;
    private Date updateDate;
    private Integer status;
    private String postType;
    private String featureImage;
    private Set<Comment> comments = new HashSet<>(0);

    public Post() {
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
    @JoinColumn(name = "post_category_id")
    @NotNull(groups = AdvancedValidation.AddPost.class)
    public PostCategory getPostCategory() {
        return this.postCategory;
    }

    public void setPostCategory(PostCategory postCategory) {
        this.postCategory = postCategory;
    }

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "publisher_id", nullable = false)
    public User getUser() {
        return this.user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    @Column(name = "title", nullable = false)
    @Size(max = 255)
    @NotEmpty
    public String getTitle() {
        return this.title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    @Column(name = "content", nullable = false)
    @Size(max = 10000000)
    public String getContent() {
        return this.content;
    }

    public void setContent(String content) {
        this.content = content;
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

    @Column(name = "status", nullable = false)
    @Range(min = 0, max = 3)
    public Integer getStatus() {
        return this.status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Column(name = "post_type", nullable = false)
    public String getPostType() {
        return this.postType;
    }

    public void setPostType(String postType) {
        this.postType = postType;
    }

    @Column(name = "feature_image", length = 1024)
    @Size(max = 1024)
    public String getFeatureImage() {
        return this.featureImage;
    }

    public void setFeatureImage(String featureImage) {
        this.featureImage = featureImage;
    }

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "post", cascade = CascadeType.REMOVE)
    public Set<Comment> getComments() {
        return this.comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

}