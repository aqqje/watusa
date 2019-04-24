package cn.aqqje.travel.dao.impl;

import cn.aqqje.travel.dao.CategoryDao;
import cn.aqqje.travel.domain.Category;
import cn.aqqje.travel.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;

public class CategoryDaoImpl implements CategoryDao {
    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public List findAll() {
        String sql = "select * from tab_category";
        List<Category> cateList = jdbcTemplate.query(sql, new BeanPropertyRowMapper<Category>(Category.class));
        return cateList;
    }
}
