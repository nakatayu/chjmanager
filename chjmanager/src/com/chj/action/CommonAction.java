package com.chj.action;

import java.awt.image.BufferedImage;
import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper;
import org.springframework.beans.factory.annotation.Autowired;

import cn.eavic.framework.web.BaseAction;

import com.chj.common.Commonparam;
import com.chj.service.UserManager;
import com.json.BaseBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/")
@Results({ @Result(name = BaseAction.NONE, location = "commonAction.action", type = "redirect") })
public class CommonAction extends ActionSupport {

	@Autowired
	UserManager userManager;
	private static final long serialVersionUID = -3006428240642866461L;

	String upliadFilePath;

	public void deleteUploadFile() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean = new BaseBean();
		try {

			if (this.upliadFilePath != null) {
				upliadFilePath = "/"
						+ upliadFilePath.substring(upliadFilePath
								.indexOf("upload"));
				String path = request.getSession().getServletContext()
						.getRealPath("/").replace("chjmanager", "chjservice")
						+ upliadFilePath;
				File file = new File(path);
				if (file.exists()) {
					file.delete();
				}

				bean.setStatus(200);
				bean.setMsg(path);
			} else {
				bean.setStatus(400);
				bean.setMsg("请选择图片!");
			}

		} catch (Exception e) {
			bean.setMsg(e.getLocalizedMessage());
			bean.setStatus(400);
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	private String filedataFileName;

	public void uploadHtmlFile() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap rt = new HashMap();
		try {

			org.apache.struts2.dispatcher.multipart.MultiPartRequestWrapper ff = (MultiPartRequestWrapper) request;
			String[] filenames = ff.getFileNames("filedata");
			File[] files = ff.getFiles("filedata");
			filedataFileName = filenames[0];
			SimpleDateFormat fmt = new SimpleDateFormat("yyyy/MM");
			String ext = filedataFileName.substring(
					filedataFileName.lastIndexOf("."),
					filedataFileName.length());

			String newfilename = Commonparam.makeNewFileName(filedataFileName);
			String targetFolder = Commonparam.htmlfolder
					+ Commonparam.makeYearMonth(new Date());
			String absolute = Commonparam.getKeyValue("imageStorePath")
					+ targetFolder;

			File absoluteFolder = new File(absolute);
			if (!absoluteFolder.exists()) {
				absoluteFolder.mkdirs();
			}

			BufferedInputStream fileIn = new BufferedInputStream(
					new FileInputStream(files[0]));

			byte[] buf = new byte[1024];
			File file = new File(absolute + "/" + newfilename);

			BufferedOutputStream fileOut = new BufferedOutputStream(
					new FileOutputStream(file));

			while (true) {
				// 读取数据
				int bytesIn = fileIn.read(buf, 0, 1024);
				if (bytesIn == -1) {
					break;
				} else {
					fileOut.write(buf, 0, bytesIn);
				}
			}

			fileOut.flush();
			fileOut.close();
			long length = file.length();
			ext = ext.toLowerCase();
			if (ext.contains("jpg") || ext.contains("jpeg")
					|| ext.contains("png") || ext.contains("gif")) {
				if (Commonparam.imageMax >= length) {

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "图片大小在150K内!");
					rt.put("msg", "图片大小在150K内!");
				}
			} else if (ext.contains("mp3") || ext.contains("mp4")
					|| ext.contains("avi")) {
				if (Commonparam.videoMax >= length) {
					Properties prop = new Properties();
					InputStream in = CommonAction.class
							.getResourceAsStream("/util.properties");
					prop.load(in);

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "视频大小在100M内!");
					rt.put("msg", "视频大小在100M内!");
				}
			} else if (ext.contains("swf")) {
				if (Commonparam.swfMax >= length) {
					Properties prop = new Properties();
					InputStream in = CommonAction.class
							.getResourceAsStream("/util.properties");
					prop.load(in);

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "动画大小在100M内!");
					rt.put("msg", "动画大小在100M内!");
				}
			} else {
				if (Commonparam.fileMax >= length) {
					Properties prop = new Properties();
					InputStream in = CommonAction.class
							.getResourceAsStream("/util.properties");
					prop.load(in);

					rt.put("err", "");
					rt.put("msg", Commonparam.getKeyValue("imagepath")
							+ targetFolder + newfilename);
				} else {
					rt.put("err", "文件大小在10M内!");
					rt.put("msg", "文件大小在10M内!");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
			rt.put("err", e.getLocalizedMessage());
			rt.put("msg", e.getLocalizedMessage());
		}
		String json = JSONObject.fromObject(rt).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));

	}

	private String path;

	public void findPicture() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap rt = new HashMap();
		try {
			Properties prop = new Properties();
			InputStream in = CommonAction.class
					.getResourceAsStream("/util.properties");
			prop.load(in);

			File file = new File(prop.getProperty("imageStorePath") + path);

			if (file.exists()) {

				BufferedInputStream fileIn = new BufferedInputStream(
						new FileInputStream(file));

				byte[] buf = new byte[1024];

				while (true) {
					// 读取数据
					int bytesIn = fileIn.read(buf, 0, 1024);
					if (bytesIn == -1) {
						break;
					} else {
						response.getOutputStream().write(buf, 0, bytesIn);
					}
				}
			}

		} catch (Exception e) {
			e.printStackTrace();

		}

	}

	public void findNewVersion() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		HashMap<String, Object> bean = new HashMap<String, Object>();
		try {
			Object verion = userManager.findAppVersionList();
			bean.put("status", 200);
			bean.put("rows", verion);
		} catch (Exception e) {
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}
	
	String updtype,version,appUrl,Notype;
	public void updateAppVersion() throws Exception {
		HttpServletResponse response = (HttpServletResponse) ActionContext
				.getContext().get(ServletActionContext.HTTP_RESPONSE);
		HttpServletRequest request = (HttpServletRequest) ActionContext
				.getContext().get(ServletActionContext.HTTP_REQUEST);
		BaseBean bean=new BaseBean();
		try {
			HashMap<String, Object> map=new HashMap<String, Object>();
			map.put("updtype", updtype);
			map.put("version", version);
			map.put("appUrl", appUrl);
			map.put("Notype", Notype);
			
			userManager.updateAppVersion(map);
			bean.setStatus(200);			
		} catch (Exception e) {
		}
		String json = JSONObject.fromObject(bean).toString();
		response.getOutputStream().write(json.getBytes("UTF-8"));
	}

	public String getUpdtype() {
		return updtype;
	}

	public void setUpdtype(String updtype) {
		this.updtype = updtype;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getAppUrl() {
		return appUrl;
	}

	public void setAppUrl(String appUrl) {
		this.appUrl = appUrl;
	}

	public String getNotype() {
		return Notype;
	}

	public void setNotype(String notype) {
		Notype = notype;
	}

	public String getUpliadFilePath() {
		return upliadFilePath;
	}

	public void setUpliadFilePath(String upliadFilePath) {
		this.upliadFilePath = upliadFilePath;
	}

	public String getFiledataFileName() {
		return filedataFileName;
	}

	public void setFiledataFileName(String filedataFileName) {
		this.filedataFileName = filedataFileName;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
