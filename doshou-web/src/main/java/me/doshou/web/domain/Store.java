package me.doshou.web.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 店铺实例类
 *
 * @author YorkChow<york.chow@actionsky.com>
 * @since 2014/12/27
 * Time: 21:39
 */
@Entity
public class Store {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name="cat_id")
    private Category category;

    @Column(nullable=false)
    private String name;

    @Column(nullable = false)
    private String url;

    @Column(name="img_url")
    private String imgUrl;

    @Column(name = "is_show")
    private Boolean isShow = Boolean.FALSE;         /** 是否显示，删除的设置False */

    @Column(name = "sort_order")
    private Integer sortOrder;      /** 商品显示顺序，数字越小显示越前面 */

    @Column(name="add_date", nullable=false)
    @Temporal(TemporalType.DATE)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date addDate;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public Boolean getIsShow() {
        return isShow;
    }

    public void setIsShow(Boolean isShow) {
        this.isShow = isShow;
    }

    public Integer getSortOrder() {
        return sortOrder;
    }

    public void setSortOrder(Integer sortOrder) {
        this.sortOrder = sortOrder;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }
}
