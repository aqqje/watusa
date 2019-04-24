package cn.aqqje.travel.dao.impl;

import cn.aqqje.travel.dao.UserDao;
import cn.aqqje.travel.domain.User;
import cn.aqqje.travel.util.JDBCUtils;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

public class UserDaoImpl implements UserDao {

    private JdbcTemplate jdbcTemplate = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public User findOneByUsername(String username) {
        String sql = "select * from tab_user where username = ?";
        User user =null;
        try {
            user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username);
        }catch (Exception e){
        }
        return user;
    }

    @Override
    public void save(User registerUser) {
        String sql = "insert into tab_user (username, password, name, birthday, sex, telephone, email, status, code) values (?,?,?,?,?,?,?,?,?)";
        jdbcTemplate.update(sql, registerUser.getUsername(),
                registerUser.getPassword(),
                registerUser.getName(),
                registerUser.getBirthday(),
                registerUser.getSex(),
                registerUser.getTelephone(),
                registerUser.getEmail(),
                registerUser.getStatus(),
                registerUser.getCode());
    }

    @Override
    public User findOneByCode(String activeCode) {
        String sql = "select * from tab_user where code = ?";
        User user = null;
        try {
            user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), activeCode);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return user;
    }

    @Override
    public void updateStatus(User user) {
        String sql = "update tab_user set status = 'Y' where uid = ?";
        jdbcTemplate.update(sql, user.getUid());
    }

    @Override
    public User findOneByUsernameAndPassword(String username, String password) {
        String sql = "select * from tab_user where username = ? and password = ?";
        User user = null;
        try {
            user = jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<User>(User.class), username, password);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
        return user;
    }
}
