package service;

import entity.Item;

import java.util.List;

/**
 * @author yezl
 * @date 2018/6/1 22:41
 * @decription this is :
 */
public interface BookService {

    public List<Item> searchBook(String keywords);
}
