package me.leiho.blog.enums;

/**
 * @Author: 萧大侠
 * @Description: 错误码
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public enum ErrorCode {

    NULL_OBJ("COMMONO001","对象为空"),
    JSONPARSE_ERROR("COMMONO002","json转换异常"),
    UNKNOWN_ERROR("COMMONO999","系统繁忙，请稍后再试...."),
    NONLICET_FILE("NONLICET_FILE","非法文件！");

    private String value;
    private String desc;

    private ErrorCode(String value, String desc) {
        this.setValue(value);
        this.setDesc(desc);
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public String getDesc() {
        return desc;
    }

    public void setDesc(String desc) {
        this.desc = desc;
    }

    @Override
    public String toString() {
        return "[" + this.value + "]" + this.desc;
    }
}