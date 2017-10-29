package com.cmb.pms.web.utils;

import java.io.File;
import java.math.BigDecimal;

public final class FileUtil {

	// byte (字节) 根据长度转成 KB (千字节)
	public static double bytesToKB(long bytes) {
		BigDecimal filesize = new BigDecimal(bytes);
		BigDecimal kilobyte = new BigDecimal(1024);
		double result = filesize.divide(kilobyte, 2, BigDecimal.ROUND_UP).doubleValue();
		return result;
	}

	// 删除指定目录下的单个文件
	public static boolean deleteFile(String fileName) {
		File file = new File(fileName);
		if (file.isFile() && file.exists()) {
			boolean succeedDelete = file.delete();
			if (succeedDelete) {
				return true;
			} else {
				return true;
			}
		} else {
			return false;
		}
	}
}
