package cn.prms.service;

import cn.prms.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {

    /*获取所有用户列表*/
    List<UserInfo> findAll() throws Exception;

    /*添加用户*/
    void save(UserInfo user) throws Exception;

    /*根据 id 获取 user*/
    UserInfo findById(String id) throws Exception;

    /*将 roles 添加到 user 中*/
    void addRoleToUser(String userId, String[] lis) throws Exception;
}
