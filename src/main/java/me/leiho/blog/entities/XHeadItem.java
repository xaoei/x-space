package me.leiho.blog.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "x_head_item")
public class XHeadItem implements Serializable {
    /**
     * 唯一标识
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 顺序
     */
    @Column(name = "sort_id")
    private Integer sortId;

    /**
     * 标签链接
     */
    @Column(name = "item_href")
    private String itemHref;

    /**
     * 标签值
     */
    @Column(name = "item_value")
    private String itemValue;

    @Column(name = "create_time")
    private Date createTime;

    /**
     * 更新时间
     */
    @Column(name = "update_time")
    private Date updateTime;

    /**
     * 删除标识,0正常1删除
     */
    private Integer del;

    private static final long serialVersionUID = 1L;

    /**
     * 获取唯一标识
     *
     * @return id - 唯一标识
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置唯一标识
     *
     * @param id 唯一标识
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取顺序
     *
     * @return sort_id - 顺序
     */
    public Integer getSortId() {
        return sortId;
    }

    /**
     * 设置顺序
     *
     * @param sortId 顺序
     */
    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    /**
     * 获取标签链接
     *
     * @return item_href - 标签链接
     */
    public String getItemHref() {
        return itemHref;
    }

    /**
     * 设置标签链接
     *
     * @param itemHref 标签链接
     */
    public void setItemHref(String itemHref) {
        this.itemHref = itemHref == null ? null : itemHref.trim();
    }

    /**
     * 获取标签值
     *
     * @return item_value - 标签值
     */
    public String getItemValue() {
        return itemValue;
    }

    /**
     * 设置标签值
     *
     * @param itemValue 标签值
     */
    public void setItemValue(String itemValue) {
        this.itemValue = itemValue == null ? null : itemValue.trim();
    }

    /**
     * @return create_time
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * @param createTime
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取更新时间
     *
     * @return update_time - 更新时间
     */
    public Date getUpdateTime() {
        return updateTime;
    }

    /**
     * 设置更新时间
     *
     * @param updateTime 更新时间
     */
    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    /**
     * 获取删除标识,0正常1删除
     *
     * @return del - 删除标识,0正常1删除
     */
    public Integer getDel() {
        return del;
    }

    /**
     * 设置删除标识,0正常1删除
     *
     * @param del 删除标识,0正常1删除
     */
    public void setDel(Integer del) {
        this.del = del;
    }
}