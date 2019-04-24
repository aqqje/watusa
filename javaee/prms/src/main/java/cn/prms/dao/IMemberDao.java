package cn.prms.dao;

import cn.prms.domain.Member;
import org.apache.ibatis.annotations.Select;

public interface IMemberDao {

    @Select("select * from member where id = #{id}")
    Member findById(String id);
}
