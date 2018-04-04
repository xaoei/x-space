package me.leiho.blog.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "x_friend_link")
public class XFriendLink implements Serializable {
    @Id
    private Integer id;

    /**
     * 顺序
     */
    @Column(name = "sort_id")
    private Integer sortId;

    /**
     * 友链链接
     */
    @Column(name = "link_href")
    private String linkHref;

    /**
     * 友链说明
     */
    @Column(name = "link_value")
    private String linkValue;

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
     * @return id
     */
    public Integer getId() {
        return id;
    }

    /**
     * @param id
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
     * 获取友链链接
     *
     * @return link_href - 友链链接
     */
    public String getLinkHref() {
        return linkHref;
    }

    /**
     * 设置友链链接
     *
     * @param linkHref 友链链接
     */
    public void setLinkHref(String linkHref) {
        this.linkHref = linkHref == null ? null : linkHref.trim();
    }

    /**
     * 获取友链说明
     *
     * @return link_value - 友链说明
     */
    public String getLinkValue() {
        return linkValue;
    }

    /**
     * 设置友链说明
     *
     * @param linkValue 友链说明
     */
    public void setLinkValue(String linkValue) {
        this.linkValue = linkValue == null ? null : linkValue.trim();
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