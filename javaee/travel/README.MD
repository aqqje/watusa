# Travel 旅游网

## 1.环境
- 操作系统:win7
- 语言:java8, html, JQuery, ajax
- 服务器:tomcat7, 

## 2.数据结构
### 2.1 用户相关
- `tab_user` 用户表 
- `tab_seller` 供应商表
### 2.2 路线相关
- `tab_route` 路线表
- `tab_category` 分类表
- `tab_route_img` 路线图片
### 2.2 中间表
- `tab_favorite` 收藏表



## 3 功能介绍
### 3.1 注册
### 3.2 登入,登出
### 3.3 分类管理
### 3.4 旅游路线管理
### 3.5 旅游复杂查询 
### 3.6 旅游路线收藏

## 4.技术要点

### 4.1 用户注册

#### 4.1.1 验证码
```java
@WebServlet("/checkCodeServlet")
public class CheckCodeServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //服务器通知浏览器不要缓存
        response.setHeader("pragma","no-cache");
        response.setHeader("cache-control","no-cache");
        response.setHeader("expires","0");

        /*定义验证长与宽*/
        int width = 80;
        int height = 30;

        /*创建图片对象*/
        BufferedImage image = new BufferedImage(width, height,BufferedImage.TYPE_INT_RGB);
        /*获取画笔*/
        Graphics g = image.getGraphics();
        /*设置颜色并绘制背景*/
        g.setColor(Color.gray);
        g.fillRect(0, 0, width, height);
        /*随机获取4个字符*/
        String code = getCheckCode();
        /*将验证码存储到session域中*/
        request.getSession().setAttribute("CHECK_CODE",code);
        /*设置字体与大小*/
        g.setColor(Color.yellow);
        g.setFont(new Font("黑体", Font.BOLD, 24));
        /*绘制在图片上*/
        g.drawString(code,15, 25);
        /*输出*/
        ImageIO.write(image,"PNG", response.getOutputStream());

    }

    public String getCheckCode(){
        String base = "0123456789QWERTYUIOPLKJHGFDSAZXCVBNMqwertyuioplkjhgfdsazxcvbnm";
        StringBuffer sb = new StringBuffer();
        Random r = new Random();
        for (int i = 1; i <= 4; i++) {
            int index = r.nextInt(base.length());
            char c  = base.charAt(index);
            sb.append(c);
        }
        return sb.toString();

    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
    }
}
```

#### 4.1.2 表单校验 
```js
/*校验表单
            * 	id: 被校验的 input id
            * 	regx: 校验正则
            * 	error: 校验错误文件	
            * */
            function check(id,regx,error){
                $(id).blur(function(){
                    var name = $(id).val();
                    var reg =  regx;
                    if(reg.test(name)){
                        $(id).css(({'border':'solid 1px green'}));
                    }else{
                        $(id).css(({'border':'solid 1px red'}));
                        $("#reg_Error_Msg").text(error);
                    }
                }).focus(function(){
                    $(id).triggerHandler("blur");
                }).keyup(function(){
                    $(id).triggerHandler("blur");
                });
            }
```

#### 4.1.3 提交表单
```js
 $("#registerForm").submit(function(){
    /*提交表单进行信息校验*/
    $(".tjjx,#check").trigger("focus");
    console.log($("#reg_Error_Msg").text().length <= 0)
    if($("#reg_Error_Msg").text().length <= 0){
        // $(this).serialize() 将表单序列化
        $.post("user/register",$(this).serialize(),function(data){
            if(data.flag){/*注册成功*/
                location.href="register_ok.html";
            }else{/*注册失败*/
                $("#reg_Error_Msg").text(data.errorMsg);
            }
        });
    }
    return false;
});
``` 
#### 4.1.4 封装表单对象
- BeanUtils是通过 setXXX&getXXX 的 xxx 属性来封装的
```java
/*获取所有的值*/
Map<String, String[]> parameterMap = request.getParameterMap();
/*创建 registerUser*/
User registerUser = new User();
try {
    /*封装到User*/
    BeanUtils.populate(registerUser, parameterMap);
} catch (IllegalAccessException e) {
    e.printStackTrace();
} catch (InvocationTargetException e) {
    e.printStackTrace();
}
```

#### 4.1.5 发送激活邮件
```java
String content = "<a href='http://localhost:8060/travel/user/active?activeCode="+ registerUser.getCode() +"'>点击激活[Travel旅游网]</a>";
try {
    MailUtils.sendMail("xxxxxx@qq.com", content, "激活邮件");
} catch (Exception e) {
    return false;
}
```

### 4.2 优化 Servlet

#### 4.2.1 创建 BaseServlet
```java
public class BaseServlet extends HttpServlet {

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        /*获取请求路径*/
        String uri = req.getRequestURI();
        /*获取请求方法*/
        String methodName = uri.substring(uri.lastIndexOf("/") + 1);
        /*获取方法的Method对象*/
        try {
            Method method = this.getClass().getMethod(methodName, HttpServletRequest.class, HttpServletResponse.class);
            /*Method.invoke()反射调用*/
            method.invoke(this, req, resp);
        } catch (NoSuchMethodException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        }
    }

    /**
     * 将结果转为json并传给客户端
     * @param resource
     * @param response
     * @throws IOException
     */
    public void writeValue(Object resource,HttpServletResponse response) throws IOException {
        ObjectMapper mapper = new ObjectMapper();
        String jsonString = mapper.writeValueAsString(resource);
        response.setContentType("application/json;charset=utf-8");
        response.getWriter().write(jsonString);
    }

    public String writeValueAsString(Object resource) throws JsonProcessingException {
        ObjectMapper mapper = new ObjectMapper();
        return mapper.writeValueAsString(resource);
    }
}

```
#### 4.2.2 优化-Servlet
```java
@WebServlet("/user/*")
public class UserServlet extends BaseServlet {
    private UserService service = new UserServiceImpl();
    
    public void register(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {...}
    public void active(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {...}
    public void findLoginUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {...}
    public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {...}
    ...    
}
```

### 4.3 优化-缓存
```java
public List findAll() {
Set<Tuple> categorys = jedis.zrangeWithScores("category", 0, -1);
List<Category> cs = null;
// 无缓存
if(categorys == null || categorys.size() == 0){
    System.out.println("Mysql获取,,,,,,");
    cs = dao.findAll();
    for(int i=0; i < cs.size(); i++){
        jedis.zadd("category", cs.get(i).getCid(), cs.get(i).getCname());
    }
}else{
    // 有缓存
    System.out.println("Redis获取,,,,,,");
    cs = new ArrayList<>();
    for(Tuple tuple: categorys){
        Category c = new Category();
        c.setCid((int) tuple.getScore());
        c.setCname(tuple.getElement());
        cs.add(c);
    }
}
return cs;

}
```
### 4.3 分页+复杂

#### 4.3.1 分页实体

```java
private int totalCount; // 总记录数
private int totalPage; // 总页数
private int currentPage; // 当前页
private int pageSize; // 每页实体数
private List<T> list; // 当前页实体集合
```

#### 4.3.3 Dao
```java
 @Override
public List<Route> findPageList(int cid, int start, int pageSize, String rname) {
    StringBuffer base = new StringBuffer("select * from tab_route where 1=1 ");
    List<Object> params = new ArrayList<>();
    if(cid != 0){
        base.append(" and cid = ? ");
        params.add(cid);
    }
    if(rname != null && rname.length() > 0){
        base.append(" and rname like ? ");
        params.add("%"+ rname +"%");
    }
    base.append(" limit ?, ? ");
    params.add(start);
    params.add(pageSize);
    String sql = base.toString();

    return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Route>(Route.class), params.toArray());
}
```
