package com.chj.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.chj.entity.Circle;




public interface CircleManager {
	
	
    public Object circleListCount(HashMap<String, Object> circleList);
	
	public Object findCircleListCount(HashMap<String, Object> circleList);

	public List<Object> findCircleList(Map<String, Object> map);//圈子列表

	public void selectedCirle(List<Long> idList);

	public Long seveCircle(Circle cle,String circleCardImage,String imgChanged);

	public Object closeCircle(Circle cir);

	public Long updateCirleInfo(Circle circle, String circleTag);

	public Object findUserCount(Object circleId);

	public Object findThemeCount(Object circleId);

	public int updateBoHuiCircle(Circle cil);

	public Object updateCle(long parseLong);

	public List<Map> findUpdateCTag(long circleId);

	public Object findCircleUserList(HashMap<String, Object> userC);

	public Object findCircleUserListCount(long circleId);

	public int delCircleUserInfo(HashMap<String, Object> delCU);

	public Object findallelCircleList(HashMap<String, Object> circleList);

	public Object findallelCircleListCount(HashMap<String, Object> circleList);

	public Integer updateCircleStatus(HashMap map);

	public Integer updateCircleExamine(HashMap map);

	public Circle findCircleDetail(String circleId);

	public Object findCircleTagList(String circleId);

	public List<String> findCircleUserCardImage(Long valueOf);

	public Object findCirUserListCount(HashMap<String, Object> userC);

	public Object updatetbUserDStatus(String userId, String circleId,
			String Value);

	public String updatetbUserDRoles(String userId, String circleId,
			String status);

	public String updatetbUserDFlag(String userId, String circleId,
			String status);
 
	public String updaCircleLstop(String circleId, String filName,
			Integer filValue, Integer filnum);
 
	public Object findCircleLevelList();

	public void updCircleLevel(Integer levelId, Integer userNum,
			String levelInfo);

	public Object findCircleAddLevel(HashMap map);

	public void reqCircleLevel(HashMap<String, Object> map);
 

}
