package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import me.leiho.blog.configs.WebAppConfig;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.mappers.XUserImageMapper;
import me.leiho.blog.utils.ImgCompress;
import me.leiho.blog.vos.PicUpResult;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 16:27 2018/2/7
 * @Contact: yesxiaolei@outlook.com
 */
@Api("文件上传相关接口")
@RestController
public class UploadController {
    private Logger logger = LoggerFactory.getLogger(this.getClass());

    @Autowired
    private XUserAccountMapper xUserAccountMapper;

    @Autowired
    private XUserImageMapper xUserImageMapper;


    @ApiOperation(value = "上传图片,获得图片链接", notes = "")
    @PostMapping(value = "/v1/upload", consumes = "multipart/*", headers = "content-type=multipart/form-data")
    public PicUpResult uploadPicture(@ApiParam(value = "上传的文件", required = true) @RequestParam("multipartFile") MultipartFile multipartFile) {
        if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
            XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
            XUserAccount param = new XUserAccount();
            param.setId(userInfo.getId());
            param.setDel(0);
            XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
            if (xUserAccount == null) {
                logger.error("账号不存在");
                return new PicUpResult(1);
            }
            if (multipartFile == null) {
                logger.error("文件上传失败");
                return new PicUpResult(2);
            }
            if (multipartFile.getSize() > 5120000) {
                logger.error("文件太大,请上传5兆以下图片。");
                return new PicUpResult(3);
            }
            String fileName = multipartFile.getOriginalFilename();
            String suffix = fileName.substring(fileName.lastIndexOf("."));
            if (!".jpeg".equals(suffix) && !".jpg".equals(suffix) && !".png".equals(suffix)) {
                logger.error("请上传jpeg、jpg、png格式的图片。");
                return new PicUpResult(4);
            }
            String imageId = UUID.randomUUID().toString().replace("-", "");
            try {
//                String path = WebAppConfig.class.getResource("/").toString();
//                path = path.substring(0, path.lastIndexOf("x-space")) + "image/";
//                path = path.replace("jar:","").replace("file:/","").replace("file:","");
//                path = URLDecoder.decode(path,"utf-8");
//                File image = new File(path);
                String path = "image";
                File image = new File(path);
                if (!image.exists()){
                    image.mkdir();
                }
                SaveFileFromInputStream(multipartFile.getInputStream(), path, imageId + suffix, xUserAccount);
            } catch (IOException e) {
                logger.error("上传失败", e);
                return new PicUpResult(5);
            }
            List<String> data = new ArrayList<>();
            data.add("image/total/" + imageId + suffix);
            return new PicUpResult(0, data);
        }
        return new PicUpResult(6);
    }

    private void SaveFileFromInputStream(InputStream stream, String path, String filename, XUserAccount xUserAccount) throws IOException {
        File fp1 = new File(path + "/total/");
        File fp2 = new File(path + "/small/");
        if (!fp1.exists()) {
            fp1.mkdirs();
        }
        if (!fp2.exists()) {
            fp2.mkdirs();
        }
        FileOutputStream fs = new FileOutputStream(path + "/total/" + filename);
        byte[] buffer = new byte[1024 * 1024];
        int bytesum = 0;
        int byteread = 0;
        while ((byteread = stream.read(buffer)) != -1) {
            bytesum += byteread;
            fs.write(buffer, 0, byteread);
            fs.flush();
        }
        fs.close();
        stream.close();
        //生成小图
        ImgCompress imgCompress = new ImgCompress(path+"/total/" + filename);
        imgCompress.resizeFix(100, 100, path+"/small/" + filename);
        //信息入库
        XUserImage xUserImage = new XUserImage();
        xUserImage.setUserId(xUserAccount.getId());
        xUserImage.setUsername(xUserAccount.getUsername());
        xUserImage.setTotalSrc("/image/total/" + filename);
        xUserImage.setSmallSrc("/image/small/" + filename);
        xUserImage.setCreateTime(new Date());
        xUserImageMapper.insertSelective(xUserImage);
    }
}
