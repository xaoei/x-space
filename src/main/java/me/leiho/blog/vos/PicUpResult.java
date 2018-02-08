package me.leiho.blog.vos;

import me.leiho.blog.entities.StringEntity;

import java.util.List;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 9:55 2018/2/7
 * @Contact: yesxiaolei@outlook.com
 */
public class PicUpResult extends StringEntity{
    private Integer errno;
    private List<String> data;

    public PicUpResult(){}

    public PicUpResult(Integer errno){
        this.errno = errno;
    }

    public PicUpResult(Integer errno,List<String> data){
        this.errno = errno;
        this.data = data;
    }

    public Integer getErrno() {
        return errno;
    }

    public void setErrno(Integer errno) {
        this.errno = errno;
    }

    public List<String> getData() {
        return data;
    }

    public void setData(List<String> data) {
        this.data = data;
    }
}
