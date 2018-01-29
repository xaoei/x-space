package me.leiho.blog.dtos;

import me.leiho.blog.entities.StringEntity;

import javax.persistence.Column;
import java.util.Objects;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 14:19 2018/1/26
 * @Contact: yesxiaolei@outlook.com
 */
public class HeadItemDTO extends StringEntity{
    /**
     * 顺序
     */
    private Integer sortId;


    /**
     * 标签链接
     */
    private String itemHref;

    /**
     * 标签值
     */
    private String itemValue;

    /**
     * 被选中,0否1是
     */
    private Integer isSelective;

    public Integer getSortId() {
        return sortId;
    }

    public void setSortId(Integer sortId) {
        this.sortId = sortId;
    }

    public String getItemHref() {
        return itemHref;
    }

    public void setItemHref(String itemHref) {
        this.itemHref = itemHref;
    }

    public String getItemValue() {
        return itemValue;
    }

    public void setItemValue(String itemValue) {
        this.itemValue = itemValue;
    }

    public Integer getIsSelective() {
        return isSelective;
    }

    public void setIsSelective(Integer isSelective) {
        this.isSelective = isSelective;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        HeadItemDTO that = (HeadItemDTO) o;
        return Objects.equals(sortId, that.sortId);
    }

    @Override
    public int hashCode() {

        return Objects.hash(sortId);
    }
}
