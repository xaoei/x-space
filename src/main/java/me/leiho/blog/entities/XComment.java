package me.leiho.blog.entities;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;
import java.util.Date;

@Table(name = "x_comment")
public class XComment extends StringEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    private Integer id;
    /**
     * 顺序
     */
    @Column(name = "sort_id")
    private Integer sortId;
    /**
     * 评论
     */
    private String comment;
    /**
     * 评论人
     */
    @Column(name = "user_id")
    private Integer userId;
    /**
     * 原文
     */
    @Column(name = "article_id")
    private Integer articleId;
    /**
     * 是否热门,0否1是
     */
    private Integer hot;
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
     * 获取评论
     *
     * @return comment - 评论
     */
    public String getComment() {
        return comment;
    }

    /**
     * 设置评论
     *
     * @param comment 评论
     */
    public void setComment(String comment) {
        this.comment = comment == null ? null : comment.trim();
    }

    /**
     * 获取原文
     *
     * @return source_link - 原文
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * 设置原文
     *
     * @param articleId 原文
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
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

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }
}