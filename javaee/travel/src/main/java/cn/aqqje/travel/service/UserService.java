package cn.aqqje.travel.service;

import cn.aqqje.travel.domain.User;

public interface UserService {
    /*用户注册*/
    boolean register(User registerUser);
    /*用户激活*/
    boolean activeUser(String activeCode);
    /*用户登录*/
    User loginUser(String username, String password);
}
