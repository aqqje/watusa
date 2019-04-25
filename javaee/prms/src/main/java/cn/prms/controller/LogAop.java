package cn.prms.controller;

import cn.prms.domain.SysLog;
import cn.prms.service.ISysLogService;
import cn.prms.utils.UuidUtil;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;
    @Autowired
    private ISysLogService sysLogService;

    private Date visitTime; // 访问时间
    private Class clazz; // 访问类
    private Method executionMethod; // 执行方法

    /*前置通知*/
    @Before("execution(* cn.prms.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date();
        // 获取访问的类
        clazz = jp.getTarget().getClass();
        // 获取方法名
        String methodName = jp.getSignature().getName();
        // 获取方法参数
        Object[] args = jp.getArgs();
        // 获取执行方法
        if(args == null || args.length == 0){
            executionMethod = clazz.getMethod(methodName); //  无参方法
        }else{
            Class[] classes = new Class[args.length];
            for (int i = 0; i < args.length; i++) {
                classes[i] = args[0].getClass();
            }
            executionMethod = clazz.getMethod(methodName, classes);
        }
    }

    @After("execution(* cn.prms.controller.*.*(..))")
    public void doAfter() throws Exception {
        if(clazz != null && executionMethod != null && clazz != LogAop.class){
            RequestMapping  classAnnotation= (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if(classAnnotation != null){
                RequestMapping methodAnnotation = executionMethod.getAnnotation(RequestMapping.class);
                if(methodAnnotation != null){
                    // 获取url
                    String url = classAnnotation.value()[0] + methodAnnotation.value()[0];
                    // 获取访问时长
                    Long executionTime = new Date().getTime() - visitTime.getTime();
                    // 获取操作用户
                    String userName = ((User)(SecurityContextHolder.getContext().getAuthentication().getPrincipal())).getUsername();
                    // 获取ip
                    String ip = request.getRemoteAddr();
                    // 获取方法
                    String methodName = "[类名]" + clazz.getName() + "[方法名]" + executionMethod.getName();
                    // 封装log
                    SysLog sysLog = new SysLog(UuidUtil.getUuid(), visitTime, null, userName, ip, url, executionTime,methodName);
                    sysLogService.save(sysLog);
                }
            }

        }
    }
}
