package cn.aqqje.ssm.service.impl;

import cn.aqqje.ssm.dao.IAccountDao;
import cn.aqqje.ssm.domain.Account;
import cn.aqqje.ssm.service.IAccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("accountService")
public class AccountServiceImpl implements IAccountService {


    @Autowired
    private IAccountDao accountDao;

    @Override
    public List<Account> findAll() {
        return accountDao.findAll();
    }
}
