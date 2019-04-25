package cn.prms.dao;

import cn.prms.domain.Permission;
import cn.prms.domain.Role;
import cn.prms.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IRoleDao {

    /*多表根据user id查询出role_user表的role*/
    @Select("select * from role where id in (select roleId from users_role where userId = #{userId})")
    @Results({@Result(id = true, column = "id", property = "id"),
            @Result(column = "roleName", property = "roleName"),
            @Result(column = "roleDesc", property = "roleDesc"),
            @Result(column = "id", property = "permissions", javaType = java.util.List.class,many = @Many(select = "cn.prms.dao.IPermissionsDao.findPermissionsByRoleId"))
    })
    List<Role> findRolesByUserId(String userId);

    /*获取所有角色列表*/
    @Select("select * from role")
    List<Role> findAll() throws Exception;

    /*添加角色*/
    @Insert("insert into role values (#{id}, #{roleName}, #{roleDesc})")
    void save(Role role) throws Exception;
}
