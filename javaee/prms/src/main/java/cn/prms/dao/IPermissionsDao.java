package cn.prms.dao;

import cn.prms.domain.Permission;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IPermissionsDao {

    /*根据roleId获取资源*/
    @Select("select * from permission where id in (select permissionId from role_permission where roleId = #{roleId})")
    @Results({@Result(id = true, column = "id", property = "id"),
            @Result(column = "permissionName", property = "permissionName"),
            @Result(column = "url", property = "url"),
    })
    Permission findPermissionsByRoleId(String roleId) throws Exception;

    /*获取所有资源*/
    @Select("select * from permission")
    List<Permission> findAll() throws Exception;

    /*添加资源*/
    @Insert("insert into permission values (#{id}, #{permissionName}, #{url})")
    void save(Permission permission) throws Exception;

    /*获取不在 roleId 中的其他 permissions*/
    @Select("select * from permission where id not in (select permissionId from role_permission where roleId = #{roleId})")
    List<Permission> findOtherByRoleId(String roleId);

    /*角色关联资源*/
    @Insert("insert into role_permission (roleId, permissionId) values (#{roleId}, #{permissionsId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionsId")String permissionsId) throws Exception;
}
