package com.chj.entity;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 
 * 对应 tb_user
 * 
 */

public class User implements java.io.Serializable {

	// Fields
	/**
	 * 中文注释: 约束 : primary key 数据库中字段名 : user_id 数据库中类型类型 : paginate 数据库中类型长度 :
	 * 注释:
	 */
	private Long userId;
	/**
	 * 中文注释: 昵称 约束 : unique not null 数据库中字段名 : nick_name 数据库中类型类型 : varchar2
	 * 数据库中类型长度 : 50 注释:
	 */
	private String nickName;
	/**
	 * 中文注释: 密码 约束 : not null 数据库中字段名 : password 数据库中类型类型 : varchar2 数据库中类型长度 :
	 * 50 注释: 贮存密码的MD5加密
	 */
	private String password;
	/**
	 * 中文注释: 注册电话 约束 : unique not null 数据库中字段名 : phone 数据库中类型类型 : varchar2
	 * 数据库中类型长度 : 31 注释: 注册手机号
	 */
	private String phone;
	/**
	 * 中文注释: 是否验证 约束 : 数据库中字段名 : is_verify 数据库中类型类型 : varchar2 数据库中类型长度 : 2 注释:
	 */
	private String isVerify;
	/**
	 * 中文注释: 注册邮箱 约束 : not null 数据库中字段名 : email 数据库中类型类型 : varchar2 数据库中类型长度 :
	 * 127 注释:
	 */
	private String email;
	/**
	 * 中文注释: 性别 约束 : 数据库中字段名 : sex 数据库中类型类型 : varchar2 数据库中类型长度 : 2 注释:
	 */
	private String sex;
	/**
	 * 中文注释: 最后登录IP 约束 : 数据库中字段名 : last_login_ip 数据库中类型类型 : varchar2 数据库中类型长度 :
	 * 31 注释:
	 */
	private String lastLoginIp;
	/**
	 * 中文注释: 最后登录时间 约束 : 数据库中字段名 : last_login_time 数据库中类型类型 : datetime 数据库中类型长度
	 * : 注释:
	 */
	private Date lastLoginTime;

	public String getShandCardNo() {
		return shandCardNo;
	}

	public void setShandCardNo(String shandCardNo) {
		this.shandCardNo = shandCardNo;
	}

	public Date getRegisterTime() {
		return registerTime;
	}

	public void setRegisterTime(Date registerTime) {
		this.registerTime = registerTime;
	}

	/**
	 * 中文注释: 证件编号 约束 : 数据库中字段名 : id_card_no 数据库中类型类型 : varchar2 数据库中类型长度 : 31
	 * 注释: 身份证号或其他证件号码

	 */
	private String idCardNo;
	/**
	 * 中文注释: 证件类型 约束 : 数据库中字段名 : id_card_type 数据库中类型类型 : varchar2 数据库中类型长度 : 2
	 * 注释:
	 */
	private String idCardType;
	/**
	 * 中文注释: 头像 约束 : 数据库中字段名 : head_picture 数据库中类型类型 : bigint 数据库中类型长度 : 注释:
	 * 为图片表的主键
	 */
	private String headPicture;
	/**
	 * 中文注释: 公司ID 约束 : 数据库中字段名 : commpany_id 数据库中类型类型 : bigint 数据库中类型长度 : 注释: 待议
	 */
	private Long commpanyId;
	/**
	 * 中文注释: 姓 约束 : 数据库中字段名 : last_name 数据库中类型类型 : varchar2 数据库中类型长度 : 63 注释:
	 */
	private String lastName;
	/**
	 * 中文注释: 名 约束 : 数据库中字段名 : first_name 数据库中类型类型 : bigint 数据库中类型长度 : 63 注释:
	 */
	private String firstName;
	/**
	 * 中文注释:星座 约束 : 数据库中字段名 : constellation 数据库中类型类型 : varchar2 数据库中类型长度 : 2 注释:
	 */
	private String constellation;
	/**
	 * 中文注释: 血型 约束 : 数据库中字段名 : blood 数据库中类型类型 : blood 数据库中类型长度 : 2 注释:
	 */
	private String blood;
	/**
	 * 中文注释: 生日 约束 : 数据库中字段名 : birth_date 数据库中类型类型 : datetime 数据库中类型长度 : 注释:
	 */
	private Date birthDate;
	/**
	 * 中文注释: 唯一标示 约束 : 数据库中字段名 : uuid 数据库中类型类型 : varchar2 数据库中类型长度 :31 注释:
	 */
	private String uuid;
	// Constructors

	/**
	 * 标签范围 0:全部1企业2白领
	 */
	private String lableType;
	/**
	 * 中文注释: 角色 约束 : 数据库中字段名 : role 数据库中类型类型 : varchar2 数据库中类型长度 :2 注释:
	 */
	private String role;

	private String account;

	private String realName;

	private String shandCardNo;
	private Date registerTime;

	private String city;
	private String workAddress;
	private String companyName;

	private String activeValue;

	private String webUrl;
	private String info;


	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getWorkAddress() {
		return workAddress;
	}

	public void setWorkAddress(String workAddress) {
		this.workAddress = workAddress;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getActiveValue() {
		return activeValue;
	}

	public void setActiveValue(String activeValue) {
		this.activeValue = activeValue;
	}

	public String getWebUrl() {
		return webUrl;
	}

	public void setWebUrl(String webUrl) {
		this.webUrl = webUrl;
	}

	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}

	public String getSincerityValue() {
		return sincerityValue;
	}

	public void setSincerityValue(String sincerityValue) {
		this.sincerityValue = sincerityValue;
	}

	private String sincerityValue;

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String nickName, String password, String isVerify) {
		this.nickName = nickName;
		this.password = password;
		this.isVerify = isVerify;
	}

	public User(String nickName, String password, String phone, String isVerify) {
		super();
		this.nickName = nickName;
		this.password = password;
		this.phone = phone;
		this.isVerify = isVerify;
	}

	/** full constructor */
	public User(String nickName, String password, String phone,
			String isVerify, String email, String sex, String lastLoginIp,
			Date lastLoginTime, String idCardNo, String idCardType,
			String headPicture, Long commpanyId, String lastName,
			String firstName, String constellation, String blood,
			Date birthDate, String account, String realName) {
		this.nickName = nickName;
		this.password = password;
		this.phone = phone;
		this.isVerify = isVerify;
		this.email = email;
		this.sex = sex;
		this.lastLoginIp = lastLoginIp;
		this.lastLoginTime = lastLoginTime;
		this.idCardNo = idCardNo;
		this.idCardType = idCardType;
		this.headPicture = headPicture;
		this.commpanyId = commpanyId;
		this.lastName = lastName;
		this.firstName = firstName;
		this.constellation = constellation;
		this.blood = blood;
		this.birthDate = birthDate;
		this.realName = realName;
	}

	// Property accessors

	public Long getUserId() {
		return this.userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getNickName() {
		return this.nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIsVerify() {
		return this.isVerify;
	}

	public void setIsVerify(String isVerify) {
		this.isVerify = isVerify;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getLastLoginIp() {
		return this.lastLoginIp;
	}

	public void setLastLoginIp(String lastLoginIp) {
		this.lastLoginIp = lastLoginIp;
	}

	public Date getLastLoginTime() {
		return this.lastLoginTime;
	}

	public void setLastLoginTime(Date lastLoginTime) {
		this.lastLoginTime = lastLoginTime;
	}

	public String getIdCardNo() {
		return this.idCardNo;
	}

	public void setIdCardNo(String idCardNo) {
		this.idCardNo = idCardNo;
	}

	public String getIdCardType() {
		return this.idCardType;
	}

	public void setIdCardType(String idCardType) {
		this.idCardType = idCardType;
	}

	public String getHeadPicture() {
		return this.headPicture;
	}

	public void setHeadPicture(String headPicture) {
		this.headPicture = headPicture;
	}

	public Long getCommpanyId() {
		return this.commpanyId;
	}

	public void setCommpanyId(Long commpanyId) {
		this.commpanyId = commpanyId;
	}

	public String getLastName() {
		return this.lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return this.firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getConstellation() {
		return this.constellation;
	}

	public void setConstellation(String constellation) {
		this.constellation = constellation;
	}

	public String getBlood() {
		return this.blood;
	}

	public void setBlood(String blood) {
		this.blood = blood;
	}

	public String getBirthDate() {
		SimpleDateFormat fmtshort = new SimpleDateFormat("yyyy-MM-dd");

		if (this.birthDate != null) {
			return fmtshort.format(this.birthDate);
		}
		return "";
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result
				+ ((birthDate == null) ? 0 : birthDate.hashCode());
		result = prime * result + ((blood == null) ? 0 : blood.hashCode());
		result = prime * result
				+ ((commpanyId == null) ? 0 : commpanyId.hashCode());
		result = prime * result
				+ ((constellation == null) ? 0 : constellation.hashCode());
		result = prime * result + ((email == null) ? 0 : email.hashCode());
		result = prime * result
				+ ((firstName == null) ? 0 : firstName.hashCode());
		result = prime * result
				+ ((headPicture == null) ? 0 : headPicture.hashCode());
		result = prime * result
				+ ((idCardNo == null) ? 0 : idCardNo.hashCode());
		result = prime * result
				+ ((idCardType == null) ? 0 : idCardType.hashCode());
		result = prime * result
				+ ((isVerify == null) ? 0 : isVerify.hashCode());
		result = prime * result
				+ ((lastLoginIp == null) ? 0 : lastLoginIp.hashCode());
		result = prime * result
				+ ((lastLoginTime == null) ? 0 : lastLoginTime.hashCode());
		result = prime * result
				+ ((lastName == null) ? 0 : lastName.hashCode());
		result = prime * result
				+ ((nickName == null) ? 0 : nickName.hashCode());
		result = prime * result
				+ ((password == null) ? 0 : password.hashCode());
		result = prime * result + ((phone == null) ? 0 : phone.hashCode());
		result = prime * result + ((sex == null) ? 0 : sex.hashCode());
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		result = prime * result + ((uuid == null) ? 0 : uuid.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (birthDate == null) {
			if (other.birthDate != null)
				return false;
		} else if (!birthDate.equals(other.birthDate))
			return false;
		if (blood == null) {
			if (other.blood != null)
				return false;
		} else if (!blood.equals(other.blood))
			return false;
		if (commpanyId == null) {
			if (other.commpanyId != null)
				return false;
		} else if (!commpanyId.equals(other.commpanyId))
			return false;
		if (constellation == null) {
			if (other.constellation != null)
				return false;
		} else if (!constellation.equals(other.constellation))
			return false;
		if (email == null) {
			if (other.email != null)
				return false;
		} else if (!email.equals(other.email))
			return false;
		if (firstName == null) {
			if (other.firstName != null)
				return false;
		} else if (!firstName.equals(other.firstName))
			return false;
		if (headPicture == null) {
			if (other.headPicture != null)
				return false;
		} else if (!headPicture.equals(other.headPicture))
			return false;
		if (idCardNo == null) {
			if (other.idCardNo != null)
				return false;
		} else if (!idCardNo.equals(other.idCardNo))
			return false;
		if (idCardType == null) {
			if (other.idCardType != null)
				return false;
		} else if (!idCardType.equals(other.idCardType))
			return false;
		if (isVerify == null) {
			if (other.isVerify != null)
				return false;
		} else if (!isVerify.equals(other.isVerify))
			return false;
		if (lastLoginIp == null) {
			if (other.lastLoginIp != null)
				return false;
		} else if (!lastLoginIp.equals(other.lastLoginIp))
			return false;
		if (lastLoginTime == null) {
			if (other.lastLoginTime != null)
				return false;
		} else if (!lastLoginTime.equals(other.lastLoginTime))
			return false;
		if (lastName == null) {
			if (other.lastName != null)
				return false;
		} else if (!lastName.equals(other.lastName))
			return false;
		if (nickName == null) {
			if (other.nickName != null)
				return false;
		} else if (!nickName.equals(other.nickName))
			return false;
		if (password == null) {
			if (other.password != null)
				return false;
		} else if (!password.equals(other.password))
			return false;
		if (phone == null) {
			if (other.phone != null)
				return false;
		} else if (!phone.equals(other.phone))
			return false;
		if (sex == null) {
			if (other.sex != null)
				return false;
		} else if (!sex.equals(other.sex))
			return false;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		if (uuid == null) {
			if (other.uuid != null)
				return false;
		} else if (!uuid.equals(other.uuid))
			return false;
		return true;
	}

	public String getLableType() {
		return lableType;
	}

	public void setLableType(String lableType) {
		this.lableType = lableType;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getAccount() {
		return account;
	}

	public void setAccount(String account) {
		this.account = account;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}
}