package me.leiho.blog.entities;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.*;

@Table(name = "x_role")
public class XRole implements Serializable {
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
     * 角色
     */
    private String role;

    /**
     * 描述
     */
    @Column(name = "role_desc")
    private String roleDesc;

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
     * 获取角色
     *
     * @return role - 角色
     */
    public String getRole() {
        return role;
    }

    /**
     * 设置角色
     *
     * @param role 角色
     */
    public void setRole(String role) {
        this.role = role == null ? null : role.trim();
    }

    /**
     * 获取描述
     *
     * @return role_desc - 描述
     */
    public String getRoleDesc() {
        return roleDesc;
    }

    /**
     * 设置描述
     *
     * @param roleDesc 描述
     */
    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc == null ? null : roleDesc.trim();
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