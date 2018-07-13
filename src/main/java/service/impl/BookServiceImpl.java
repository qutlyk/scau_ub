package service.impl;

import dao.ItemMapper;
import dao.SellMapper;
import dao.UserMapper;
import entity.Item;
import entity.ItemExample;
import entity.Sell;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import service.BookService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author yezl
 * @date 2018/6/1 22:41
 * @decription this is :根据bookname author press kind other
 */
@Service
@Transactional(propagation= Propagation.REQUIRED, rollbackFor=Exception.class)
public class BookServiceImpl implements BookService{
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    SellMapper sellMapper;

//    @Cacheable("searchbook") //标注该方法查询的结果进入缓存，再次访问时直接读取缓存中的数据
//    public List<Item> searchBook(String keywords,long userid){
//        System.out.println("你搜索的是"+keywords);
//        String[] keyword= keywords.split("");
//        HashMap<Integer, Item> searchlist =new HashMap<Integer, Item>();
//        for(int i=0;i<keyword.length;i++){
//            keyword[i]="%"+keyword[i]+"%";
//        }
//        ItemExample ie =new ItemExample();
//
//        for(String kw:keyword){
//            ItemExample.Criteria iec = ie.or().andAuthorLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid).;
//            ItemExample.Criteria iec1 = ie.or().andBooknameLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
//            ItemExample.Criteria iec2 = ie.or().andPressLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
//            ItemExample.Criteria iec3 = ie.or().andKindLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
//            ie.or(iec);
//            ie.or(iec1);
//            ie.or(iec2);
//            ie.or(iec3);
//        }
//        List<Item> itemlist = itemMapper.selectByExample(ie);
//        return itemlist;
//    }

    @Cacheable("searchbook") //标注该方法查询的结果进入缓存，再次访问时直接读取缓存中的数据
    public List<Item> searchBook(String keywords,long userid,int start,int num,String orderStr){
        System.out.println("你搜索的是"+keywords);
        String[] keyword= keywords.split("");
        HashMap<Integer, Item> searchlist =new HashMap<Integer, Item>();
        for(int i=0;i<keyword.length;i++){
            keyword[i]="%"+keyword[i]+"%";
        }
        ItemExample ie =new ItemExample();
        ie.setOrderByClause(orderStr);
        ie.setStart(start);
        ie.setLimit(num);

        for(String kw:keyword){
            ItemExample.Criteria iec = ie.or().andAuthorLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
            ItemExample.Criteria iec1 = ie.or().andBooknameLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
            ItemExample.Criteria iec2 = ie.or().andPressLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
            ItemExample.Criteria iec3 = ie.or().andKindLike(kw).andStatusEqualTo(0).andSelleridNotEqualTo(userid);
            ie.or(iec);
            ie.or(iec1);
            ie.or(iec2);
            ie.or(iec3);
        }
        List<Item> itemlist = itemMapper.selectByExample(ie);
        return itemlist;
    }

    @CacheEvict(value= {"getbook","searchbook","getallbook"},allEntries=true)//清空缓存，allEntries变量表示所有对象的缓存都清除
    public boolean addBook(Item item, User user){
        ItemExample ie =new ItemExample();
        ItemExample.Criteria iec =ie.createCriteria();
        iec.andBooknameEqualTo(item.getBookname());
        iec.andSelleridEqualTo(item.getSellerid());
        List<Item> itemlist=itemMapper.selectByExample(ie);
        if(itemlist.size()>0)
            return false;
        item.setStatus(0);
        itemMapper.insert(item);

        return true;
    }



    @Cacheable("getbook")
    public Item getBook(int itemid){
        ItemExample ie =new ItemExample();
        ItemExample.Criteria iec =ie.createCriteria();
        Item it=itemMapper.selectByPrimaryKey(itemid);
//        if(it.getStatus()!=0){
////            return
////        }

        return it;
    }
    @Cacheable("getbook")
    public Item getItem(int itemid){
        Item item= itemMapper.selectByPrimaryKey(itemid);
        if(item.getStatus()==0){
            return item;
        }
        return null;

    }
    @Cacheable("getallbook")
    public List<Item> getallBook(long userid,int start,int num,String orderstr){

        ItemExample ie =new ItemExample();
        ItemExample.Criteria iec = ie.createCriteria();
        iec.andStatusEqualTo(0).andSelleridNotEqualTo(userid);
        ie.setOrderByClause(orderstr);
        ie.setStart(start);
        ie.setLimit(num);
        List<Item> itemlist = itemMapper.selectByExample(ie);
        return itemlist;
    }



}
