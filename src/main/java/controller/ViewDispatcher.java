package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author yezl
 * @date 2018/5/29 23:20
 * @decription this is :
 */
@Controller("/views")
public class ViewDispatcher {
    @RequestMapping("/index")
    public String index(){
        System.out.println();
        return "index.html";
    }

    @RequestMapping("/home")
    public String home(){
        System.out.println();
        return "home.jsp";
    }


    @RequestMapping("/register")
    public String register(){
        System.out.println();
        return "register.html";
    }
    @RequestMapping("/search")
    public String search(){
        System.out.println();
        return "search.jsp";
    }

    @RequestMapping("/modifyPwd")
    public String rmodifyPwd(){
        return "modifyPwd.jsp";
    }

    @RequestMapping("bookinfo")
    public String bookinfo(){
        return "bookinfo.jsp";
    }

    @RequestMapping("information")
    public String information(){
        return "information.jsp";
    }

    @RequestMapping("introduction")
    public String introduction(){
        return "introduction.jsp";
    }

    @RequestMapping("pay")
    public String pay(){
        return "pay.jsp";
    }


    @RequestMapping("sellinfo")
    public String sellinfo(){
        return "sellinfo.jsp";
    }

    @RequestMapping("shopcart")
    public String shopcart(){
        return "shopcart.jsp";
    }

    @RequestMapping("ShowError")
    public String ShowError(){
        return "ShowError.jsp";
    }

    @RequestMapping("successPay")
    public String successPay(){
        return "successPay.jsp";
    }

}
