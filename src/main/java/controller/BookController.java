package controller;

import entity.Item;
import entity.User;
import model.StatusCode;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import service.BookService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.awt.print.Book;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

/**
 * @author yezl
 * @date 2018/6/1 0:51
 * @decription this is :
 */
@Controller
public class BookController {
    private static final String UPLOAD_DIRECTORY = "upload";

    @Autowired
    BookService bookService;

    @RequestMapping("/getbook.do")
    public ModelAndView getbook(Item item){

        System.out.println("你点击的是"+item.getItemid());
        ModelAndView modelAndView =new ModelAndView("introduction.jsp");
        Item it =bookService.getBook(item.getItemid());

        modelAndView.addObject("book", it);
        modelAndView.getModel().put("keyword", it.getBookname());
        return modelAndView;

    }

    @RequestMapping("introduction")
    public ModelAndView introduction(int itemid){

        System.out.println("你点击的是"+itemid);
        ModelAndView modelAndView =new ModelAndView("introduction.jsp");
        Item it =bookService.getBook(itemid);

        modelAndView.addObject("book", it);
        modelAndView.getModel().put("keyword", it.getBookname());
        return modelAndView;

    }




    @RequestMapping("/search.do")
    public ModelAndView search(@RequestParam("keyword")String keyword, HttpSession httpSession){
        User user =(User) httpSession.getAttribute("user");
        ModelAndView modelAndView =new ModelAndView("search.jsp");
        List<Item> book_list = new ArrayList<Item>();
        if(keyword.equals("全部旧书"))
            book_list = bookService.getallBook(user.getUserid());
        else
            book_list = bookService.searchBook(keyword,user.getUserid());
        System.out.println("一共收到："+book_list.size());
        modelAndView.addObject("booklist", book_list);
        modelAndView.getModel().put("keyword", keyword);
        return modelAndView;

    }

    @RequestMapping("/search")
    public ModelAndView search(HttpSession httpSession){
        User user =(User) httpSession.getAttribute("user");
        ModelAndView modelAndView =new ModelAndView("search.jsp");
        List<Item> book_list = bookService.getallBook(user.getUserid());
        System.out.println("一共收到："+book_list.size());
        modelAndView.addObject("booklist", book_list);
        modelAndView.getModel().put("keyword", "全部旧书");
        return modelAndView;

    }

    @RequestMapping("/addBook.do")
    public ModelAndView addBook(Item item, @RequestParam("uploadimage") MultipartFile pic,
                              HttpServletRequest request, HttpSession httpSession)
            throws IllegalStateException, IOException {
        System.out.println(item.getBookname());
        User user =(User) httpSession.getAttribute("user");
        item.setSellerid(user.getUserid());
        System.out.println("sellerid"+user.getUserid());

        String realPath=request.getSession().getServletContext().getRealPath("/");
        // 如果目录不存在则创建
        File uploadDir = new File(realPath+UPLOAD_DIRECTORY);
        if (!uploadDir.exists()) {
            uploadDir.mkdir();
        }
        System.out.println(realPath);


        String originalFileName = pic.getOriginalFilename();
        // 新的图片名称
        String newFileName = UUID.randomUUID() + originalFileName.substring(originalFileName.lastIndexOf("."));
        // 新的图片

        item.setImages(newFileName);

        StatusCode statusCode;
        if(bookService.addBook(item,user)){
            statusCode = StatusCode.PASS;


            File newFile = new File(uploadDir +File.separator+ newFileName);
            System.out.println("File:"+newFile.getAbsolutePath());
            // 将内存中的数据写入磁盘
            pic.transferTo(newFile);
            return new ModelAndView("redirect:/sellinfo");
        }
        else{
            return new ModelAndView("redirect:/bookinfo");
        }



    }


}
