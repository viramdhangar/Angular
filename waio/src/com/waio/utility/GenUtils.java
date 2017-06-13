package com.waio.utility;

import java.io.IOException;

import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;

public class GenUtils {

	public static String getJsonFromJava(Object obj){
		ObjectMapper mapper = new ObjectMapper();
		String json = null;
		try{
			json = mapper.writeValueAsString(obj);
		}catch(JsonGenerationException e){
			e.printStackTrace();
		}catch(JsonMappingException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		return json;
	}
	public static Object getJavaFromJson(String json ,Class clazz) throws Exception{
		ObjectMapper mapper = new ObjectMapper();
		Object obj = null;
		try{
			obj = mapper.readValue(json, clazz);
		}catch(JsonGenerationException e){
			e.printStackTrace();
		}catch(JsonMappingException e){
			e.printStackTrace();
		}catch(IOException e){
			e.printStackTrace();
		}
		return obj;
	}
}
