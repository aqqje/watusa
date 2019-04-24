package cn.aqqje.travel.dao;

import cn.aqqje.travel.domain.Route;

import java.util.List;

public interface RouteDao {
    // 总记录数
    int totalCount(int cid, String rname);
    // 从 start 开始的 pageSize 数量的记录实体
    List<Route> findPageList(int cid, int start, int pageSize, String rname);
    // 获取单个
    Route findOne(Integer rid);
    // 更新收藏量
    void updateCount(int count, int rid);
}
