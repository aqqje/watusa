package cn.prms.utils;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

public class BCryptPasswordEncoderUtil {
    private static BCryptPasswordEncoder cryptPasswordEncoder = new BCryptPasswordEncoder();

    /*密码加密*/
    public static String encrypt (String password){
        String cyptPassword = null;
        if(password != null && password.length() > 0){
            cyptPassword = cryptPasswordEncoder.encode(password);
        }
        return cyptPassword;
    }
}
