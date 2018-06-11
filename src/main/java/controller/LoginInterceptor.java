package controller;

import entity.User;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.logging.Logger;

//public class LoginInterceptor implements HandlerInterceptor {
//
//    //日志
//    protected Logger log = Logger.getLogger(getClass());
//
//
//
//    public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
//                             Object handle) throws Exception {
//
//        //创建session
//        HttpSession session =request.getSession();
//
//        //无需登录，允许访问的地址
//        String[] allowUrls =new String[]{"/login","/login.do"};
//
//        //获取请求地址
//        String url =request.getRequestURL().toString();
//
//        //获得session中的用户
//        User user =(User) session.getAttribute("user");
//
//
//        for (String strUrl : allowUrls) {
//            if(url.contains(strUrl))
//            {
//                return true;
//            }
//        }
//
//        if(user ==null)
//        {
//            throw new UnLoginException("您尚未登录！");
//
//        }
//        //重定向
//        //response.sendRedirect(request.getContextPath()+"/toLogin");
//
//
//            return true;
//
//
//    }
//
//    @Override
//    public void postHandle(HttpServletRequest request,
//            HttpServletResponse response, Object handler,
//            ModelAndView modelAndView) throws Exception {
//        // TODO Auto-generated method stub
//
//    }
//
//    @Override
//    public void afterCompletion(HttpServletRequest request,
//            HttpServletResponse response, Object handler, Exception ex)
//            throws Exception {
//        // TODO Auto-generated method stub
//
//    }
//
//}