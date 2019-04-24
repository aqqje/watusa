package cn.aqqje.travel.service;

import cn.aqqje.travel.domain.PageBean;
import cn.aqqje.travel.domain.Route;

public interface RouteService {
    /**
     * 分页查询
     * @param cid
     * @param currentPage
     * @param pageSize
     * @return
     */
    public PageBean pageQuery(int cid, int currentPage, int pageSize, String rname);

    /**
     * 获取单个
     * @param rid
     * @return
     */
    Route findOne(Integer rid);
}
