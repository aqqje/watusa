package cn.prms.dao;

import cn.prms.domain.Role;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IRoleDao {

    // 多表根据user id查询出role_user表的role
    @Select("select * from role where id in (select roleId from users_role where userId = #{userId})")
    List<Role> findRoleByUserId(String userId);
}
