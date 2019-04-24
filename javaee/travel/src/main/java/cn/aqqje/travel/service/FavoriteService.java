package cn.aqqje.travel.service;

import cn.aqqje.travel.domain.User;

public interface FavoriteService {
    /**
     * 判断登录用户要是否已收藏
     * @param rid
     * @param user
     * @return
     */
    boolean isFavorite(int rid, User user);

    /**
     * 收藏
     * @param rid
     * @param uid
     * @return
     */
    int favorite(int rid, int uid);
}
