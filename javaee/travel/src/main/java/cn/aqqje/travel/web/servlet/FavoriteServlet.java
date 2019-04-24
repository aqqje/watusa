package cn.aqqje.travel.web.servlet;

import cn.aqqje.travel.domain.User;
import cn.aqqje.travel.service.FavoriteService;
import cn.aqqje.travel.service.impl.FavoriteServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/favorite/*")
public class FavoriteServlet extends BaseServlet {

    private FavoriteService service = new FavoriteServiceImpl();
    /**
     * 判断是否收藏
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    public void isFavorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int rid = Integer.parseInt(request.getParameter("rid"));
        User user = (User) request.getSession().getAttribute("loginUser");
        boolean flag = false;
        if(user != null && rid != 0){
            flag = service.isFavorite(rid, user);

        }
        writeValue(flag, response);
    }

    public void favorite(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        int rid = Integer.parseInt(request.getParameter("rid"));
        User user = (User) request.getSession().getAttribute("loginUser");
        Map<String, Object> result = new HashMap<>();
        if(user != null && rid != 0){
            int count = service.favorite(rid, user.getUid());
            result.put("flag", true);
            result.put("user", user);
            result.put("count", count);
        }else{
            result.put("flag", false);
        }
        writeValue(result, response);
    }


}
