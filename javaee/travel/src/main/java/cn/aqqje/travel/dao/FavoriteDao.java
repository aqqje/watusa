package cn.aqqje.travel.dao;

import cn.aqqje.travel.domain.Favorite;

public interface FavoriteDao {
    /**
     * 查询单个
     * @param rid
     * @param uid
     * @return
     */
    Favorite findOne(int rid, int uid);

    /**
     * 新增收藏
     * @param rid
     * @param uid
     */
    void add(int rid, int uid);

    /**
     * 获取rid收藏量
     * @param rid
     * @return
     */
    int findCountByRid(int rid);
}
