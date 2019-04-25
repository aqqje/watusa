package cn.prms.dao;

import cn.prms.domain.Permission;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

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
}
