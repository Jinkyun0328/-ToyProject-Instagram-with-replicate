package com.smhrd.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;


public class getShopInfoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

        ShopDAO shopDAO = new ShopDAO();
        List<ShopVO> shopInfo = shopDAO.getShopInfoAll();
        
        JSONArray req_array = new JSONArray();
        for(int i = 0; i < shopInfo.size(); i++) {
            Object fieldObj = shopInfo.get(i);
            JSONObject obj = new JSONObject();
            for (Field field : fieldObj.getClass().getDeclaredFields()) {
    			field.setAccessible(true);
    			Object value = null;
    			try {
    				value = field.get(fieldObj);
    			} catch (IllegalArgumentException | IllegalAccessException e) {
    				// TODO Auto-generated catch block
    				e.printStackTrace();
    			}
    			// System.out.println("field : " + field.getName() + " | value : " + value);
                obj.put(field.getName(), value);
            }
            req_array.add(obj);
        }

        if (shopInfo.size() != 0) {
        	System.out.println("가게 정보 가져오기 성공");
        	out.print(req_array);
        	System.out.println(req_array);
		} else {
			System.out.println("가게 정보 가져오기 실패");
		}
		return null;
	}
}
