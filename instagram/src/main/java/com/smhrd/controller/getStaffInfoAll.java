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
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;


public class getStaffInfoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("getStaffInfoAll");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		String data = request.getParameter("data");
		System.out.println("요청받은 데이터 >> " + data);
		double shop_seq = Integer.parseInt(data.substring(11));
		System.out.println(shop_seq);
			
		ShopVO vo = new ShopVO();
		vo.setShopSeq(shop_seq);
		
		StaffDAO staffDAO = new StaffDAO();
		List<StaffVO> staffInfo = staffDAO.getStaffInfoAll(vo);
  
        JSONArray req_array = new JSONArray();
        for(int i = 0; i < staffInfo.size(); i++) {
            Object fieldObj = staffInfo.get(i);
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

        if (staffInfo.size() != 0) {
        	System.out.println("직원 정보 가져오기 성공");
        	System.out.println(req_array);
        	//out.print("테스트");
        	//out.print("{\"name\":\"김운비\"}");
        	out.print(req_array);
        	System.out.println("성공");
        	
		} else {
			System.out.println("직원 정보 가져오기 실패");
		}
		return null;
	}
}
