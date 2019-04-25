package cn.prms.service;

import cn.prms.domain.Role;

import java.util.List;


public interface IRoleService {

    /*获取所有角色列表*/
    List<Role> findAll() throws Exception;

    /*保存角色*/
    void save(Role role) throws Exception;

    /*获取没有关联 userId 的角色*/
    List<Role> findOthersByUserId(String userId) throws Exception;

    /*根据获取一个*/
    Role findOneById(String roleId) throws Exception;

    /*关联角色与资源*/
    void addPermissionToRole(String roleId, String[] lis) throws Exception;
}
