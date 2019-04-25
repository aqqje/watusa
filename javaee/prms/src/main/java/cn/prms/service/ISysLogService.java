package cn.prms.service;

import cn.prms.domain.SysLog;

import java.util.List;

public interface ISysLogService {

    /*保存日志*/
    void save(SysLog sysLog) throws Exception;

    /*获取所有日志*/
    List<SysLog> findAll() throws Exception;
}
