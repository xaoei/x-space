package me.leiho.blog.enums;

/**
 * @Author: 萧大侠
 * @Description: 返回码
 * @Date: Create in 17:41 2018/1/22
 * @Contact: yesxiaolei@outlook.com
 */
public enum ResultCode {

    SUCCESS(1000,"成功"),
    FAILED(1500,"失败"),
    FAILED_JSON_PARSE(1501,"内容传输异常"),
    FAILED_ARTICLE_CONTENT_NONE(1502,"文章内容不能为空"),
    FAILED_ARTICLE_TITLE_NONE(1503,"文章标题不能为空"),
    FAILED_ARTICLE_TYPE_NONE(1504,"文章分类不能为空");
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
