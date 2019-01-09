package me.leiho.blog.apis;

import com.qcloud.cos.COSClient;
import com.qcloud.cos.ClientConfig;
import com.qcloud.cos.auth.BasicCOSCredentials;
import com.qcloud.cos.auth.COSCredentials;
import com.qcloud.cos.model.ObjectMetadata;
import com.qcloud.cos.model.PutObjectRequest;
import com.qcloud.cos.region.Region;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.entities.XUserImage;
import me.leiho.blog.mappers.XUserAccountMapper;
import me.leiho.blog.mappers.XUserImageMapper;
import me.leiho.blog.utils.ImgCompress;
import me.leiho.blog.utils.IpUtil;
import me.leiho.blog.vos.PicUpResult;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
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
    @Value("${sync.accesskey}")
    private String accesskey;
    @Value("${sync.secretkey}")
    private String secretkey;
    @Value("${sync.region_name}")
    private String regionName;
    @Value("${sync.bucketName}")
    private String bucketName;

    @Autowired
    private XUserAccountMapper xUserAccountMapper;
    @Autowired
    private XUserImageMapper xUserImageMapper;
    @Autowired
    private IpUtil ipUtil;

    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

    @ApiOperation(value = "上传图片,获得图片链接", notes = "")
    @PostMapping(value = "/v1/upload", consumes = "multipart/*", headers = "content-type=multipart/form-data")
    public PicUpResult uploadPicture(@ApiParam(value = "上传的文件", required = true) @RequestParam("multipartFile") MultipartFile multipartFile, HttpServletRequest request) {
        logger.trace(ipUtil.getIpAddr(request) + "访问/v1/upload:文件" + (multipartFile == null ? "未知" : multipartFile.getName()) + ",大小为" + (multipartFile == null ? "未知" : multipartFile.getSize()));
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
            String url;
            try {
                url = SaveFileFromInputStream(multipartFile, imageId, xUserAccount);
            } catch (IOException e) {
                logger.error("上传失败", e);
                return new PicUpResult(5);
            }
            List<String> data = new ArrayList<>();
            data.add(url);
            return new PicUpResult(0, data);
        }
        return new PicUpResult(6);
    }

    private String SaveFileFromInputStream(MultipartFile multipartFile, String imageId, XUserAccount xUserAccount) throws IOException {
        String totalKey = "/image/total/" + dateFormat.format(new Date()) + "-" + imageId + ".jpg";
        String smallKey = "/image/small/" + dateFormat.format(new Date()) + "-" + imageId + ".jpg";
        uploadPicToQOS(multipartFile.getInputStream(), multipartFile.getSize(), totalKey);
        //生成小图
        ImgCompress imgCompress = new ImgCompress(multipartFile.getInputStream());
        InputStream smallImage = imgCompress.resizeFix(100, 100);
        uploadPicToQOS(smallImage, smallImage.available(), smallKey);
        //信息入库
        XUserImage xUserImage = new XUserImage();
        xUserImage.setUserId(xUserAccount.getId());
        xUserImage.setUsername(xUserAccount.getUsername());
        xUserImage.setTotalSrc("https://" + bucketName + ".cos." + regionName + ".myqcloud.com" + totalKey);
        xUserImage.setSmallSrc("https://" + bucketName + ".cos." + regionName + ".myqcloud.com" + smallKey);
        xUserImage.setCreateTime(new Date());
        xUserImageMapper.insertSelective(xUserImage);
        return "https://" + bucketName + ".cos." + regionName + ".myqcloud.com" + totalKey;
    }

    private void uploadPicToQOS(InputStream ins, long fileSize, String key) throws IOException {
        //图片上传至对象存储
        COSClient cosclient = null;
        try {
            COSCredentials cred = new BasicCOSCredentials(accesskey, secretkey);
            ClientConfig clientConfig = new ClientConfig(new Region(regionName));
            cosclient = new COSClient(cred, clientConfig);
            ObjectMetadata objectMetadata = new ObjectMetadata();
            objectMetadata.setContentType("image/jpeg");
            objectMetadata.setContentLength(fileSize);
            PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, key, ins, objectMetadata);
            cosclient.putObject(putObjectRequest);
        } catch (Exception e) {
            throw new RuntimeException("图片上传至腾讯云失败:" + e);
        } finally {
            if (ins != null) {
                ins.close();
            }
            if (cosclient != null) {
                cosclient.shutdown();
            }
        }
    }
}
