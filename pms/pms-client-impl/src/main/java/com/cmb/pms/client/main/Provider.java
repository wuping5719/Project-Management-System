package com.cmb.pms.client.main;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.cmb.pms.client.dto.UserDTO;
import com.cmb.pms.client.service.UserServiceClient;

/**
 * @author WuPing
 * @version 2017年9月22日 
 */

public class Provider {

	@Autowired
	private static UserServiceClient userServiceClient;

	public static void main(String[] args) throws Exception {
		try {
			@SuppressWarnings("resource")
			ClassPathXmlApplicationContext cxt = new ClassPathXmlApplicationContext(
					new String[] { "classpath:spring/spring.xml",
							"classpath:spring/spring-mybatis.xml",
							"classpath:spring/spring-druid.xml",
							"classpath:spring/dubbo-core-provider.xml",
							"classpath:spring/dubbo-client-provider.xml" });

			cxt.start();

			userServiceClient = (UserServiceClient) cxt.getBean("userServiceClient");
			UserDTO userDTO = userServiceClient.getUserById(2);
			System.out.println("用户:" + userDTO.getUserName());

			while (true) {
				// 循环阻塞，模拟服务开启
			}
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getMessage());
			Logger log = Logger.getLogger(Provider.class);
			log.error(e.getMessage()); // 将异常输出到文件
		}

	}

}
