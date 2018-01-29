package me.leiho.blog.utils;


import java.security.Key;
import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;
import javax.crypto.spec.IvParameterSpec;

/**
 * @Author: 萧大侠
 * @Description: DES 算法       1972美国IBM研制，对称加密算法
 * @Date: Create in 13:59 2018/1/26
 * @Contact: yesxiaolei@outlook.com
 */
public class DES {
    // 算法名称
    public static final String KEY_ALGORITHM = "DES";
    // 算法名称/加密模式/填充方式
    public static final String CIPHER_ALGORITHM_ECB = "DES/ECB/PKCS5Padding";
    public static final String CIPHER_ALGORITHM_CBC = "DES/CBC/PKCS5Padding";

    public static void main(String[] args) throws Exception {
        /*
         * 使用 ECB mode
         * 密钥生成器 生成密钥
         * ECB mode cannot use IV
         */
        byte[] key = generateKey();
        byte[] encrypt = encrypt("胃炎F#*（x）".getBytes(), key);
        System.out.println(new String(decrypt(encrypt, key)));


        /*
         * 使用CBC mode
         * 使用密钥工厂生成密钥，加密 解密
         * iv: DES in CBC mode and RSA ciphers with OAEP encoding operation.
         */
        DESKeySpec dks = new DESKeySpec(key);
        SecretKeyFactory factory = SecretKeyFactory.getInstance(KEY_ALGORITHM);
        SecretKey secretKey = factory.generateSecret(dks);
        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM_CBC);
        cipher.init(Cipher.ENCRYPT_MODE, secretKey, new IvParameterSpec(getIV()));
        byte[] enc = cipher.doFinal("胃炎A%F#*（x）".getBytes()); //加密

        cipher.init(Cipher.DECRYPT_MODE, secretKey, new IvParameterSpec(getIV()));
        byte[] dec = cipher.doFinal(enc); // 解密
        System.out.println(new String(dec));
    }

    static byte[] getIV() {
        String iv = "asdfivh7"; //IV length: must be 8 bytes long
        return iv.getBytes();
    }

    /**
     * 生成密钥
     *
     * @return
     * @throws Exception
     */
    private static byte[] generateKey() throws Exception {
        KeyGenerator keyGenerator = KeyGenerator.getInstance(KEY_ALGORITHM);
        keyGenerator.init(56); //des 必须是56, 此初始方法不必须调用
        SecretKey secretKey = keyGenerator.generateKey();
        return secretKey.getEncoded();
    }

    /**
     * 还原密钥
     *
     * @param key
     * @return
     * @throws Exception
     */
    private static Key toKey(byte[] key) throws Exception {
        DESKeySpec des = new DESKeySpec(key);
        SecretKeyFactory keyFactory = SecretKeyFactory.getInstance(KEY_ALGORITHM);
        SecretKey secretKey = keyFactory.generateSecret(des);
        return secretKey;
    }

    /**
     * 加密
     * @param data 原文
     * @param key
     * @return 密文
     * @throws Exception
     */
    public static byte[] encrypt(byte[] data, byte[] key) throws Exception {
        Key k = toKey(key);
        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM_ECB);
        cipher.init(Cipher.ENCRYPT_MODE, k);
        return cipher.doFinal(data);
    }
    /**
     * 解密
     * @param data 密文
     * @param key
     * @return 明文、原文
     * @throws Exception
     */
    public static byte[] decrypt(byte[] data, byte[] key) throws Exception {
        Key k = toKey(key);
        Cipher cipher = Cipher.getInstance(CIPHER_ALGORITHM_ECB);
        cipher.init(Cipher.DECRYPT_MODE, k);
        return cipher.doFinal(data);
    }
}
