package cn.aqqje.travel.dao.impl;

import cn.aqqje.travel.dao.RouteDao;
import cn.aqqje.travel.domain.Route;
import cn.aqqje.travel.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;

public class RouteDaoImpl implements RouteDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public int totalCount(int cid, String rname) {
        StringBuffer base = new StringBuffer("select count(*) from tab_route where 1=1 ");
        List<Object> params = new ArrayList<>();
        if(cid != 0){
            base.append("and cid = ? ");
            params.add(cid);
        }
        if(rname != null && rname.length() > 0){
            base.append("and rname like ? ");
            params.add("%"+ rname +"%");
        }
        String sql = base.toString();
        return jdbcTemplate.queryForObject(sql, Integer.class, params.toArray());
    }

    @Override
    public List<Route> findPageList(int cid, int start, int pageSize, String rname) {
        StringBuffer base = new StringBuffer("select * from tab_route where 1=1 ");
        List<Object> params = new ArrayList<>();
        if(cid != 0){
            base.append(" and cid = ? ");
            params.add(cid);
        }
        if(rname != null && rname.length() > 0){
            base.append(" and rname like ? ");
            params.add("%"+ rname +"%");
        }
        base.append(" limit ?, ? ");
        params.add(start);
        params.add(pageSize);
        String sql = base.toString();

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Route>(Route.class), params.toArray());
    }

    @Override
    public Route findOne(Integer rid) {
        String sql = "select * from tab_route where rid = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<Route>(Route.class), rid);
        } catch (Exception e) {
            return null;
        }
    }

    @Override
    public void updateCount(int count, int rid) {
        String sql = "update tab_route set count = ? where rid = ?";
        try {
            jdbcTemplate.update(sql, count, rid);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
    }
}
