package controller;

import entity.Item;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import service.BookService;

import java.awt.print.Book;
import java.util.List;

/**
 * @author yezl
 * @date 2018/6/1 0:51
 * @decription this is :
 */
@Controller
@RequestMapping("/book")
public class BookController {

    @Autowired
    BookService bookService;

    @RequestMapping("/search.do")
    public ModelAndView search(@RequestParam("keyword")String keyword){
        ModelAndView modelAndView =new ModelAndView("search.jsp");
        List<Item> book_list = bookService.searchBook(keyword);
        System.out.println("一共收到："+book_list.size());
        modelAndView.addObject("booklist", book_list);
        modelAndView.addObject("keyword", keyword);
        return modelAndView;

    }


}
