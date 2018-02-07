package me.leiho.blog.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "x_blog_image")
public class XBlogImage implements Serializable {
    @Id
    private Integer id;

    /**
     * 顺序
     */
    @Column(name = "sort_id")
    private Integer sortId;

    /**
     * 对象存储图片路径
     */
    private String path;

    /**
     * 图片源地址
     */
    private String src;

    /**
     * 图片描述
     */
    @Column(name = "img_desc")
    private String imgDesc;

    /**
     * 图片所在页面链接
     */
    private String link;

    /**
     * 热门标识,0否1是
     */
    private Integer hot;

    /**
     * 同步标识,0未同步1已同步
     */
    private Integer sync;

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
     * 获取对象存储图片路径
     *
     * @return path - 对象存储图片路径
     */
    public String getPath() {
        return path;
    }

    /**
     * 设置对象存储图片路径
     *
     * @param path 对象存储图片路径
     */
    public void setPath(String path) {
        this.path = path == null ? null : path.trim();
    }

    /**
     * 获取图片源地址
     *
     * @return src - 图片源地址
     */
    public String getSrc() {
        return src;
    }

    /**
     * 设置图片源地址
     *
     * @param src 图片源地址
     */
    public void setSrc(String src) {
        this.src = src == null ? null : src.trim();
    }

    /**
     * 获取图片描述
     *
     * @return img_desc - 图片描述
     */
    public String getImgDesc() {
        return imgDesc;
    }

    /**
     * 设置图片描述
     *
     * @param imgDesc 图片描述
     */
    public void setImgDesc(String imgDesc) {
        this.imgDesc = imgDesc == null ? null : imgDesc.trim();
    }

    /**
     * 获取图片所在页面链接
     *
     * @return link - 图片所在页面链接
     */
    public String getLink() {
        return link;
    }

    /**
     * 设置图片所在页面链接
     *
     * @param link 图片所在页面链接
     */
    public void setLink(String link) {
        this.link = link == null ? null : link.trim();
    }

    /**
     * 获取热门标识,0否1是
     *
     * @return hot - 热门标识,0否1是
     */
    public Integer getHot() {
        return hot;
    }

    /**
     * 设置热门标识,0否1是
     *
     * @param hot 热门标识,0否1是
     */
    public void setHot(Integer hot) {
        this.hot = hot;
    }

    /**
     * 获取同步标识,0未同步1已同步
     *
     * @return sync - 同步标识,0未同步1已同步
     */
    public Integer getSync() {
        return sync;
    }

    /**
     * 设置同步标识,0未同步1已同步
     *
     * @param sync 同步标识,0未同步1已同步
     */
    public void setSync(Integer sync) {
        this.sync = sync;
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