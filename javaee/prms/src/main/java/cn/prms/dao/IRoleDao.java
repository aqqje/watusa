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

    /*获取没关联 userId 的角色*/
    @Select("select * from role where id not in (select roleId from users_role where userId = #{userId})")
    List<Role> findOthersByUserId(String userId) throws Exception;

    /*向用户添加角色*/
    @Insert("insert into users_role values (#{userId}, #{roleId});")
    void addRoleToUser(@Param("userId")String userId, @Param("roleId")String roleId) throws Exception;

    /*根据 roleId 获取 role*/
    @Select("select * from role where id = #{roleId}")
    Role findOneByRoleId(String roleId) throws Exception;
}
