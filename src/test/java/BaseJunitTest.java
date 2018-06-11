/**
 * 
 */

import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

/**
 * @author yezl
 * @date 2018年3月29日 下午11:55:04
 * @version  1.0.0
 */
@RunWith(SpringJUnit4ClassRunner.class)  
@ContextConfiguration(locations = {"classpath*:spring-mvc.xml","classpath*:applicationContext.xml"})
public class BaseJunitTest {
	
	
	public void testUserService(){
		
	}

}
