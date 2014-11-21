package me.doshou.web.domain;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 商品实体类
 *
 * @author: York Chow<york.chow@actionsky.com>
 * @since: 2014/11/21
 * Time: 22:36
 */
@Entity
public class Product {

    @Id
    @GeneratedValue
    private Long id;

    @ManyToOne(optional = false)
    @JoinColumn(name="cat_id")
    private Category category;

    @Column(nullable=false)
    private String brief;

    @Column(nullable = false)
    private String url;

    @Column(name="img_url")
    private String imgUrl;

    @Column(name = "market_price")
    private Integer marketPrice;    /** 市场价（原价）*/

    @Column(name = "shop_price")
    private Integer shopPrice;      /** 现价 */

    @Column(name="is_best")
    private Boolean isBest = Boolean.FALSE;         /** 是否精品 */

    @Column(name="is_hot")
    private Boolean isHot = Boolean.FALSE;          /** 是否热卖 */

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

    public String getBrief() {
        return brief;
    }

    public void setBrief(String brief) {
        this.brief = brief;
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

    public Integer getMarketPrice() {
        return marketPrice;
    }

    public void setMarketPrice(Integer marketPrice) {
        this.marketPrice = marketPrice;
    }

    public Integer getShopPrice() {
        return shopPrice;
    }

    public void setShopPrice(Integer shopPrice) {
        this.shopPrice = shopPrice;
    }

    public Boolean getIsBest() {
        return isBest;
    }

    public void setIsBest(Boolean isBest) {
        this.isBest = isBest;
    }

    public Boolean getIsHot() {
        return isHot;
    }

    public void setIsHot(Boolean isHot) {
        this.isHot = isHot;
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
