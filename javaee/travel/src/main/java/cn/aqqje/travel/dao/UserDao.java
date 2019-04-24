package cn.aqqje.travel.dao;

import cn.aqqje.travel.domain.User;

public interface UserDao {
    /*根据用户名查询用户*/
    public User findOneByUsername(String username);
    /*保证用户*/
    public void save(User registerUser);
    /*根据激活码查询用户*/
    User findOneByCode(String activeCode);
    /*更新激活状态*/
    void updateStatus(User user);
    /*根据用户名和密码查询用户*/
    User findOneByUsernameAndPassword(String username, String password);
}
