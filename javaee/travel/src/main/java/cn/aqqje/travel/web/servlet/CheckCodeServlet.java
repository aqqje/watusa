package cn.aqqje.travel.web.servlet;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

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
