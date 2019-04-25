package cn.prms.service;

import cn.prms.domain.Role;

import java.util.List;


public interface IRoleService {

    /*获取所有角色列表*/
    List<Role> findAll() throws Exception;

    void save(Role role) throws Exception;
}
