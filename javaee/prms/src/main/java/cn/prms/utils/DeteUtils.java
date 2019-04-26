package cn.prms.utils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 时间与字符转化工具类
 */
public class DeteUtils {

    /*时间转字符串*/
    public static String date2String(Date date, String patt){
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        return sdf.format(date);
    }
    /*字符串转时间*/
    public static Date String2Date(String dateStr, String patt){
        SimpleDateFormat sdf = new SimpleDateFormat(patt);
        Date date = null;
        try {
            date = sdf.parse(dateStr);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return date;
    }
}
