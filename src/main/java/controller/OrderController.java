package controller;

import entity.BuyerItem;
import entity.Item;
import entity.SellerItem;
import entity.User;
import model.StatusCode;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.BookService;
import service.OrderService;
import service.UserService;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * @author yezl
 * @date 2018/6/4 15:02
 * @decription this is :
 */
@Controller
public class OrderController {
    @Autowired
    OrderService orderService;
    @Autowired
    UserService userService;
    @Autowired
    BookService bookService;



    @RequestMapping("preparePay.do")
    public ModelAndView preparePay(@RequestParam("itemid") int[] itemids, HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();
        ModelAndView modelAndView = new ModelAndView("pay.jsp");
        modelAndView.addObject("user", userService.getUser(userid));
        List<Item> items = new ArrayList<Item>();
        for(int i:itemids)
            System.out.println("itemid:"+i);
        if (orderService.canbebuied(itemids)) {
            for(int i:itemids) {
                Item item = bookService.getBook(i);
                items.add(item);
                orderService.deleteshopcart(i, userid);
            }
            modelAndView.addObject("itemlist", items);
            modelAndView.addObject("sum", orderService.sumPrice(itemids));
            modelAndView.getModel().put("flag", 200);
        } else
            modelAndView.getModel().put("flag", 400);
        return modelAndView;

    }

    @RequestMapping("pay.do")
    public ModelAndView pay(@RequestParam("itemidlist") int[] itemidlist, HttpSession httpSession) {
        User buyer = (User) httpSession.getAttribute("user");
        for(int i:itemidlist)
            System.out.println("itemidlist"+i);
        int sum = orderService.sumPrice(itemidlist);
        StatusCode statusCode = orderService.accountcash(itemidlist, buyer, sum);
        httpSession.setAttribute("user", userService.getUser(buyer.getUserid()));

        ModelAndView modelAndView = new ModelAndView("successPay.jsp");
        modelAndView.getModel().put("sum", sum);
        modelAndView.addObject("statusCode", statusCode);
        modelAndView.addObject("buyer", buyer);
        return modelAndView;

    }

    @RequestMapping("addshopcart.do")
    @ResponseBody
    public JSONObject addshopcart(@RequestParam("itemid") int itemid, HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();

        StatusCode statusCode = orderService.addshopcart(itemid, userid);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result", statusCode.getStateInfo());
        return map;
    }

    @RequestMapping("deleteshopcart.do")
    @ResponseBody
    public JSONObject deleteshopcart(@RequestParam("itemid") int itemid, HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();

        StatusCode statusCode = orderService.deleteshopcart(itemid, userid);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result", statusCode.getStateInfo());
        return map;
    }

    @RequestMapping("deleteallshopcart.do")
    @ResponseBody
    public  ModelAndView deleteallshopcart(HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();
        orderService.deleteallshopcart( userid);
        return new ModelAndView("shopcart.jsp");
    }

    @RequestMapping("confirmgood.do")
    @ResponseBody
    public JSONObject confirmgood(@RequestParam("itemid") int itemid, HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();

        StatusCode statusCode = orderService.confirmgood(itemid, userid);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result", statusCode.getStateInfo());
        return map;
    }

    @RequestMapping("deletesellitem.do")
    @ResponseBody
    public JSONObject deletesellitem(@RequestParam("itemid") int itemid, HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();


        StatusCode statusCode = orderService.deleteitem(itemid, userid);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result", statusCode.getStateInfo());

        return map;
    }

    @RequestMapping("deleteorder.do")
    @ResponseBody
    public JSONObject deleteorder(@RequestParam("itemid") int itemid, HttpSession httpSession) {
        Long userid = ((User) httpSession.getAttribute("user")).getUserid();


        StatusCode statusCode = orderService.deleteorder(itemid, userid);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result", statusCode.getStateInfo());

        return map;
    }





    @RequestMapping("sellinfo")
    public ModelAndView sellinfo(HttpSession httpSession) {
        User seller = (User) httpSession.getAttribute("user");

        List<BuyerItem> itemList0 = orderService.getsellinfo(seller,0);
        List<BuyerItem> itemList1 = orderService.getsellinfo(seller,1);
        List<BuyerItem> itemList2 = orderService.getsellinfo(seller,2);

        ModelAndView modelAndView = new ModelAndView("sellinfo.jsp");
        modelAndView.addObject("buyeritemList0", itemList0);
        modelAndView.addObject("buyeritemList1", itemList1);
        modelAndView.addObject("buyeritemList2", itemList2);
        return modelAndView;

    }

    @RequestMapping("order")
    public ModelAndView order(HttpSession httpSession) {
        User seller = (User) httpSession.getAttribute("user");

        List<SellerItem> sellitemList1 = orderService.getorderinfo(seller,1);
        List<SellerItem> sellitemList2 = orderService.getorderinfo(seller,2);

        ModelAndView modelAndView = new ModelAndView("order.jsp");
        modelAndView.addObject("sellitemList1", sellitemList1);
        modelAndView.addObject("sellitemList2", sellitemList2);
        return modelAndView;

    }

    @RequestMapping("shopcart")
    public ModelAndView shopcart(HttpSession httpSession){
        User user = (User) httpSession.getAttribute("user");
        List<Item> itemList = orderService.getshopcart(user);

        ModelAndView modelAndView = new ModelAndView("shopcart.jsp");
        modelAndView.addObject("itemList", itemList);

        return modelAndView;

    }


}
