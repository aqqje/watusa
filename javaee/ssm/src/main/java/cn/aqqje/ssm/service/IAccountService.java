package cn.aqqje.ssm.service;

import cn.aqqje.ssm.domain.Account;

import java.util.List;

public interface IAccountService {

    List<Account> findAll();
}
