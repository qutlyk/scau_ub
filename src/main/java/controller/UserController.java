package controller;

import net.sf.json.JSONObject;
import entity.StatusCode;
import entity.User;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import service.UserService;

import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

/**
 * @author yezl
 * @date 2018/5/27 21:45
 * @decription this is :
 */
@Controller
@RequestMapping("/user")
public class UserController {
    @Autowired
    UserService userService;

    @RequestMapping("/login.do")
    @ResponseBody
    public JSONObject login(@RequestParam("username") Long username,@RequestParam("password") String password){
        System.out.println("用户名");
        System.out.println(username);
        User user=new User();
        user.setUserid(username);
        user.setPassword(password);

        StatusCode statusCode=userService.login(user);

        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result",statusCode.getStateInfo());
        map.put("page", "home");
        return map;

    }

    @RequestMapping("regist.do")
    @ResponseBody
    public JSONObject register(User user, HttpServletResponse response){

        System.out.println(user.getUserid());
        StatusCode statusCode=userService.register(user);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("page", "index");
        map.put("result",statusCode.getStateInfo());
        return map;
    }
}
