package me.leiho.blog.utils;

import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;

/**
 * @Author: 萧大侠
 * @Description:
 * @Date: Create in 10:46 2018/2/12
 * @Contact: yesxiaolei@outlook.com
 */
public class PBKDF2Test {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Test
    public void getCodeByStr(){
        try {
            logger.info(PBKDF2.createHash("admin"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        } catch (InvalidKeySpecException e) {
            e.printStackTrace();
        }
    }

}