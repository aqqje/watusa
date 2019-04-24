package cn.aqqje.travel.service.impl;

import cn.aqqje.travel.dao.CategoryDao;
import cn.aqqje.travel.dao.impl.CategoryDaoImpl;
import cn.aqqje.travel.domain.Category;
import cn.aqqje.travel.service.CategoryService;
import cn.aqqje.travel.util.JedisUtil;
import redis.clients.jedis.Jedis;
import redis.clients.jedis.Tuple;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class CategoryServletImpl implements CategoryService {
    private CategoryDao dao = new CategoryDaoImpl();
    private Jedis jedis = JedisUtil.getJedis();
    @Override
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
}
