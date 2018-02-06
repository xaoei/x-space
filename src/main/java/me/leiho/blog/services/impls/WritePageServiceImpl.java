package me.leiho.blog.services.impls;

import com.sun.org.apache.bcel.internal.generic.IF_ACMPEQ;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.entities.XArticleTag;
import me.leiho.blog.entities.XArticleType;
import me.leiho.blog.enums.ResultCode;
import me.leiho.blog.mappers.XArticleTagMapper;
import me.leiho.blog.mappers.XArticleTypeMapper;
import me.leiho.blog.services.WritePageService;
import me.leiho.blog.utils.JsonUtil;
import me.leiho.blog.vos.TagsVO;
import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tk.mybatis.mapper.entity.Example;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import static me.leiho.blog.enums.ResultCode.FAILED_JSON_PARSE;
import static me.leiho.blog.enums.ResultCode.SUCCESS;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 14:56 2018/2/6
 * @Contact: yesxiaolei@outlook.com
 */
@Service
public class WritePageServiceImpl implements WritePageService {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XArticleTypeMapper xArticleTypeMapper;
    @Autowired
    private XArticleTagMapper xArticleTagMapper;

    private Map<String, Object> map;
    public WritePageServiceImpl getValueMap(Map<String, Object> map){
        this.map = map;
        return this;
    }
    public WritePageServiceImpl setTypes(){
        Example typeExample = new Example(XArticleType.class);
        typeExample.createCriteria().andEqualTo("del",0);
        List<XArticleType> types = xArticleTypeMapper.selectByExample(typeExample);
        map.put("types",types);
        return this;
    }
    public WritePageServiceImpl setTags(){
        Example tagExample = new Example(XArticleTag.class);
        tagExample.createCriteria().andEqualTo("del",0);
        List<XArticleTag> tags = xArticleTagMapper.selectByExample(tagExample);
        map.put("tags",tags);
        return this;
    }
    public BaseResult addNewTags(String tags){
        if (StringUtils.isBlank(tags)){
            return new BaseResult(FAILED_JSON_PARSE);
        }
        tags = tags.trim();
        tags.replace("，",",");
        if (tags.indexOf(",")>0){
            //多tag
            String[] tagList = tags.split(",");
            for (String tag:tagList){
                addOneTag(tag);
            }
        }else {
            //单tag
            addOneTag(tags);
        }
        return new BaseResult(SUCCESS);
    }
    public TagsVO getAllTags(){
        Example tagExample = new Example(XArticleTag.class);
        tagExample.createCriteria().andEqualTo("del",0);
        List<XArticleTag> tagList = xArticleTagMapper.selectByExample(tagExample);
        List<String> tags = new ArrayList<>();
        for (XArticleTag tag:tagList){
            tags.add(JsonUtil.obj2json(tag));
        }
        TagsVO tagsVO = new TagsVO();
        tagsVO.setCode(ResultCode.SUCCESS.getValue());
        tagsVO.setMsg(ResultCode.SUCCESS.getDesc());
        tagsVO.setTags(tags);
        return tagsVO;
    }
    private void addOneTag(String tag){
        tag=tag.toLowerCase();
        Example tagExample = new Example(XArticleTag.class);
        tagExample.createCriteria().andEqualTo("tagName",tag).andEqualTo("del",0);
        if (xArticleTagMapper.selectByExample(tagExample)==null){
            XArticleTag newTag = new XArticleTag();
            newTag.setTagName(tag);
            newTag.setCreateTime(new Date());
            xArticleTagMapper.insertSelective(newTag);
        }
    }
}
