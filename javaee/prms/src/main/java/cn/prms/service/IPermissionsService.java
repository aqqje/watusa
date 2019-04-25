package cn.prms.service;

import cn.prms.domain.Permission;

import java.util.List;

public interface IPermissionsService {

    /*获取所有资源列表*/
    List<Permission> findAll() throws Exception;

    /*添加资源*/
    void save(Permission permission) throws Exception;
}
