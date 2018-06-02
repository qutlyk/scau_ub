package service.impl;

import dao.ItemMapper;
import dao.UserMapper;
import entity.Item;
import entity.ItemExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
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

    public List<Item> searchBook(String keywords){
        System.out.println("你搜索的是"+keywords);
        String[] keyword= keywords.split("");
        HashMap<Integer, Item> searchlist =new HashMap<Integer, Item>();
        for(int i=0;i<keyword.length;i++){
            keyword[i]="%"+keyword[i]+"%";
            System.out.println(keyword[i]);
        }


        for(String kw:keyword){
            ItemExample ie =new ItemExample();
            ItemExample.Criteria iec =ie.createCriteria();
            iec.andAuthorLike(kw);
            List<Item> itemlist = itemMapper.selectByExample(ie);
            for(Item item:itemlist){
                if(item.getStatus()==0)
                    searchlist.put(item.getItemid(), item);
            }
        }
        System.out.println(searchlist.size());

        for(String kw:keyword){
            ItemExample ie =new ItemExample();
            ItemExample.Criteria iec =ie.createCriteria();
            iec.andBooknameLike(kw);
            List<Item> itemlist = itemMapper.selectByExample(ie);
            for(Item item:itemlist){
                if(item.getStatus()==0)
                    searchlist.put(item.getItemid(), item);
            }
        }

        for(String kw:keyword){
            ItemExample ie =new ItemExample();
            ItemExample.Criteria iec =ie.createCriteria();
            iec.andPressLike(kw);
            List<Item> itemlist = itemMapper.selectByExample(ie);
            for(Item item:itemlist){
                if(item.getStatus()==0)
                    searchlist.put(item.getItemid(), item);
            }
        }

        for(String kw:keyword){
            ItemExample ie =new ItemExample();
            ItemExample.Criteria iec =ie.createCriteria();
            iec.andKindLike(kw);
            List<Item> itemlist = itemMapper.selectByExample(ie);
            for(Item item:itemlist){
                if(item.getStatus()==0)
                    searchlist.put(item.getItemid(), item);
            }
        }

        for(String kw:keyword){
            ItemExample ie =new ItemExample();
            ItemExample.Criteria iec =ie.createCriteria();
            iec.andOtherLike(kw);
            List<Item> itemlist = itemMapper.selectByExample(ie);
            for(Item item:itemlist){
                if(item.getStatus()==0)
                    searchlist.put(item.getItemid(), item);
            }
        }

        List<Item> fianllist = new ArrayList<Item>(searchlist.values());


        return fianllist;
    }



}
