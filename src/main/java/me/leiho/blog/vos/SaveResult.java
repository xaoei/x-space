package me.leiho.blog.vos;

import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.enums.ResultCode;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 9:55 2018/2/7
 * @Contact: yesxiaolei@outlook.com
 */
public class SaveResult extends BaseResult {
    private Integer id;

    public SaveResult() {
    }

    public SaveResult(ResultCode resultCode) {
        super(resultCode);
    }

    public SaveResult(ResultCode resultCode, Integer id) {
        super(resultCode);
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }
}
