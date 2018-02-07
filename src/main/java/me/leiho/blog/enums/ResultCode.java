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
    FAILED_ARTICLE_TYPE_NONE(1504,"文章分类不能为空"),
    FAILED_ARTICLE_CONTENT_TOLONG(1505,"文章内容过长"),
    FAILED_ARTICLE_FEELING_TOLONG(1506,"文章感言过长"),
    FAILED_ARTICLE_TYPE_NOT_EXIST(1507,"文章分类不存在"),
    FAILED_ARTICLE_TAG_NOT_EXIST(1508,"文章标签不存在"),
    FAILED_ARTICLE_ID_NOT_EXIST(1509,"目标文章不存在"),
    FAILED_ARTICLE_SAVE_ERROR(1510,"文章保存失败,请做好备份并联系网站管理员"),
    FAILED_ARTICLE_TAG_ERROR(1511,"新增标签无效"),
    FAILED_IMAGE_UPLOAD(1601,"图片上传失败"),
    FAILED_IMAGE_TOO_BIG(1602,"文件太大,请上传5兆以下图片"),
    FAILED_IMAGE_TYPE_WRONG(1603,"请上传jpeg、jpg、png格式的图片");
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
