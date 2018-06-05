package service;

import entity.BuyerItem;
import entity.Item;
import entity.SellerItem;
import entity.User;
import model.StatusCode;

import java.util.List;

/**
 * @author yezl
 * @date 2018/6/4 15:03
 * @decription this is :
 */
public interface OrderService {

    public boolean canbebuied(int[] itemid);

    public int sumPrice(int[] itemidlist);

    public StatusCode accountcash(int[] itemidlist, User user,int sum);

    public StatusCode addshopcart(int itemid , long userid);

    public StatusCode deleteshopcart(int itemid ,long userid);

    public StatusCode deleteallshopcart(long userid);

    public List<BuyerItem> getsellinfo(User seller, int status);

    public List<Item> getshopcart(User user);

    public List<SellerItem> getorderinfo(User buyer,int status);

    public StatusCode deleteitem(int itemid ,long userid);

    public StatusCode deleteorder(int itemid ,long userid);

    public StatusCode confirmgood(int itemid ,long userid);
}
