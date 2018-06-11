import java.util.Random;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import service.OrderService;

public class JunitTest extends BaseJunitTest{  
	
	@Autowired
    OrderService orderService;;
        @Test  
        public void test0(){
           // Long userid =(Long)201525060225;
            //orderService.deleteshopcart(40, userid);
        }  
          
       /* @Test  
        public void test1(){  
        	for(int i=0;i<100;i++)
        		for(int j=55;j<59;j++){
           int age=userService.getuserageById(j);
            System.out.println(age);
        		}
        	
        }  */
          
        /*@Test  
        public void test2(){  
            System.out.println("第三个测试方法*******");  
            
        }  */
  
}