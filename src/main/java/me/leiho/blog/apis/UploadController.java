package me.leiho.blog.apis;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import me.leiho.blog.entities.BaseResult;
import me.leiho.blog.vos.PicUpResult;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

import static me.leiho.blog.enums.ResultCode.*;

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

    @ApiOperation(value = "上传图片,获得图片链接", notes = "")
    @PostMapping(value = "/v1/upload",consumes = "multipart/*",headers = "content-type=multipart/-data")
    public PicUpResult uploadPicture(@ApiParam(value = "上传的文件",required = true)MultipartFile multipartFile, HttpServletRequest request){
        if (multipartFile==null){
            logger.error("文件上传失败");
            return new PicUpResult(FAILED_IMAGE_UPLOAD);
        }
        if (multipartFile.getSize()>5120000){
            logger.error("文件太大,请上传5兆以下图片。");
            return new PicUpResult(FAILED_IMAGE_TOO_BIG);
        }
        String fileName = multipartFile.getOriginalFilename();
        String suffix = fileName.substring(fileName.lastIndexOf("."));
        if (!".jpeg".equals(suffix)&&!".jpg".equals(suffix)&&!".png".equals(suffix)){
            logger.error("请上传jpeg、jpg、png格式的图片。");
            return new PicUpResult(FAILED_IMAGE_TYPE_WRONG);
        }
        String imageId = UUID.randomUUID().toString().replace("-", "");
        try {
            File image = new File("image");
            image.mkdir();
            SaveFileFromInputStream(multipartFile.getInputStream(),"image",imageId+suffix);
        } catch (IOException e) {
            logger.error("上传失败",e);
            return new PicUpResult(FAILED_IMAGE_UPLOAD);
        }
        return  new PicUpResult(SUCCESS,"image/"+imageId+suffix);
    }
    private void SaveFileFromInputStream(InputStream stream, String path, String filename) throws IOException
    {
        FileOutputStream fs=new FileOutputStream( path + "/"+ filename);
        byte[] buffer =new byte[1024*1024];
        int bytesum = 0;
        int byteread = 0;
        while ((byteread=stream.read(buffer))!=-1)
        {
            bytesum+=byteread;
            fs.write(buffer,0,byteread);
            fs.flush();
        }
        fs.close();
        stream.close();
    }
}
