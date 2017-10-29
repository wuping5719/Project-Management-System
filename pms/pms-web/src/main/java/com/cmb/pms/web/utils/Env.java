package com.cmb.pms.web.utils;

import java.util.Properties;

/**
 * 读取 env.properties 配置文件中的配置项
 * 
 * @author WuPing
 *
 */
public final class Env {
	public static final String APP_NAME = "app.name";
	public static final String LOGIN_AFTER_JUMP_URL = "login.after.jump.url";
	private static Properties props;

	// 判断URL资源是否已获取
    private static boolean urlRes_IsGet = false;
    
	public static synchronized void init(Properties properties) {
		props = properties;
	}

	/**
	 * 读取配置项
	 * 
	 * @param key
	 * @return
	 */
	public static final String getProperty(String key) {
		return props.getProperty(key);
	}
	
	public static boolean isUrlRes_IsGet() {
		return urlRes_IsGet;
	}

	public static void setUrlRes_IsGet(boolean urlRes_IsGet) {
		Env.urlRes_IsGet = urlRes_IsGet;
	}
}
