import java.util.List;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.me.domain.User;
import com.me.service.UserService;

public class UnitTest {


	@Test
	public void dd() {
		ApplicationContext aContext=new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService user=(UserService) aContext.getBean("userService");
		System.out.println(user.count());
		List<User> users=user.findPage(11, 5);
		System.out.println(users.size());
		System.out.println(users.get(0).getUserName());
	}
}
