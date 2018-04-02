package me.leiho.blog.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "x_index_setting")
public class XIndexSetting implements Serializable {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 类型
     */
    private String type;

    /**
     * 文章编号
     */
    @Column(name = "article_id")
    private Integer articleId;

    /**
     * 标题
     */
    private String title;

    /**
     * 图片
     */
    @Column(name = "head_image")
    private String headImage;

    /**
     * 部分内容
     */
    private String content;

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
     * 获取类型
     *
     * @return type - 类型
     */
    public String getType() {
        return type;
    }

    /**
     * 设置类型
     *
     * @param type 类型
     */
    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    /**
     * 获取文章编号
     *
     * @return article_id - 文章编号
     */
    public Integer getArticleId() {
        return articleId;
    }

    /**
     * 设置文章编号
     *
     * @param articleId 文章编号
     */
    public void setArticleId(Integer articleId) {
        this.articleId = articleId;
    }

    /**
     * 获取标题
     *
     * @return title - 标题
     */
    public String getTitle() {
        return title;
    }

    /**
     * 设置标题
     *
     * @param title 标题
     */
    public void setTitle(String title) {
        this.title = title == null ? null : title.trim();
    }

    /**
     * 获取图片
     *
     * @return head_image - 图片
     */
    public String getHeadImage() {
        return headImage;
    }

    /**
     * 设置图片
     *
     * @param headImage 图片
     */
    public void setHeadImage(String headImage) {
        this.headImage = headImage == null ? null : headImage.trim();
    }

    /**
     * 获取部分内容
     *
     * @return content - 部分内容
     */
    public String getContent() {
        return content;
    }

    /**
     * 设置部分内容
     *
     * @param content 部分内容
     */
    public void setContent(String content) {
        this.content = content == null ? null : content.trim();
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