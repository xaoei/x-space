package me.leiho.blog.vos;

import me.leiho.blog.entities.XUserImage;

public class XUserImageVO extends XUserImage {
    private Integer isOwner;

    public Integer getIsOwner() {
        return isOwner;
    }

    public void setIsOwner(Integer isOwner) {
        this.isOwner = isOwner;
    }
}
