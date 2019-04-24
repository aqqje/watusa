package cn.aqqje.travel.dao.impl;

import cn.aqqje.travel.dao.FavoriteDao;
import cn.aqqje.travel.domain.Favorite;
import cn.aqqje.travel.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.Date;

public class FavoriteDaoImpl implements FavoriteDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public Favorite findOne(int rid, int uid) {

        Favorite favorite = null;
        try {
            String sql = "select * from tab_favorite where rid = ? and uid = ?";
            favorite = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Favorite>(Favorite.class), rid, uid);
        } catch (DataAccessException e) {
        }
        return favorite;
    }

    @Override
    public void add(int rid, int uid) {
        String sql = "insert into tab_favorite values (?, ?, ?)";
        try {
            jdbcTemplate.update(sql, rid, new Date(), uid);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int findCountByRid(int rid) {
        String sql = "select count(*) from tab_favorite where rid = ?";
        int count = 0;
        try {
            count = jdbcTemplate.queryForObject(sql, Integer.class, rid);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return count;
    }
}
