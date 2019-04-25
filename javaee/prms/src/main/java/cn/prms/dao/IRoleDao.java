package cn.prms.dao;

import cn.prms.domain.Permission;
import cn.prms.domain.Role;
import cn.prms.domain.UserInfo;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRoleDao {

    // 多表根据user id查询出role_user表的role
    @Select("select * from role where id in (select roleId from users_role where userId = #{userId})")
    @Results({@Result(id = true, column = "id", property = "id"),
            @Result(column = "roleName", property = "roleName"),
            @Result(column = "roleDesc", property = "roleDesc"),
            @Result(column = "id", property = "permissions", javaType = java.util.List.class,many = @Many(select = "cn.prms.dao.IPermissionsDao.findPermissionsByRoleId"))
    })
    List<Role> findRolesByUserId(String userId);
}
