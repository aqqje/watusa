package cn.aqqje.ssm.controller;

import cn.aqqje.ssm.domain.Account;
import cn.aqqje.ssm.service.IAccountService;
import cn.aqqje.ssm.service.impl.AccountServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/account")
public class AccountController {

    @Autowired
    private IAccountService accountService;

    @RequestMapping("/findAll")
    public ModelAndView findAll(){
        /*System.out.println("Controller findAll...");*/
        ModelAndView mv = new ModelAndView();
        List<Account> accounts = accountService.findAll();
        mv.addObject("accounts", accounts);
        mv.setViewName("success");
        return mv;
    }
}
