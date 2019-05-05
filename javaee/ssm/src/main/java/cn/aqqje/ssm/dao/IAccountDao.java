package cn.aqqje.ssm.dao;

import cn.aqqje.ssm.domain.Account;

import java.util.List;

/**
 * account dao 接口
 */
public interface IAccountDao {

    List<Account> findAll();

}
