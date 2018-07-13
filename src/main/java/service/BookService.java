package service;

import entity.Item;
import entity.User;

import javax.jws.soap.SOAPBinding;
import java.util.List;

/**
 * @author yezl
 * @date 2018/6/1 22:41
 * @decription this is :
 */
public interface BookService {

    public List<Item> searchBook(String keywords,long userid,int start,int num,String orderStr);

    public boolean addBook(Item item, User user);

    public Item getBook(int itemid);

    public Item getItem(int itemid);

    public List<Item> getallBook(long userid,int start,int num,String orderstr);
}
