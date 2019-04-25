package cn.prms.dao;

import cn.prms.domain.Permission;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

public interface IPermissionsDao {

    @Select("select * from permission where id in (select permissionId from role_permission where roleId = #{roleId})")
    @Results({@Result(id = true, column = "id", property = "id"),
            @Result(column = "permissionName", property = "permissionName"),
            @Result(column = "url", property = "url"),
    })
    Permission findPermissionsByRoleId(String roleId) throws Exception;
}
