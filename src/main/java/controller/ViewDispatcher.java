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

    @RequestMapping("ShowError")
    public String ShowError(){
        return "ShowError.jsp";
    }



    @RequestMapping("bookinfo")
    public String bookinfo(){
        return "bookinfo.jsp";
    }


    @RequestMapping("information")
    public String information(){
        return "information.jsp";
    }
}
