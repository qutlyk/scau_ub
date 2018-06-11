package controller;

import model.StatusCode;
import net.sf.json.JSONObject;
import entity.User;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.UserService;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
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
    public JSONObject login(@RequestParam("username") Long username,@RequestParam("password") String password,
                            HttpSession httpSession){

        System.out.println("用户名");
        System.out.println(username);
        User user=new User();
        user.setUserid(username);
        user.setPassword(password);

        StatusCode statusCode;
        List<User> users=userService.login(user);
        statusCode = StatusCode.REJECT;
        if(users.size()>0){
            for(User u : users){
                if(u.getPassword().equals(user.getPassword())) {
                    httpSession.setAttribute("user", u);
                    statusCode = StatusCode.PASS;
                }
            }
        }else {
            statusCode = StatusCode.REJECT;
        }

        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result",statusCode.getStateInfo());
        map.put("page", "home");
        return map;

    }

    @RequestMapping("/regist.do")
    @ResponseBody
    public JSONObject register(User user){

        System.out.println("注册："+user.getUserid());
        StatusCode statusCode=userService.register(user);
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("page", "index");
        map.put("result",statusCode.getStateInfo());
        return map;
    }

    @RequestMapping("/updateuser.do")
    @ResponseBody
    public JSONObject updateuser(User user,HttpSession httpSession){

        System.out.println(user.getUserid());

        StatusCode statusCode=userService.updateUser(user);
        httpSession.setAttribute("user", userService.getUser(user.getUserid()));
        JSONObject map = new JSONObject();
        map.put("flag", statusCode.getState());
        map.put("result",statusCode.getStateInfo());
        return map;
    }

    @RequestMapping("/logout.do")
    @ResponseBody
    public ModelAndView logout(HttpSession httpSession){

        return new ModelAndView("index");
    }


}
