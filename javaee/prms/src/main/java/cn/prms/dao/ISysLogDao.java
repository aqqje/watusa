package cn.prms.dao;

import cn.prms.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysLogDao {
    /*保存日志*/
    @Insert("insert into syslog values (#{id}, #{visitTime}, #{username}, #{ip}, #{url}, #{executionTime}, #{method})")
    void save(SysLog sysLog);

    /*获取所有日志*/
    @Select("select * from syslog")
    List<SysLog> findAll();
}
