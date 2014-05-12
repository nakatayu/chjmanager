package com.chj.common;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.chj.action.CommonAction;
import com.json.BaseBean;
import com.sun.image.codec.jpeg.JPEGCodec;
import com.sun.image.codec.jpeg.JPEGImageEncoder;



public class Commonparam {
	public static int imageMax = 1024 * 400;
	public static int videoMax = 1024 * 1024 * 100;
	public static int swfMax = 1024 * 1024 * 100;
	public static int fileMax = 1024 * 1024 * 10;
	/**
	 * 圈子创建状态  1创建待审核2修改申请3升级申请4 申请关闭 ,5 6未用
	 */
	public static final int[] CIRCLE_STATUS = new int[] {1,2,3,4,5,6};
	/**
	 * 圈子审核状态  1 审核通过2审核不通过3未审核
	 */
	public static final int[] EXAMINE_RESULT = new int[] {1,2,3};
	/**
	 * 圈子类型 1企业2普通
	 */
	public static final int[] CIRCLE_TYPE = new int[] { 1, 2};
	
	/**
	 * 圈子等级   1 人数《=50 2  人数《=200 3 人数《=500 4人数《=1000 5人数《=3000
	 */
	public static final int[] CIRCLE_LEVEL = new int[] { 1, 2,3,4,5};
	/**
	 * 圈子列名，first_phone_extend：手机首页推荐，relation_phone_extend：手机人脉推荐，is_extend：网页推荐
	 */
	public static final String[] CIRCLE_COLUMNS = new String[] {"first_phone_extend","relation_phone_extend","is_extend_index","is_extend"};


	/**
	 * 活动类型 1线下  2线上
	 */
	public static final int[] ACTIVITY_TYPE = new int[] { 1, 2};
	/** 
	 * 活动状态  1创建待审核2审核通过3修改申请4修改审核通过5申请关闭6关闭活动
	 */
	public static final int[] ACTIVITY_STATUS = new int[] { 1, 2,3,4,5,6};
	/**
	 * 活动列名，first_phone_extend：手机首页推荐，relation_phone_extend：手机人脉推荐，is_extend：网页推荐
	 */
	public static final String[] ACTIVITY_COLUMNS = new String[] {"first_phone_extend","relation_phone_extend","is_extend_index","is_extend"};

	
	
	/**
	 * 话题状态 1待审核话题 2审核通过 3关闭话题
	 */
	public static final int[] TOPIC_STATUS =  new int[]{1,2,3};
	
	/**
	 * 话题状态 1审核通过  2审核不通过
	 */
	public static final int[] TOPIC_BSTATUS =  new int[]{1,2};
	/**
	 * 话题列名，list_top：置顶，web_extend：网页经典推荐，tui_order：网页普通推荐，first_phone_extend：手机首页推荐，relation_phone_extend：手机人脉推荐
	 */
	public static final String[] TOPIC_COLUMNS = new String[] {"list_top","first_phone_extend","relation_phone_extend","web_extend","tui_order"};

	/**
	 * 服务列名，tui_order：网页推荐，first_phone_extend：手机首页推荐，relation_phone_extend：手机共享推荐
	 */
	public static final String[] SERVICE_COLUMNS = new String[] {"tui_order","first_phone_extend","relation_phone_extend"};
	
	/**
	 * 店铺商品表列名，first_phone_extend：手机首页推荐，relation_phone_extend：手机便捷推荐，first_extend：网页推荐，order_field_function：促销、推广推荐，order_field_category：分类推荐
	 */
	public static final String[] SHOPPRODUCT_COLUMNS = new String[] {"first_phone_extend","relation_phone_extend","first_extend","order_field_function","order_field_category"};
	/**
	 * 店铺商品表列名FUNCTION_TYPE的值
	 */
	public static final String[] SHOPPRODUCT_FUNCTION_TYPE =new String[]{"T","C"};
	/**
	 * 店铺表列名，order_field：网页推荐，first_phone_extend：手机首页推荐，relation_phone_extend：手机便捷推荐
	 */
	public static final String[] SHOP_COLUMNS = new String[] {"order_field","first_phone_extend","relation_phone_extend"};
	/**
	 * 企业表列名，order_field：网页推荐
	 */
	public static final String[] COMPANY_COLUMNS = new String[] {"order_field"};
	
			
	public static String headImage = "/upload/headimage";//个人头像1
	public static String companyFolder="/upload/company";//企业所有图片//2
	public static String companyShopFolder="/upload/companyshop";//店铺所有图片3
	public static String circleFolder="/upload/circleimage";//圈子图片4
	public static String topicFolder="/upload/topicimage";//话题图片5
	public static String activityFolder="/upload/activityimage";//活动图片6
	public static String productFolder="/upload/product";//商品图片7
	public static String adsFolder="/upload/ads";//广告图片8
	public static String cardImage = "/upload/cardimage";//个人证件图片9
	public static String qrcodefolder = "/upload/qrcodefolder";//二维码图片10
	public static String otherfolder = "/upload/other";//其他图片11
	public static String htmlfolder="/upload/html";//其他图片11
	public static SimpleDateFormat fmt = new SimpleDateFormat(
			"yyyy-MM-dd HH:mm:ss");
	public static SimpleDateFormat fmtshort = new SimpleDateFormat("yyyy-MM-dd");
	public static String p12Path = "/common/cert.p12";


	public static Date String2ShortDate(String str) {
		Date time = null;

		try {
			time = fmtshort.parse(str);
		} catch (java.text.ParseException e) {

			e.printStackTrace();
		}

		return time;

	}

	public static String Date2ShortStr(Date date) {
		if (date != null)
			return fmtshort.format(date);
		else
			return "";

	}

	public static String Date2Str(Date date) {
		if (date != null)
			return fmt.format(date);
		else
			return "";
	}

	public static Date StringtoDate(String str) {
		Date time = null;

		try {
			time = fmt.parse(str);
		} catch (java.text.ParseException e) {

			e.printStackTrace();
		}

		return time;

	}

	public static String nowDate() {
		Date date = new Date();
		String nowDate = (date.getYear() + 1900) + "-" + (date.getMonth() + 1)
				+ "-" + (date.getDate()) + "";
		return nowDate;

	}

	public static Date NowTime() {

		Date now = new Date();
		return now;

	}

	public static BaseBean checkUseDate(String loginDate, int spaceMonth,
			int remainMinutes) throws ParseException {
		BaseBean bean = new BaseBean();
		if (loginDate == null || loginDate.length() == 0) {
			bean.setStatus(200);
			bean.setMsg("未曾登录");
			return bean;
		}
		Calendar cal0 = Calendar.getInstance();
		cal0.setTime(fmt.parse(loginDate));
		cal0.add(Calendar.MONTH, spaceMonth); // 得到后24个月
		cal0.add(Calendar.MINUTE, remainMinutes); // 得到后24个月
		long enddate = cal0.getTimeInMillis();

		Calendar cal = Calendar.getInstance();
		cal.setTime(fmt.parse(loginDate));
		cal.add(Calendar.MONTH, 23); // 得到后23个月
		long date = cal.getTimeInMillis();

		Calendar cal1 = Calendar.getInstance();
		long now = cal1.getTimeInMillis();
		if (now >= date) {
			if (now >= enddate) {
				bean.setStatus(400);
				bean.setMsg("使用期限已经到期");
				System.out.println("使用期限已经到期");
			} else {
				int spacedate = (int) ((enddate - now) / (24 * 60 * 60 * 1000));
				if (spacedate > 0) {
					bean.setStatus(300);
					bean.setMsg("使用期限将到期,剩余" + spacedate + "天");
					System.out.println("使用期限将到期,剩余" + spacedate + "天");
				} else {
					int spacehour = (int) ((enddate - now) / (60 * 60 * 1000));
					if (spacehour > 0) {
						bean.setStatus(300);
						bean.setMsg("使用期限将到期,剩余" + (spacehour) + "小时");
						System.out.println("使用期限将到期,剩余" + (spacehour) + "小时");
					} else {
						int spacem = (int) ((enddate - now) / (60 * 1000));
						bean.setStatus(300);
						bean.setMsg("使用期限将到期,剩余" + (spacem) + "分钟");
						System.out.println("使用期限将到期,剩余" + (spacem) + "分钟");
					}
				}

			}
		} else {
			bean.setStatus(200);
			bean.setMsg("使用期限未到期");
		}
		System.out.println("now:" + fmt.format(new Date(now)) + "---------end:"
				+ fmt.format(new Date(enddate)));
		return bean;
	}

	

	/**
	 * 压缩图片
	 * 
	 * @param srcImageFile
	 *            原文件
	 * @param dstImageFileName
	 *            目标文件地址
	 * @throws Exception
	 */
	public static void makeSmallImage(File srcImageFile, String dstImageFileName)
			throws Exception {
		FileOutputStream fileOutputStream = null;
		JPEGImageEncoder encoder = null;
		BufferedImage tagImage = null;
		Image srcImage = null;
		try {
			srcImage = ImageIO.read(srcImageFile);
			int srcWidth = srcImage.getWidth(null);// 原图片宽度
			int srcHeight = srcImage.getHeight(null);// 原图片高度
			int dstMaxSize = 120;// 目标缩略图的最大宽度/高度，宽度与高度将按比例缩写
			int dstWidth = 120; // srcWidth;//缩略图宽度
			int dstHeight = 120; // srcHeight;//缩略图高度
			float scale = 0;
			// 计算缩略图的宽和高
			// if(srcWidth>dstMaxSize){
			// dstWidth = dstMaxSize;
			// scale = (float)srcWidth/(float)dstMaxSize;
			// dstHeight = Math.round((float)srcHeight/scale);
			// }
			// srcHeight = dstHeight;
			// if(srcHeight>dstMaxSize){
			// dstHeight = dstMaxSize;
			// scale = (float)srcHeight/(float)dstMaxSize;
			// dstWidth = Math.round((float)dstWidth/scale);
			// }
			// 生成缩略图
			tagImage = new BufferedImage(dstWidth, dstHeight,
					BufferedImage.TYPE_INT_RGB);
			tagImage.getGraphics().drawImage(srcImage, 0, 0, dstWidth,
					dstHeight, null);
			fileOutputStream = new FileOutputStream(dstImageFileName);
			encoder = JPEGCodec.createJPEGEncoder(fileOutputStream);
			encoder.encode(tagImage);
			fileOutputStream.close();
			fileOutputStream = null;
		} finally {
			if (fileOutputStream != null) {
				try {
					fileOutputStream.close();
				} catch (Exception e) {
				}
				fileOutputStream = null;
			}
			encoder = null;
			tagImage = null;
			srcImage = null;
			System.gc();
		}
	}

	public static boolean deleteFile(String filepath) {
		if (filepath == null || filepath.length() == 0) {
			return true;
		} else {
			File file = new File(filepath);
			if (file.isFile() && file.exists()) {
				return file.delete();
			}
		}

		return true;
	}

	/**
	 * 
	 * @param file
	 *            源文件
	 * @param targetFolder
	 *            目标文件夹
	 * @param filename
	 *            最终
	 * @throws IOException
	 */
	public static void makeFile( File file,
			String absolute, String filename) throws IOException {
		
		File absoluteFolder = new File(absolute);
		if (!absoluteFolder.exists()) {
			absoluteFolder.mkdirs();
		}
		FileOutputStream fos = null;
		FileInputStream fis = null;
		fos = new FileOutputStream(absolute + filename);
		fis = new FileInputStream(file);
		byte[] buffer = new byte[1024];
		int len = 0;
		while ((len = fis.read(buffer)) > 0) {
			fos.write(buffer, 0, len);
		}
		fos.close();
		fis.close();

	}

	public static String makeNewFileName(String oldfilename) {
		
		String ext = oldfilename.substring(
				oldfilename.lastIndexOf("."),
				oldfilename.length());
		SimpleDateFormat fmt1 = new SimpleDateFormat(
				"yyyyMMddHHmmss");
		String newfilename = fmt1.format(new Date()) + "_"
				+ UUID.randomUUID().toString() + ext;
		return newfilename;
	}

	public static boolean StringIsNull(String account) {
		if (account == null || account.trim().length() == 0)
			return true;
		return false;
	}

	public static boolean StringIsNotNull(String account) {
		if (account != null && account.trim().length() > 0)
			return true;
		return false;
	}
	public static SimpleDateFormat yearmonth = new SimpleDateFormat("/yyyy/MM/");
	
	public static String makeYearMonth(Date date) {
		String time ="/2013/12/";
		try {
			 time = yearmonth.format(date);
		} catch (Exception e) {

			e.printStackTrace();
		}

		return time;
	}

	public static String getKeyValue(String key) {
		Properties prop = new Properties();
		InputStream in = CommonAction.class
				.getResourceAsStream("/util.properties");
		try {
			prop.load(in);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return prop.getProperty(key);
	}
	
	public static String clearStr(String str) {		
		if(str!=null&&str.trim().length()>0){
			String bug ="<div style=\"top: 0px;\">﻿﻿</div>";			
			str = str.replaceAll(bug, "");	
		}			
		return str;
	}

}
