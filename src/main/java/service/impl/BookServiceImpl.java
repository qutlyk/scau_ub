package service.impl;

import dao.ItemMapper;
import dao.SellMapper;
import dao.UserMapper;
import entity.Item;
import entity.ItemExample;
import entity.Sell;
import entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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
public class BookServiceImpl implements BookService{
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    SellMapper sellMapper;

    public List<Item> searchBook(String keywords,long userid){
        System.out.println("你搜索的是"+keywords);
        String[] keyword= keywords.split("");
        HashMap<Integer, Item> searchlist =new HashMap<Integer, Item>();
        for(int i=0;i<keyword.length;i++){
            keyword[i]="%"+keyword[i]+"%";
        }
        ItemExample ie =new ItemExample();

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

    public Item getBook(int itemid){
        ItemExample ie =new ItemExample();
        ItemExample.Criteria iec =ie.createCriteria();
        Item it=itemMapper.selectByPrimaryKey(itemid);
//        if(it.getStatus()!=0){
////            return
////        }

        return it;
    }
    public Item getItem(int itemid){
        Item item= itemMapper.selectByPrimaryKey(itemid);
        if(item.getStatus()==0){
            return item;
        }
        return null;

    }



}
