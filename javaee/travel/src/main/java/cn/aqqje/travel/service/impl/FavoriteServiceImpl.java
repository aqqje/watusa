package cn.aqqje.travel.service.impl;

import cn.aqqje.travel.dao.FavoriteDao;
import cn.aqqje.travel.dao.RouteDao;
import cn.aqqje.travel.dao.impl.FavoriteDaoImpl;
import cn.aqqje.travel.dao.impl.RouteDaoImpl;
import cn.aqqje.travel.domain.Favorite;
import cn.aqqje.travel.domain.User;
import cn.aqqje.travel.service.FavoriteService;

public class FavoriteServiceImpl implements FavoriteService {
    private FavoriteDao favoriteDao = new FavoriteDaoImpl();
    private RouteDao routeDao = new RouteDaoImpl();

    @Override
    public boolean isFavorite(int rid, User user) {
        Favorite favorite = favoriteDao.findOne(rid, user.getUid());
        return favorite!=null;
    }

    @Override
    public int favorite(int rid, int uid) {
        // favorite 表新增条数据
        favoriteDao.add(rid, uid);
        // 获取总count
        int count = favoriteDao.findCountByRid(rid);
        if(count > 0){
            routeDao.updateCount(count, rid);
            // route Count 更新count
        }
        return count;
    }
}
