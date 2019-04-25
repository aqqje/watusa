package cn.prms.dao;

import cn.prms.domain.UserInfo;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface IUserDao {
    @Select("select * from users where username = #{username}")
    @Results({@Result(id = true, column = "id", property = "id"),
            @Result(column = "username", property = "username"),
            @Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phoneNum", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "id", property = "roles", javaType = java.util.List.class,many = @Many(select = "cn.prms.dao.IRoleDao.findRoleByUserId"))})
    UserInfo findByUsername(String username);

    @Select("select * from users")
    @Results({@Result(id = true, column = "id", property = "id"),
            @Result(column = "username", property = "username"),
            @Result(column = "email", property = "email"),
            @Result(column = "password", property = "password"),
            @Result(column = "phoneNum", property = "phoneNum"),
            @Result(column = "status", property = "status"),
            @Result(column = "id", property = "roles", javaType = java.util.List.class,many = @Many(select = "cn.prms.dao.IRoleDao.findRoleByUserId"))})
    List<UserInfo> findAll();

    @Insert("insert into users values (#{id}, #{email}, #{username}, #{password}, #{phoneNum}, #{status})")
    void save(UserInfo user);
}
