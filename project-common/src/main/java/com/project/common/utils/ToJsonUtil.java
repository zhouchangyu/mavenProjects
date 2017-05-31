package com.project.common.utils;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.xml.XMLSerializer;


/**
 * 
 * @author syl
 *
 */
public class ToJsonUtil {
	
	public final static String quote = "\"";
	
	private  static  SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	private static Map filter = new HashMap();
	
	private static Map<Class,String[]> filter4Class = new HashMap<Class,String[]>();
	
	
	public static void setDateFormat(SimpleDateFormat sdf){
		sdf = sdf;
	}
	public static Map<String, Object> getObject2Map(Object request) {
        Map<String, Object> params = new HashMap<>();
        if (request == null) {
            return params;
        }

        Field fields[] = request.getClass().getDeclaredFields();
        for (Field field : fields) {
            try {
                field.setAccessible(true);
                Object obj = field.get(request);
                params.put(field.getName(), obj);

            } catch (IllegalAccessException e) {
                e.printStackTrace();
            }
        }

        return params;
    }
	
	/**
	 * 字段名称过滤器，例如将所有seqId过滤成为id，从而拼出json
	 * @param o
	 * @param t
	 */
	public static void addFieldFilter(String o,String t){
		filter.put(o, t);
	}
	
	/**
	 * 字段名称过滤器，例如将指定类的seqId过滤成为id，从而拼出json
	 * addFieldFilter(Student.class,new String[]{"seqId","id"})
	 * @param clazz
	 * @param mapping
	 */
	public static void addFieldFilter(Class clazz,String[] mapping){
		filter4Class.put(clazz, mapping);
	}
	
	public static String mapToJson(Map map){
		JSONObject jsonObject = JSONObject.fromObject(map);
		return jsonObject.toString();
	}
	
	/**
	 * 从JSON字符串转换成json数组
	 * @param json
	 * @param clazz
	 * @return
	 */
	public static Object toArray(String json,Class clazz){
		JSONArray jsonArray = JSONArray.fromObject(json);
		return JSONArray.toArray(jsonArray, clazz);
	}
	
	/**
	 * 从JSON字符串转换成json数组
	 * @param json
	 * @param clazz
	 * @return
	 */
	public static Object toArray(String json){
		JSONArray jsonArray = JSONArray.fromObject(json);
		return JSONArray.toArray(jsonArray);
	}
	
	/**
	 * 从JSON字符串转换成json数组
	 * @param json
	 * @param clazz
	 * @return
	 */
	public static List toList(String json){
		JSONArray jsonArray = JSONArray.fromObject(json);
		return JSONArray.toList(jsonArray);
	}
	
	/**
	 * 从JSON字符串转换成json对象
	 * @param json
	 * @param clazz
	 * @return
	 */
	public static Object toObject(String json,Class clazz){
		JSONObject jsonObject = JSONObject.fromObject(json);
		return JSONObject.toBean(jsonObject, clazz);
	}

	/**
	 * 将List对象转换为Json数组
	 * @param list
	 * @return
	 */
//	public static String toJson(List<?> list){
//		StringBuffer tmp = new StringBuffer();
//		tmp.append("[");
//		boolean hasExist = false;
//		for(Object o:list){
//			hasExist = true;
//			if(o instanceof Integer
//					|| o instanceof Long
//					|| o instanceof Short
//					|| o instanceof Double
//					|| o instanceof Float
//					|| o instanceof Byte){
//				
//				tmp.append(o+",");
//				
//			}else if(o instanceof String || o instanceof Character){
//				tmp.append(quote+o+quote+",");
//			}else{
//				tmp.append(toJson(o)+",");
//			}
//		}
//		if(hasExist){
//			tmp.deleteCharAt(tmp.length()-1);
//		}
//		tmp.append("]");
//		return tmp.toString();
//	}
	
	/**
	 * 将Map、实体类对象     转换为Json数组
	 * @param list
	 * @return
	 */
	public static String toJson(Object obj){
		if(obj instanceof List){
			JSONArray jsonArray = JSONArray.fromObject(obj);
			return jsonArray.toString();
		}else{
			JSONObject jsonObject = JSONObject.fromObject(obj);
			return jsonObject.toString();
		}
		
	}
	
	
	 
	 
	
	 
	

	
	/**
	 * 对象转Json(包括Map、List 、String、数组等)
	 * @param obj : 实体对象
	 * @return
	 */
	public static JSONObject  obj2Json(Object obj){
		if(obj == null){
			new Object();
		}
		JSONObject jsonObject = JSONObject.fromObject( obj );       
		return jsonObject;
	}
 
	
	/**
	 * json对象转XMl字符串
	 * @param jsonObj : json对象
	 * @return
	 */
	public static String json2Xml(JSONObject jsonObj){
		XMLSerializer xmlS = new XMLSerializer();
		String xmlStr = xmlS.write(jsonObj);
		return xmlStr ;
	}
	
	
	 
	/**
	 * xml转json数组
	 * @param xml
	 * @return
	 */
	public static JSONArray xml2JsonArray(String xml){
		XMLSerializer xmlS = new XMLSerializer();
		JSONArray jsonArray = (JSONArray) xmlS.read( xml ); 
        return jsonArray;
	}
	
 
    
    /**
     * json字符串转换为对象 数组
     * @param jsonStr
     * @return
     */
    public static  List JsonStr2ObjectList( String jsonStr ,Class clazz) 
    { 
    	List mapList = new ArrayList();
    	if(jsonStr==null || "".equals(jsonStr)){
    		return mapList;
    	}
    	JSONArray jsonArray = JSONArray.fromObject(jsonStr);
    	Iterator iterator = jsonArray.iterator();
    	JSONObject obj =null;
    	while(iterator.hasNext()){
    		obj = (JSONObject) iterator.next(); 
    		mapList.add(JSONObject.toBean(obj, clazz));
    	}
    	obj = null;
        return mapList; 
    } 
    
   
 
    /** 
     * 将javaBean转换成Map 
     * 
     * @param javaBean javaBean 
     * @return Map对象 
     */ 
    public static Map<String, String> bean2Map(Object javaBean) 
    { 
        Map<String, String> result = new HashMap<String, String>(); 
        Method[] methods = javaBean.getClass().getDeclaredMethods(); 

        for (Method method : methods) 
        { 
            try 
            { 
                if (method.getName().startsWith("get") ) 
                { 
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("get") + 3); 
                    field = field.toLowerCase().charAt(0) + field.substring(1); 

                    Object value = method.invoke(javaBean, (Object[])null); 
                    result.put(field, null == value ? "" : value.toString()); 
                } else if(  method.getName().startsWith("is")) { 
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("is") + 2); 
                    field = field.toLowerCase().charAt(0) + field.substring(1); 

                    Object value = method.invoke(javaBean, (Object[])null); 
                    result.put(field, null == value ? "" : value.toString()); 
                }
            } 
            catch (Exception e) 
            { 
            } 
        } 

        return result; 
    } 
    

    /** 
     * 将javaBean转换成Map<object> 原生
     * 
     * @param javaBean javaBean 
     * @return Map对象 
     */ 
    public static Map<String, Object> bean2ProtogenesisMap(Object javaBean) 
    { 
        Map<String, Object> result = new HashMap<String, Object>(); 
        Method[] methods = javaBean.getClass().getDeclaredMethods(); 

        for (Method method : methods) 
        { 
            try 
            { 
                if (method.getName().startsWith("get") ) 
                { 
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("get") + 3); 
                    field = field.toLowerCase().charAt(0) + field.substring(1); 

                    Object value = method.invoke(javaBean, (Object[])null); 
                    result.put(field,   value); 
                } else if(  method.getName().startsWith("is")) { 
                    String field = method.getName(); 
                    field = field.substring(field.indexOf("is") + 2); 
                    field = field.toLowerCase().charAt(0) + field.substring(1); 

                    Object value = method.invoke(javaBean, (Object[])null); 
                    result.put(field,  value); 
                }
            } 
            catch (Exception e) 
            { 
            } 
        } 

        return result; 
    } 


     


 
	
	public static void main(String[] args) throws Exception{ 
		ToJsonUtil tju = new ToJsonUtil();
		/*String jsonStr = "{\"vore\": \"\n222\"}";
		JSONObject obj = TeeJsonUtil.jsonString2Json(jsonStr);
		System.out.println(obj);*/
		/*
		TeePersonModel model = new TeePersonModel();
		//model.setUuid(1);
		System.out.println();
		Map map = new HashMap();
		map.put("userName", "admin");
		map.put("uuid", "1");
		map.put("birthday", "2014-09-12");
		model = (TeePersonModel)convertMap2Bean(model, model.getClass(), map );
		System.out.println(model.getUserName() +":"+ model.getUuid()+":"+ model.getBirthday());
*/		/*TeeUserRoleModel m = new TeeUserRoleModel();
		m.setRoleNo(1);
		Map map = new HashMap();
		map.put("roleName", "admin");
		map.put("uuid","1");
		
		//m.setLastPassTime(lastPassTime);
	
		m = (TeeUserRoleModel)convertMap2Bean(m, m.getClass(), map);
		System.out.println(m.getRoleNo() +":"+ m.getRoleName() +":"+ m.getUuid());
	*/
		/*TeePersonModel model = new TeePersonModel();
		model.setUserName("aaa");
		model.setUserId("bbbb");;
		model.setUserNo(2);
		String ss = getValueByKey(model.getClass().getDeclaredField("userName"), model.getClass().getMethod("getUserName"), model, TeePersonModel.class);
		String ss2 = getValueByKey(model.getClass().getDeclaredField("userNo"), model.getClass().getMethod("getUserNo"), model, TeePersonModel.class);
		
		System.out.println(ss);
		System.out.println(ss2);*/
		//tju.JsonStr2ObjectList(jsonStr, clazz)
//		TeeJsonUtil tju = new TeeJsonUtil();
//		Map a = new HashMap();
//		a.put("wocao", 1);
//		System.out.println(toJson(a));
     } 
	
	
	
 
	
}

