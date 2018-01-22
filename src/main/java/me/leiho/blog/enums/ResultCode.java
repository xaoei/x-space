package me.leiho.blog.enums;

/**
 * @Author: 萧大侠
 * @Description: 返回码
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public enum ResultCode {

    SUCCESS(0,"SUCCESS"),
    FAILED(400,"FAILED");
    private Integer value;
    private String desc;

    private ResultCode(Integer value, String desc) {
        this.setValue(value);
        this.setDesc(desc);
    }

    public Integer getValue() {
        return value;
    }

    public void setValue(Integer value) {
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
