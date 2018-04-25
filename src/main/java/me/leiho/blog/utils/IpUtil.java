package me.leiho.blog.utils;

import me.leiho.blog.entities.XIpRecord;
import me.leiho.blog.entities.XUserAccount;
import me.leiho.blog.mappers.XIpRecordMapper;
import me.leiho.blog.mappers.XUserAccountMapper;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import tk.mybatis.mapper.entity.Example;

import javax.servlet.http.HttpServletRequest;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
@Component
public class IpUtil {
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    @Autowired
    private XUserAccountMapper xUserAccountMapper;
    @Autowired
    private XIpRecordMapper xIpRecordMapper;
    public String getIpAddr(HttpServletRequest request) {
        String ipAddress = null;
        try {
            ipAddress = request.getHeader("x-forwarded-for");
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("Proxy-Client-IP");
            }
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getHeader("WL-Proxy-Client-IP");
            }
            if (ipAddress == null || ipAddress.length() == 0 || "unknown".equalsIgnoreCase(ipAddress)) {
                ipAddress = request.getRemoteAddr();
                if (ipAddress.equals("127.0.0.1")) {
                    // 根据网卡取本机配置的IP
                    InetAddress inet = null;
                    try {
                        inet = InetAddress.getLocalHost();
                    } catch (UnknownHostException e) {
                        e.printStackTrace();
                    }
                    ipAddress = inet.getHostAddress();
                }
            }
            // 对于通过多个代理的情况，第一个IP为客户端真实IP,多个IP按照','分割
            if (ipAddress != null && ipAddress.length() > 15) { // "***.***.***.***".length()
                // = 15
                if (ipAddress.indexOf(",") > 0) {
                    ipAddress = ipAddress.substring(0, ipAddress.indexOf(","));
                }
            }
        } catch (Exception e) {
            ipAddress="";
        }
        // ipAddress = this.getRequest().getRemoteAddr();
        if (ipAddress!=null&&StringUtils.isNotBlank(ipAddress)){
            //存入数据库
            try {
                XIpRecord xIpRecord = new XIpRecord();
                xIpRecord.setIp(ipAddress);
                if (SecurityUtils.getSubject() != null && SecurityUtils.getSubject().getPrincipal() != null) {
                    XUserAccount userInfo = (XUserAccount) SecurityUtils.getSubject().getPrincipal();
                    XUserAccount param = new XUserAccount();
                    param.setId(userInfo.getId());
                    param.setDel(0);
                    XUserAccount xUserAccount = xUserAccountMapper.selectOne(param);
                    if (xUserAccount == null) {
                        xIpRecord.setIsLogin(0);
                        logger.info("用户信息异常");
                        Example notLogin = new Example(XIpRecord.class);
                        notLogin.createCriteria().andEqualTo("ip", ipAddress).andEqualTo("isLogin", 0).andEqualTo("del", 0);
                        List<XIpRecord> recordList = xIpRecordMapper.selectByExample(notLogin);
                        updateRecord(recordList, xIpRecord);
                    } else {
                        xIpRecord.setIsLogin(1);
                        xIpRecord.setUserId(xUserAccount.getId());
                        xIpRecord.setUserName(xUserAccount.getUsername());
                        Example isLogin = new Example(XIpRecord.class);
                        isLogin.createCriteria().andEqualTo("ip", ipAddress).andEqualTo("isLogin", 1).andEqualTo("userId", xUserAccount.getId()).andEqualTo("userName", xUserAccount.getUsername()).andEqualTo("del", 0);
                        List<XIpRecord> recordList = xIpRecordMapper.selectByExample(isLogin);
                        updateRecord(recordList, xIpRecord);
                    }
                } else {
                    xIpRecord.setIsLogin(0);
//                    logger.info("用户未登录");
                    Example notLogin = new Example(XIpRecord.class);
                    notLogin.createCriteria().andEqualTo("ip", ipAddress).andEqualTo("isLogin", 0).andEqualTo("del", 0);
                    xIpRecordMapper.selectByExample(notLogin);
                    List<XIpRecord> recordList = xIpRecordMapper.selectByExample(notLogin);
                    updateRecord(recordList, xIpRecord);
                }
            }catch (Exception e){
                logger.error("将ip存入数据库出现异常",e);
            }
        }
        return ipAddress;
    }
    private void updateRecord(List<XIpRecord> recordList,XIpRecord xIpRecord){
        if (recordList.isEmpty()){
            xIpRecordMapper.insertSelective(xIpRecord);
        }else {
            XIpRecord result = recordList.get(0);
            result.setUpdateTime(new Date());
            xIpRecordMapper.updateByPrimaryKeySelective(result);
        }
    }
}