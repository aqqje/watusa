package cn.aqqje.travel.dao;

import cn.aqqje.travel.domain.RouteImg;

import java.util.List;

public interface RouteImgDao {
    // 获取图片集合
    List<RouteImg> findByRid(int rid);
}
