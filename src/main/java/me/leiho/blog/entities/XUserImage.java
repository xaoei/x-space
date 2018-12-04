package me.leiho.blog.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "x_user_image")
public class XUserImage implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
//    @GeneratedValue(strategy = GenerationType.IDENTITY)
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
     * 小图源地址
     */
    @Column(name = "small_src")
    private String smallSrc;
    /**
     * 完整图片源地址
     */
    @Column(name = "total_src")
    private String totalSrc;
    /**
     * 唯一标识
     */
    @Column(name = "user_id")
    private Integer userId;
    /**
     * 用户名
     */
    private String username;
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
    /**
     * 创建时间
     */
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
     * 获取小图源地址
     *
     * @return small_src - 小图源地址
     */
    public String getSmallSrc() {
        return smallSrc;
    }

    /**
     * 设置小图源地址
     *
     * @param smallSrc 小图源地址
     */
    public void setSmallSrc(String smallSrc) {
        this.smallSrc = smallSrc == null ? null : smallSrc.trim();
    }

    /**
     * 获取完整图片源地址
     *
     * @return total_src - 完整图片源地址
     */
    public String getTotalSrc() {
        return totalSrc;
    }

    /**
     * 设置完整图片源地址
     *
     * @param totalSrc 完整图片源地址
     */
    public void setTotalSrc(String totalSrc) {
        this.totalSrc = totalSrc == null ? null : totalSrc.trim();
    }

    /**
     * 获取唯一标识
     *
     * @return user_id - 唯一标识
     */
    public Integer getUserId() {
        return userId;
    }

    /**
     * 设置唯一标识
     *
     * @param userId 唯一标识
     */
    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    /**
     * 获取用户名
     *
     * @return username - 用户名
     */
    public String getUsername() {
        return username;
    }

    /**
     * 设置用户名
     *
     * @param username 用户名
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
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
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
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