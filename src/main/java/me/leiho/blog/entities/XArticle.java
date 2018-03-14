package me.leiho.blog.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "x_article")
public class XArticle implements Serializable {
    /**
     * 唯一标识
     */
    @Id
    private Integer id;

    /**
     * 顺序
     */
    @Column(name = "sort_id")
    private Integer sortId;

    /**
     * 文章标题
     */
    private String title;

    /**
     * 感言
     */
    private String feeling;

    /**
     * 作者编号
     */
    private Integer author;

    /**
     * 文章分类
     */
    private Integer type;

    /**
     * 文章标签
     */
    private String tags;

    /**
     * 是否发布
     */
    private Integer announce;

    /**
     * 更新次数
     */
    @Column(name = "update_count")
    private Integer updateCount;

    /**
     * 是否热门,0否1是
     */
    private Integer hot;

    /**
     * 发布时间
     */
    @Column(name = "announce_time")
    private Date announceTime;

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
     * 内容,限制10000字
     */
    private String content;

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
     * 获取文章标题
     *
     * @return title - 文章标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置文章标题
     *
     * @param title 文章标题
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * 获取感言
     *
     * @return feeling - 感言
     */
    public String getFeeling() {
        return feeling;
    }

    /**
     * 设置感言
     *
     * @param feeling 感言
     */
    public void setFeeling(String feeling) {
        this.feeling = feeling == null ? null : feeling.trim();
    }

    /**
     * 获取作者编号
     *
     * @return author - 作者编号
     */
    public Integer getAuthor() {
        return author;
    }

    /**
     * 设置作者编号
     *
     * @param author 作者编号
     */
    public void setAuthor(Integer author) {
        this.author = author;
    }

    /**
     * 获取文章分类
     *
     * @return type - 文章分类
     */
    public Integer getType() {
        return type;
    }

    /**
     * 设置文章分类
     *
     * @param type 文章分类
     */
    public void setType(Integer type) {
        this.type = type;
    }

    /**
     * 获取文章标签
     *
     * @return tags - 文章标签
     */
    public String getTags() {
        return tags;
    }

    /**
     * 设置文章标签
     *
     * @param tags 文章标签
     */
    public void setTags(String tags) {
        this.tags = tags == null ? null : tags.trim();
    }

    /**
     * 获取是否发布
     *
     * @return announce - 是否发布
     */
    public Integer getAnnounce() {
        return announce;
    }

    /**
     * 设置是否发布
     *
     * @param announce 是否发布
     */
    public void setAnnounce(Integer announce) {
        this.announce = announce;
    }

    /**
     * 获取更新次数
     *
     * @return update_count - 更新次数
     */
    public Integer getUpdateCount() {
        return updateCount;
    }

    /**
     * 设置更新次数
     *
     * @param updateCount 更新次数
     */
    public void setUpdateCount(Integer updateCount) {
        this.updateCount = updateCount;
    }

    /**
     * 获取是否热门,0否1是
     *
     * @return hot - 是否热门,0否1是
     */
    public Integer getHot() {
        return hot;
    }

    /**
     * 设置是否热门,0否1是
     *
     * @param hot 是否热门,0否1是
     */
    public void setHot(Integer hot) {
        this.hot = hot;
    }

    /**
     * 获取发布时间
     *
     * @return create_time - 发布时间
     */
    public Date getAnnounceTime() {
        return announceTime;
    }
    /**
     * 设置发布时间
     *
     * @return create_time - 发布时间
     */
    public void setAnnounceTime(Date announceTime) {
        this.announceTime = announceTime;
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

    /**
     * 获取内容,限制10000字
     *
     * @return content - 内容,限制10000字
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置内容,限制10000字
     *
     * @param content 内容,限制10000字
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
    }
}