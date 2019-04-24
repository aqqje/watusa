package cn.aqqje.travel.service.impl;

import cn.aqqje.travel.dao.RouteDao;
import cn.aqqje.travel.dao.RouteImgDao;
import cn.aqqje.travel.dao.SellerDao;
import cn.aqqje.travel.dao.impl.RouteDaoImpl;
import cn.aqqje.travel.dao.impl.SellerDaoImpl;
import cn.aqqje.travel.dao.impl.RouteImgDaoImpl;
import cn.aqqje.travel.domain.PageBean;
import cn.aqqje.travel.domain.Route;
import cn.aqqje.travel.domain.RouteImg;
import cn.aqqje.travel.domain.Seller;
import cn.aqqje.travel.service.RouteService;

import java.util.List;

public class RouteServiceImpl implements RouteService {
    private RouteDao routeDao = new RouteDaoImpl();
    private RouteImgDao routeImgDao = new RouteImgDaoImpl();
    private SellerDao sellerDao = new SellerDaoImpl();

    @Override
    public PageBean pageQuery(int cid, int currentPage, int pageSize, String rname) {
        // 获取总记录数
        int totalCount = routeDao.totalCount(cid, rname);
        // 获取总页数
        int totalPage = totalCount % pageSize == 0 ? totalPage = totalCount / pageSize: (totalCount / pageSize) + 1;
        // 获取每页实体集合对象
        int start = (currentPage - 1) * pageSize;
        List<Route> pageList = routeDao.findPageList(cid, start, pageSize, rname);
        // 封装pageBean对象
        PageBean<Route> pb = new PageBean<>();
        pb.setCurrentPage(currentPage);
        pb.setList(pageList);
        pb.setTotalCount(totalCount);
        pb.setPageSize(pageSize);
        pb.setTotalPage(totalPage);
        return pb;
    }

    @Override
    public Route findOne(Integer rid) {
        // 获取route
        Route route = routeDao.findOne(rid);
        // 获取routeImgs
        List<RouteImg> routeImgs = routeImgDao.findByRid(route.getRid());
        // 获取seller
        Seller seller = sellerDao.findBySid(route.getSid());
        route.setSeller(seller);
        route.setRouteImgList(routeImgs);
        return route;
    }
}
