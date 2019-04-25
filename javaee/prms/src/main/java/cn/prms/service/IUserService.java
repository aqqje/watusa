package cn.prms.service;

import cn.prms.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {

    /*获取所有用户列表*/
    List<UserInfo> findAll() throws Exception;

    /*添加用户*/
    void save(UserInfo user) throws Exception;
}
