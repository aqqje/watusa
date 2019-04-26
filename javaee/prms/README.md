# prms 企业权限管理系统
## 1.环境
- 操作系统:win7
- 语言:java8, jsp, js 
- 框架:ssm + spring security + spring aop, fent-end:adminTLE
- 依赖工具:maven3.5.4, 
- 服务器:tomcat7, 

## 2.数据结构
### 2.1 用户相关
- `user` 用户表 
- `role` 角色表
- `permission` 权限资源表 
- `member` 会员表 
- `traveller` 旅客表
### 2.2 产品相关
- `orders` 订单表
- `product`产品表
### 2.2 中间表
- `order_traveller` 订单-旅客表
- `users_role` 用户-角色表
- `role_permission` 角色-权限资源表
### 2.3日志表
- `syslog` 系统日志表

## 3 功能介绍
### 3.1 产品管理
### 3.2 订单管理
### 3.3 用户登入,登出
### 3.4 用户管理
### 3.5 角色管理 
### 3.6 权限资源管理
### 3.7 会员管理(仅查询)
### 3.8 旅客管理(与订单相关)
### 3.8 系统日志管理(查询与添加)

## 4.技术要点
### 4.1 基于mybatis的注解dao
#### 4.1.1 添加产品:@Insert 中要使用 product 对象参数中的属性值,可以直接 #{属性名}   
```java
@Insert("insert into product(id,productNum,productName,cityName,departureTime,productPrice,productDesc,productStatus) values(#{id},#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product);
```

#### 4.1.2 角色关联资源: @Insert 和 @Param 注解,其中 @Param 用于相关联方法参数与 @Insert 中参数
```java
    /*角色关联资源*/
    @Insert("insert into role_permission (roleId, permissionId) values (#{roleId}, #{permissionsId})")
    void addPermissionToRole(@Param("roleId") String roleId, @Param("permissionsId")String permissionsId) throws Exception;
```

#### 4.1.3根据订单 id 查询订单:使用 @Select 和 @Results 注解,其中使用 @Results 和 @Result 相关多表查询并相关到具体的实体类属性
```java
/*根据订单id查询订单*/
    @Select("select * from orders where id = #{ordersId}")
    @Results({@Result(id=true, column = "id", property = "id"),
            @Result(column = "orderNum", property = "orderNum"),
            @Result(column = "orderTime", property = "orderTime"),
            @Result(column = "orderStatus", property = "orderStatus"),
            @Result(column = "peopleCount", property = "peopleCount"),
            @Result(column = "payType", property = "payType"),
            @Result(column = "orderDesc", property = "orderDesc"),
            @Result(column = "peopleCount", property = "peopleCount"),
            @Result(column = "productId", property = "product", javaType = Product.class, one = @One(select = "cn.prms.dao.IProductDao.findById")),
            @Result(column = "id", property = "travellers", javaType = java.util.List.class, many = @Many (select = "cn.prms.dao.ITravellersDao.findByOrdersId")),
            @Result(column = "memberId", property = "member", javaType = Member.class, one = @One(select = "cn.prms.dao.IMemberDao.findById")),
            })
    Orders findById(String ordersId);
```

### 4.2 使用 spring security

#### 4.2.1 开启 spring security
- 配置 web.xml, spring-security 相关的 filter, 其中 <filter-name> 中值固定为: springSecurityFilterChain
```java
<!--spring-security-->
    <filter>
        <filter-name>springSecurityFilterChain</filter-name>
        <filter-class>org.springframework.web.filter.DelegatingFilterProxy</filter-class>
    </filter>
    <filter-mapping>
        <filter-name>springSecurityFilterChain</filter-name>
        <url-pattern>/*</url-pattern>
    </filter-mapping>
```
- 配置 web.xml, 加载 spring-security.xml 文件
```java
<context-param>
        /*加载上下文*/
        <param-name>contextConfigLocation</param-name>
        <param-value>classpath*:applicationContext.xml,classpath*:spring-security.xml</param-value>
    </context-param>
    <!-- 配置监听器 -->
```

#### 4.2.2 开启 SpEl 表达式

-`方法一: use-expressions设置为true use-expressions="true", access 中也要使用表达式 access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"
```xml
<security:http auto-config="true" use-expressions="true">
        <!-- intercept-url定义一个过滤规则 pattern表示对哪些url进行权限控制，
            access属性表示在请求对应的URL时需要什么权限，
            默认配置时它应该是一个以逗号分隔的角色列表，
            请求的用户只需拥有其中的一个角色就能成功访问对应的URL
        -->
        <security:intercept-url pattern="/**" access="hasAnyRole('ROLE_USER','ROLE_ADMIN')"/>
        ....
</security:http>
```

- 方法二: use-expressions 设置为 false use-expressions="false",  access 中不能用表达式 access="'ROLE_USER','ROLE_ADMIN'", 注入 DefaultWebSecurityExpressionHandler

```xml
<!--开启SPEL表达式-->
    <!--<bean id="webSecurityExpressionHandler" class="org.springframework.security.web.access.expression.DefaultWebSecurityExpressionHandler"/>-->
```
#### 4.2.3 jsp页面 使用 spring-security-taglibs 权限控制标签

在jsp中我们可以使用以下三种标签，其中authentication代表的是当前认证对象，可以获取当前认证对象信息，例
如用户名。其它两个标签我们可以用于权限控制
##### 4.2.3.1 authentication
<security:authentication property="" htmlEscape="" scope="" var=""/>property： 只允许指定Authentication所拥有的属性，可以进行属性的级联获取，如“principle.username”，不允许直接通过方法进行调用htmlEscape：表示是否需要将html进行转义。默认为true。scope：与var属性一起使用，用于指定存放获取的结果的属性名的作用范围，默认我pageContext。Jsp中拥有的作用范围都进行进行指定var： 用于指定一个属性名，这样当获取到了authentication的相关信息后会将其以var指定的属性名进行存放，默认是存放在pageConext中
##### 4.2.3.2 authorize
authorize是用来判断普通权限的，通过判断用户是否具有对应的权限而控制其所包含内容的显示<security:authorize access="" method="" url="" var=""></security:authorize>access： 需要使用表达式来判断权限，当表达式的返回结果为true时表示拥有对应的权限method：method属性是配合url属性一起使用的，表示用户应当具有指定url指定method访问的权限，method的默认值为GET，可选值为http请求的7种方法url：url表示如果用户拥有访问指定url的权限即表示可以显示authorize标签包含的内容var：用于指定将权限鉴定的结果存放在pageContext的哪个属性中
##### 4.2.3.3 accesscontrollist:
accesscontrollist标签是用于鉴定ACL权限的。其一共定义了三个属性：hasPermission、domainObject和var，其中前两个是必须指定的<security:accesscontrollist hasPermission="" domainObject="" var=""></security:accesscontrollist>hasPermission：hasPermission属性用于指定以逗号分隔的权限列表domainObject：domainObject用于指定对应的域对象

##### 4.2.3.4 csrfMetaTags: 不常用

##### 4.2.3.5 spring-security-taglibs: 不常用
```html
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
...
<!--显示用户名-->
<security:authentication property="principal.username"></security:authentication>

<!--拥有权限为 ADMIN 才可以访问-->
<security:authorize access="hasRole('ADMIN')">
    <li class="system-setting"><a
            href="${pageContext.request.contextPath}/user/findAll.do"> <i
            class="fa fa-circle-o"></i> 用户管理
    </a></li>
</security:authorize>
```

- [其他参考](https://blog.csdn.net/yw_1207/article/details/78717283)

#### 4.2.4 使用 spring 注入一个 HttpServletRequest 对象

- 配置 web.xml
````java
<listener>
        <listener-class>org.springframework.web.context.request.RequestContextListener</listener-class>
    </listener>
````

#### 4.2.5 基于注解的方法级权限控制(jsr250, secured, pre-post)
- 开启权限控制
```xml
    <!--权限控制-->
    <security:global-method-security pre-post-annotations="enabled" jsr250-annotations="enabled" secured-annotations="enabled"/>
```
- jsr250 (需要 jsr-250 依赖)
```text
1.@RolesAllowed表示访问对应方法时所应该具有的角色
    示例
    @RolesAllowed({"USER", "ADMIN"}) 该方法只要具有"USER", "ADMIN"任意一种权限就可以访问。这里可以省
    略前缀ROLE_，实际的权限可能是ROLE_ADMIN

2.@PermitAll表示允许所有的角色进行访问，也就是说不进行权限控制

3.@DenyAll是和PermitAll相反的，表示无论什么角色都不能访问
```
- secured (需要 spring-security 依赖) 
```text
@Secured注解标注的方法进行权限控制的支持，其值默认为disabled,使用是要加前缀:`ROLE_`
       示例：
       @Secured("IS_AUTHENTICATED_ANONYMOUSLY")
       public Account readAccount(Long id);
       @Secured("ROLE_TELLER")

```
- pre-post 基于 SpEl 表达 (需要 spring-security 依赖)

| **表达式**                     | **描述**                                                     |
| ------------------------------ | ------------------------------------------------------------ |
| hasRole([role])                | 当前用户是否拥有指定角色。                                   |
| hasAnyRole([role1,role2])      | 多个角色是一个以逗号进行分隔的字符串。如果当前用户拥有指定角色中的任意一个则返回true。 |
| hasAuthority([auth])           | 等同于hasRole                                                |
| hasAnyAuthority([auth1,auth2]) | 等同于hasAnyRole                                             |
| Principle                      | 代表当前用户的principle对象                                  |
| authentication                 | 直接从SecurityContext获取的当前Authentication对象            |
| permitAll                      | 总是返回true，表示允许所有的                                 |
| denyAll                        | 总是返回false，表示拒绝所有的                                |
| isAnonymous()                  | 当前用户是否是一个匿名用户                                   |
| isRememberMe()                 | 表示当前用户是否是通过Remember-Me自动登录的                  |
| isAuthenticated()              | 表示当前用户是否已经登录认证成功了。                         |
| isFullyAuthenticated()         | 如果当前用户既不是一个匿名用户，同时又不是通过Remember-Me自动登录的，则返回true。 |
```text
1.@PreAuthorize 在方法调用之前,基于表达式的计算结果来限制对方法的访问
示例：
@PreAuthorize("#userId == authentication.principal.userId or hasAuthority(‘ADMIN’)")
void changePassword(@P("userId") long userId ){ }
这里表示在changePassword方法执行之前，判断方法参数userId的值是否等于principal中保存的当前用户的
userId，或者当前用户是否具有ROLE_ADMIN权限，两种符合其一，就可以访问该方法。

2.@PostAuthorize 允许方法调用,但是如果表达式计算结果为false,将抛出一个安全性异常
示例：
@PostAuthorize
User getUser("returnObject.userId == authentication.principal.userId or
hasPermission(returnObject, 'ADMIN')");

3.@PostFilter 允许方法调用,但必须按照表达式来过滤方法的结果

4.@PreFilter 允许方法调用,但必须在进入方法之前过滤输入值
```

- [其它参考](https://www.cnblogs.com/fenglan/p/5913481.html)

### 4.3 date 与 int 等转化为 String解决方案
```java
private Date departureTime; // 出发时间
private String departureTimeStr;

...
public String getDepartureTimeStr() {
        if(departureTime != null){
            departureTimeStr = DeteUtils.date2String(departureTime, "yyyy-MM-dd HH:mm:ss");
        }
        return departureTimeStr;
    }
```

### 4.5 分页查询
#### 4.5.1 后端分页(PageHelper)
##### 4.5.1.1 加入 pageHelper 依赖
##### 4.5.1.2 配置拦截器插件
##### 4.5.1.3 未整合 spring 在 mybaties-config.xml 配置
```xml
<!--
plugins在配置文件中的位置必须符合要求，否则会报错，顺序如下:
properties?, settings?,
typeAliases?, typeHandlers?,
objectFactory?,objectWrapperFactory?,
plugins?,
environments?, databaseIdProvider?, mappers?
-->
<plugins>
<!-- com.github.pagehelper为PageHelper类所在包名 -->
    <plugin interceptor="com.github.pagehelper.PageInterceptor">
    <!-- 使用下面的方式配置参数，后面会有所有的参数介绍 -->
        <property name="helperDialect" value="mysql"/>
        <property name="reasonable" value="true"/>
    </plugin>
</plugins>
```
##### 4.5.1.4 整合 spring 在 mybaties-config.xml 配置
```xml
<!---->
<!-- 把交给IOC管理 SqlSessionFactory -->
    <bean id="sqlSessionFactory" class="org.mybatis.spring.SqlSessionFactoryBean">
        <property name="dataSource" ref="dataSource"/>
        <!--传入 pageHelp 插件-->
        <property name="plugins">
            <array>
                <bean class="com.github.pagehelper.PageInterceptor">
                    <property name="properties">
                        <props>
                            <prop key="helperDialect">mysql</prop>
                            <prop key="reasonable">true</prop>
                        </props>
                    </property>
                </bean>
            </array>
        </property>
    </bean>
```

##### 4.5.1.5 分页插件参数介绍

- 1.helperDialect ：分页插件会自动检测当前的数据库链接，自动选择合适的分页方式。 你可以配置helperDialect 属性来指定分页插件使用哪种方言。
配置时，可以使用下面的缩写值：oracle , mysql , mariadb , sqlite , hsqldb , postgresql , db2 , sqlserver , informix , h2 , sqlserver2012 , derby
特别注意：使用 SqlServer2012 数据库时，需要手动指定为  sqlserver2012 ，否则会使用 SqlServer2005 的方式进行分页。你也可以实现  AbstractHelperDialect ，然后配置该属性为实现类的全限定名称即可使用自定义的实现方法。

- 2.offsetAsPageNum ：默认值为  false ，该参数对使用  RowBounds 作为分页参数时有效。 当该参数设置为
true 时，会将  RowBounds 中的  offset 参数当成  pageNum 使用，可以用页码和页面大小两个参数进行分
页。

- 3.rowBoundsWithCount ：默认值为 false ，该参数对使用  RowBounds 作为分页参数时有效。 当该参数设置
为 true 时，使用  RowBounds 分页会进行 count 查询。

- 4.pageSizeZero ：默认值为  false ，当该参数设置为  true 时，如果  pageSize=0 或者  RowBounds.limit =
0 就会查询出全部的结果（相当于没有执行分页查询，但是返回结果仍然是  Page 类型）。

- 5.reasonable ：分页合理化参数，默认值为 false 。当该参数设置为  true 时， pageNum<=0 时会查询第一
页， pageNum>pages （超过总数时），会查询最后一页。默认 false 时，直接根据参数进行查询。

- 6.params ：为了支持 startPage(Object params) 方法，增加了该参数来配置参数映射，用于从对象中根据属
性名取值， 可以配置  pageNum,pageSize,count,pageSizeZero,reasonable ，不配置映射的用默认值， 默认
值为
pageNum=pageNum;pageSize=pageSize;count=countSql;reasonable=reasonable;pageSizeZero=pageSizeZero
。
- 7.supportMethodsArguments ：支持通过 Mapper 接口参数来传递分页参数，默认值 false ，分页插件会从查
询方法的参数值中，自动根据上面  params 配置的字段中取值，查找到合适的值时就会自动分页。 使用方法
可以参考测试代码中的  com.github.pagehelper.test.basic 包下的  ArgumentsMapTest 和
ArgumentsObjTest 。

- 8.autoRuntimeDialect ：默认值为  false 。设置为  true 时，允许在运行时根据多数据源自动识别对应方言
的分页 （不支持自动选择 sqlserver2012 ，只能使用 sqlserver ），用法和注意事项参考下面的场景五。

- 9.closeConn ：默认值为  true 。当使用运行时动态数据源或没有设置  helperDialect 属性自动获取数据库类
型时，会自动获取一个数据库连接， 通过该属性来设置是否关闭获取的这个连接，默认 true 关闭，设置为
false 后，不会关闭获取的连接，这个参数的设置要根据自己选择的数据源来决定。

##### 4.5.1.6 基本使用

PageHelper的基本使用有6种，大家可以查看文档，最常用的有两种

###### 4.5.1.6.1 RowBounds方式的调用
使用这种调用方式时，你可以使用RowBounds参数进行分页，这种方式侵入性最小，我们可以看到，通过
RowBounds方式调用只是使用了这个参数，并没有增加其他任何内容。
分页插件检测到使用了RowBounds参数时，就会对该查询进行物理分页。
关于这种方式的调用，有两个特殊的参数是针对  RowBounds 的，你可以参看上面的分页插件参数介绍
注：不只有命名空间方式可以用RowBounds，使用接口的时候也可以增加RowBounds参数，例如：
List<Country> list = sqlSession.selectList("x.y.selectIf", null, new RowBounds(1, 10));
北京市昌平区建材城西路金燕龙办公楼一层  电话：400-618-9090
注意： 由于默认情况下的  RowBounds 无法获取查询总数，分页插件提供了一个继承自  RowBounds 的
PageRowBounds ，这个对象中增加了  total 属性，执行分页查询后，可以从该属性得到查询总数。

###### 4.5.1.6.2 PageHelper.startPage 静态方法调用(常用)
这种方式是我们要掌握的 在你需要进行分页的 MyBatis 查询方法前调用PageHelper.startPage 静态方法即可，紧
跟在这个方法后的第一个MyBatis 查询方法会被进行分页。
```java
//获取第1页，10条内容，默认查询总数count
PageHelper.startPage(1, 10);
//紧跟着的第一个select方法会被分页
List<Country> list = countryMapper.selectIf(1);
```

#### 4.5.2 前端分页(JQuery)
```js
$(document).ready(function() {
            $("#changePageSize").val("${pageInfo.size}");
            var lis = "";
			var firstPage = '<li onclick="pageHref(${pageInfo.navigateFirstPage})"><a href="javaScript:void(0)" aria-label="Previous">首页</a></li>';
			var prePage = '<li id="pre-page" onclick="pageHref(${pageInfo.navigateFirstPage})"><a href="javaScript:void(0)">上一页</a></li>';
			lis += firstPage;
			lis += prePage;
			var start;
			var end;
			//前3后2
			var pages = ${pageInfo.pages};
			var pageNum = ${pageInfo.pageNum};
			console.log(pages  +pageNum);
			if(pages <= 5){
				start = 1;
				end = pages
			}else{
			    start = pageNum - 3;
			    end = pageNum + 2;
			    if(start  < 1){
					start = 1;
					end = start + 4;
				}
				if(end > pages){
			        end = pages;
			        start = end - 4;
				}
			}
            for (var i = start; i <= end; i++) {
                if(pageNum == i){
                    lis += '<li onclick="pageHref('+i+')" class="active"><a href="javaScript:void(0)">'+i+'</a></li>';
                }else{
                    lis += '<li onclick="pageHref('+i+')"><a href="javaScript:void(0)">'+i+'</a></li>';
				}
            }

			var nextPage = '<li id="next-page" onclick="pageHref(${pageInfo.pageSize})"><a href="javaScript:void(0)">下一页</a></li>';
			var lastPage = '<li onclick="pageHref(${pageInfo.pages})"><a href="javaScript:void(0)" aria-label="Next">尾页</a></li>';
			lis += nextPage;
			lis += lastPage;
			$("#pagination").html(lis);

            // 移除点击事件
			if(pageNum == 1){
				$("#pre-page").addClass("disabled");
                $("#pre-page").removeAttr("onclick");
			}
            if(pageNum == pages){
                $("#next-page").addClass("disabled");
                $("#next-page").removeAttr("onclick");
            }
		});
```
### 4.6 用户登入

```java
public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        UserInfo userInfo = null;
        try {
            userInfo = userDao.findByUsername(username);
        } catch (Exception e) {
            e.printStackTrace();
        }
        //处理自己的用户对象封装成UserDetails
        // "{noop}" + userInfo.getPassword() 没有加密码处理, 以下是加密码处理
        User user = new User(userInfo.getUsername(),userInfo.getPassword(),userInfo.getStatus() == 0 ? false:true,true,true,true,getAuthority(userInfo.getRoles()));
        return user;
    }
    //作用就是返回一个List集合，集合中装入的是角色描述
    public List<SimpleGrantedAuthority> getAuthority(List<Role> roles){
        List<SimpleGrantedAuthority> list = new ArrayList<>();
        for (Role role:roles) {
            list.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return list;
    }
```

### 4.7 密码加密
#### 4.7.1 spring-security.xml 开启密码加码
```xml
<security:authentication-manager>
        <security:authentication-provider user-service-ref="userService">
             <!--配置加密的方式-->
             <security:password-encoder ref="passwordEncoder"/>
        </security:authentication-provider>
    </security:authentication-manager>
    <!-- 配置加密类 -->
    <bean id="passwordEncoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"/>
```
#### 4.7.2 加密工具类
```java
public class BCryptPasswordEncoderUtil {
    private static BCryptPasswordEncoder cryptPasswordEncoder = new BCryptPasswordEncoder();
    /*密码加密*/
    public static String encrypt (String password){
        String cyptPassword = null;
        if(password != null && password.length() > 0){
            cyptPassword = cryptPasswordEncoder.encode(password);
        }
        return cyptPassword;
    }
}
```

#### 4.7.3 添加用户时加密
```java
 @Override
    public void save(UserInfo user) throws Exception {
        user.setPassword(BCryptPasswordEncoderUtil.encrypt(user.getPassword()));
        user.setId(UuidUtil.getUuid());
        userDao.save(user);
    }
```

### 4.8 系统日志

#### 4.8.1 前置通知
```java
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
```

#### 4.8.2 后置通知

```java
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
```
