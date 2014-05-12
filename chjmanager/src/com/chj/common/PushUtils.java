package com.chj.common;

import java.io.IOException;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import cn.jpush.api.DeviceEnum;
import cn.jpush.api.ErrorCodeEnum;
import cn.jpush.api.JPushClient;
import cn.jpush.api.MessageResult;

import javapns.back.PushNotificationManager;
import javapns.back.SSLConnectionHelper;
import javapns.data.Device;
import javapns.data.PayLoad;

public class PushUtils {

	/************************************************
	 * 测试推送服务器地址：gateway.sandbox.push.apple.com /2195
	 * 产品推送服务器地址：gateway.push.apple.com / 2195
	 ***************************************************/
	private static String host = "gateway.sandbox.push.apple.com";
	private static int port = 2195;
	private static String p12FilePassword = "minzh2010";

	/**
	 * android推送
	 */
	private static final String appKey ="8fc053a4ba8ae2baf704035e";	//必填，例如466f7032ac604e02fb7bda89
	private static final String masterSecret = "415aaf28fa6e634cf27eb9cd";//"13ac09b17715bd117163d8a1";//必填，每个应用都对应一个masterSecret
	private static JPushClient jpush = null;
	/**
	 * 保存离线的时长。秒为单位。最多支持10天（864000秒）。
	 * 0 表示该消息不保存离线。即：用户在线马上发出，当前不在线用户将不会收到此消息。
	 * 此参数不设置则表示默认，默认为保存1天的离线消息（86400秒)。
	 */
	private static long timeToLive =  60 * 60 * 24; 
     
	
	public static void main(String[] args) throws Exception {

		/**
		 * iphone推送
		 */
		 List<Object> deviceTokens = new ArrayList<Object>();
		 deviceTokens.add("ae5ce2f1f8d0afc228ce722469ce05aad145ac40babc1147755726373d0fc236");
		 String content ="不二二八不二二八不二二八方法方法方法方法方法呵呵呵呵呵呵";
		 String p12File = "d:/minzhtest.p12";// 这里是一个.p12格式的文件路径，需要去apple官网申请一个
		 push2More(p12File, deviceTokens,content);// 群组推送

		/**
		 * winphone推送
		 */
//		List<Object> uriTokens = new ArrayList<Object>();
//		uriTokens.add("http://hk1.notify.live.net/throttledthirdparty/01.00/AQEPOwWkjv2dTq8HTw0tA4K_AgAAAAADcQAAAAQUZm52OjFDNzY1Q0UyNDU3NDcyMTQFBkFTRUEwMQ");
//        System.out.println("http://hk1.notify.live.net/throttledthirdparty/01.00/AQEPOwWkjv2dTq8HTw0tA4K_AgAAAAADbQAAAAQUZm52OjFDNzY1Q0UyNDU3NDcyMTQFBkFTRUEwMQ".equals("http://hk1.notify.live.net/throttledthirdparty/01.00/AQEPOwWkjv2dTq8HTw0tA4K_AgAAAAADbAAAAAQUZm52OjFDNzY1Q0UyNDU3NDcyMTQFBkFTRUEwMQ")); 
//		pushWinphoneToastNotifications(uriTokens, "顶顶顶", "方法方法方法呵呵呵呵方法方法方法呵呵呵呵方法方法方法呵呵呵呵方呵呵呵44");
		
//		
//		List<Object> alians = new  ArrayList<Object>();
//		alians.add("216");
//		pushAndroidMsg(alians,"title","content");
	}

	public static void pushAndroidMsg(List<Object> aliansList, String title, String content) {
		// TODO Auto-generated method stub
		if(jpush==null){
			jpush = new JPushClient(masterSecret, appKey, timeToLive, DeviceEnum.Android);
			jpush.setEnableSSL(true);
		}
		for(Object alians : aliansList){
			if(alians==null || alians.toString().trim().length()==0)
				continue;
			//对所有用户发送通知, 更多方法请参考文档
			//MessageResult msgResult = jpush.sendCustomMessageWithAppKey(sendNo,msgTitle, msgContent);
			
			//MessageResult msgResult = jpush.sendCustomMessageWithAlias(sendNo, "test1", msgTitle, msgContent);
			MessageResult msgResult = jpush.sendNotificationWithAlias(1, alians.toString(), title, content);
		
			if (null != msgResult) {
				System.out.println("服务器返回数据: " + msgResult.toString());
				if (msgResult.getErrcode() == ErrorCodeEnum.NOERROR.value()) {
					System.out.println(String.format("发送成功， sendNo= %s,messageId= %s",msgResult.getSendno(),msgResult.getMsgid()));
				} else {
					System.out.println("发送失败， 错误代码=" + msgResult.getErrcode() + ", 错误消息=" + msgResult.getErrmsg());
				}
			} else {
				System.out.println("无法获取数据");
			}
		}
		
	}

	/**
	 * 向单个iphone手机推送消息.
	 * 
	 * @param deviceToken
	 *            iphone手机获取的token
	 * @param p12File
	 *            .p12格式的文件路径
	 * @param p12Pass
	 *            .p12格式的文件密码
	 * @param customDictionarys
	 *            CustomDictionary字典组
	 * @param content
	 *            推送内容
	 */
	public static void push2One(String p12File, String deviceToken,
			String content) {
		try {
			PayLoad payLoad = new PayLoad();
			payLoad.addAlert(content);// push的内容
			payLoad.addBadge(1);// 应用图标上小红圈上的数值
			payLoad.addSound("default");// 铃音

			// 添加字典
			payLoad.addCustomDictionary("url", "www.baidu.com");
			PushNotificationManager pushManager = PushNotificationManager
					.getInstance();
			pushManager.addDevice("iphone", deviceToken);

			// 链接到APNs
			pushManager.initializeConnection(host, port, p12File,
					p12FilePassword, SSLConnectionHelper.KEYSTORE_TYPE_PKCS12);

			// 开始推送
			Device client = pushManager.getDevice("iphone");
			pushManager.sendNotification(client, payLoad);
			// 断开链接
			pushManager.stopConnection();
			pushManager.removeDevice("iphone");

		} catch (Exception e) {

		}
	}

	/**
	 * 向iphone群组推送消息.
	 * 
	 * @param deviceTokens
	 *            iphone手机获取的token
	 * @param p12File
	 *            .p12格式的文件路径
	 * @param p12Pass
	 *            .p12格式的文件密码
	 * @param customDictionarys
	 *            CustomDictionary字典
	 * @param content
	 *            推送内容
	 */
	public static void push2More(String p12File, List<Object> deviceTokens,
			String content) {
		PushNotificationManager pushManager = null;
		try {
			PayLoad payLoad = new PayLoad();
			payLoad.addAlert(content);// push的内容
			payLoad.addBadge(1);// 应用图标上小红圈上的数值
			payLoad.addSound("default");// 铃音

			// 添加字典
			payLoad.addCustomDictionary("url", "www.baidu.com");
			pushManager = PushNotificationManager.getInstance();

			// 链接到APNs
			pushManager.initializeConnection(host, port, p12File,
					p12FilePassword, SSLConnectionHelper.KEYSTORE_TYPE_PKCS12);

			// 开始循环推送
			for (int i = 0; i < deviceTokens.size(); i++) {
				if (deviceTokens.get(i) == null
						|| deviceTokens.get(i).toString().trim().length() == 0)
					continue;
				pushManager.addDevice("iphone" + i, deviceTokens.get(i).toString());
				Device client = pushManager.getDevice("iphone" + i);
				pushManager.sendNotification(client, payLoad);
			}

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println(e.getLocalizedMessage());
		} finally {
			if (pushManager != null) {
				// 断开链接
				try {
					pushManager.stopConnection();
					for (int i = 0; i < deviceTokens.size(); i++) {
						pushManager.removeDevice("iphone" + i);
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

			}
		}
	}

	/**
	 * 推送toast通知
	 * 
	 * @param uriString
	 *            推送服务通知uri
	 * @param title
	 *            toast标题
	 * @param content
	 *            toast内容
	 * @param param
	 *            页面跳转参数
	 * @return 推送通知服务响应码
	 * @throws IOException
	 */
	public static int pushWinphoneToastNotifications(List<Object> uriString,
			String title, String content) {
		for (Object uri : uriString) {
			if (uri == null || uri.toString().trim().length() == 0)
				continue;
			String toastMsg = "<?xml version=\"1.0\" encoding=\"utf-8\"?>"
					+ "<wp:Notification xmlns:wp=\"WPNotification\">"
					+ "<wp:Toast>" + "<wp:Text1>"+title+"</wp:Text1>"
					+ "<wp:Text2>" + content + "</wp:Text2>"
					+ "<wp:Param>/MainPage.xaml</wp:Param>" + "</wp:Toast>"
					+ "</wp:Notification>";

			URL url = null;
			HttpURLConnection http = null;
			StringBuffer sb = new StringBuffer();
			try {
				url = new URL(uri.toString());
				http = (HttpURLConnection) url.openConnection();

				http.setDoOutput(true);
				http.setRequestMethod("POST");
				http.setRequestProperty("Content-Type",
						"text/xml");
				http.setRequestProperty("X-WindowsPhone-Target", "toast");
				http.setRequestProperty("X-NotificationClass", "2");
				http.setRequestProperty("Content-Length", "1024");
				http.getOutputStream().write(toastMsg.getBytes("utf-8"));
				// 刷新对象输出流，将任何字节都写入潜在的流中
				http.getOutputStream().flush();
				// 关闭输出流
				http.getOutputStream().close();
				int rt = http.getResponseCode();
				if (rt == 200) {
					InputStream in = http.getInputStream();
					byte[] b = new byte[1024];
					int i = 0;
					while ((i = in.read(b)) != -1) {
						sb.append(new String(b, 0, i, "UTF-8"));
					}
				}
				

			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				if (http != null) {
					http.disconnect();
				}
			}
			System.out.println(sb.toString());
		}

		return 1;
	}
}
