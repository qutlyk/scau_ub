package service.impl;

import dao.*;
import entity.*;
import model.StatusCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.OrderService;

import java.util.ArrayList;
import java.util.List;

/**
 * @author yezl
 * @date 2018/6/4 15:03
 * @decription this is :订单和购物车，出售详情业务
 */
@Service
public class OrderServiceImpl implements OrderService{
    @Autowired
    ItemMapper itemMapper;
    @Autowired
    UserMapper userMapper;
    @Autowired
    SellMapper sellMapper;
    @Autowired
    ShopcarMapper shopcarMapper;

    public boolean canbebuied(int[] itemids){
        for(int itemid:itemids) {
            Item item = itemMapper.selectByPrimaryKey(itemid);
            if (item.getStatus() != 0)
                return false;
        }
        return true;
    }




    public int sumPrice(int[] itemidlist){
        int sum=0;
        for(int itemid:itemidlist) {
            Item item = itemMapper.selectByPrimaryKey(itemid);
            sum += item.getPrice();
        }
        return  sum;
    }




    public StatusCode accountcash(int[] itemidlist, User user,int sum){
        User theuser =userMapper.selectByPrimaryKey(user.getUserid());
        if(theuser.getMoney()<sum)
            return StatusCode.MONEY_NOT_ENOUGH;

        for(int itemid:itemidlist){
            Item item=itemMapper.selectByPrimaryKey(itemid);
            if(item.getStatus()!=0)
                return StatusCode.HAS_BUY;
            if(item.getSellerid().equals(user.getUserid()))
                return StatusCode.BUY_SEIFITEM;
            item.setStatus(1);
            item.setBuyerid(user.getUserid());
            itemMapper.updateByPrimaryKey(item);

            Sell sell =new Sell();
            sell.setItemid(itemid);
            sell.setUserid(user.getUserid());
            sell.setIssellok(1);
            sellMapper.insert(sell);

            User seller=userMapper.selectByPrimaryKey(item.getSellerid());
            seller.setMoney(seller.getMoney()+item.getPrice());
            userMapper.updateByPrimaryKey(seller);
        }


        theuser.setMoney(user.getMoney()-sum);
        userMapper.updateByPrimaryKey(theuser);

        return StatusCode.PASS;

    }


    public StatusCode addshopcart(int itemid ,long userid){
        ShopcarExample se=new ShopcarExample();
        ShopcarExample.Criteria sec=se.createCriteria();
        sec.andUseridEqualTo(userid);
        sec.andItemidEqualTo(itemid);

        if(shopcarMapper.selectByExample(se).size()>0) {
            return StatusCode.SAME_SHOPCART;
        }
        else if(itemMapper.selectByPrimaryKey(itemid).getStatus()!=0){
            return StatusCode.HAS_BUY;
        }
        Shopcar sc=new Shopcar();
        sc.setItemid(itemid);
        sc.setUserid(userid);
        shopcarMapper.insert(sc);
        return StatusCode.PASS;


    }

    public StatusCode deleteshopcart(int itemid ,long userid){
        ShopcarExample se=new ShopcarExample();
        ShopcarExample.Criteria sec=se.createCriteria();
        sec.andUseridEqualTo(userid);
        sec.andItemidEqualTo(itemid);
        shopcarMapper.deleteByExample(se);
        return StatusCode.PASS;
    }


    public StatusCode deleteallshopcart(long userid){
        ShopcarExample se=new ShopcarExample();
        ShopcarExample.Criteria sec=se.createCriteria();
        sec.andUseridEqualTo(userid);
        shopcarMapper.deleteByExample(se);
        return StatusCode.PASS;
    }


    public List<BuyerItem> getsellinfo(User seller,int status){
        ItemExample se =new ItemExample();
        ItemExample.Criteria sec =se.createCriteria();
        sec.andStatusEqualTo(status);
        sec.andSelleridEqualTo(seller.getUserid());
        List<BuyerItem> itemList=new ArrayList<BuyerItem>();
        for(Item it:itemMapper.selectByExample(se)){
            BuyerItem buyerItem = new BuyerItem();
            buyerItem.setItem(it);
            buyerItem.setBuyer(userMapper.selectByPrimaryKey(it.getBuyerid()));
            itemList.add(buyerItem);
        }
        return  itemList;
    }

    public List<Item> getshopcart(User user){
        ShopcarExample se =new ShopcarExample();
        ShopcarExample.Criteria sec =se.createCriteria();
        sec.andUseridEqualTo(user.getUserid());

        List<Item> itemList=new ArrayList<Item>();
        for(Shopcar sc:shopcarMapper.selectByExample(se)){
            itemList.add(itemMapper.selectByPrimaryKey(sc.getItemid()));
        }

        return  itemList;
    }

    public List<SellerItem> getorderinfo(User buyer,int status){
        SellExample se =new SellExample();
        SellExample.Criteria sec =se.createCriteria();
        sec.andUseridEqualTo(buyer.getUserid());
        sec.andIssellokEqualTo(status);
        List<Sell> sellList=sellMapper.selectByExample(se);

        List<SellerItem> orderItemList = new ArrayList<SellerItem>();
        for(Sell s:sellList){
            SellerItem si=new SellerItem();
            Item i=itemMapper.selectByPrimaryKey(s.getItemid());
            if(i.getStatus()==status) {
                si.setItem(i);
                si.setSeller(userMapper.selectByPrimaryKey(i.getSellerid()));
                orderItemList.add(si);
            }
        }
        return  orderItemList;
    }


    public StatusCode deleteitem(int itemid ,long userid){
        Item delitem=itemMapper.selectByPrimaryKey(itemid);
        if(delitem.getSellerid()!=userid)
            return StatusCode.CANNOT_DELETE;
        delitem.setStatus(4);
        itemMapper.updateByPrimaryKey(delitem);
        return StatusCode.PASS;
    }

    public StatusCode deleteorder(int itemid ,long userid){
        SellExample se =new SellExample();
        SellExample.Criteria sec =se.createCriteria();
        sec.andItemidEqualTo(itemid);
        sec.andUseridEqualTo(userid);

        for(Sell s:sellMapper.selectByExample(se))
            if(s.getIssellok()!=2)
                return StatusCode.CANNOT_CONFIRM2;
        sellMapper.deleteByExample(se);
        return StatusCode.PASS;
    }

    public StatusCode confirmgood(int itemid ,long userid){
        Item confirmitem=itemMapper.selectByPrimaryKey(itemid);
        if(confirmitem.getBuyerid()!=userid)
            return StatusCode.CANNOT_CONFIRM;
        if(confirmitem.getStatus()!=1){
            return StatusCode.CANNOT_CONFIRM2;
        }
        confirmitem.setStatus(2);
        SellExample se=new SellExample();
        SellExample.Criteria sec = se.createCriteria();
        sec.andUseridEqualTo(userid);
        sec.andItemidEqualTo(itemid);
        for(Sell s:sellMapper.selectByExample(se)) {
            s.setIssellok(2);
            sellMapper.updateByPrimaryKey(s);
        }
        itemMapper.updateByPrimaryKey(confirmitem);
        return StatusCode.PASS;
    }



}
