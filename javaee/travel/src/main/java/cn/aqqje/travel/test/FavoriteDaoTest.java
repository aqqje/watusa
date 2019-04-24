package cn.aqqje.travel.test;

import cn.aqqje.travel.dao.FavoriteDao;
import cn.aqqje.travel.dao.impl.FavoriteDaoImpl;
import org.junit.Test;

public class FavoriteDaoTest {
    private FavoriteDao dao = new FavoriteDaoImpl();

    @Test
    public void findOne(){
        System.out.println(dao.findOne(12,12));
    }
}
