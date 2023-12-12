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
import com.smhrd.model.NailartDAO;
import com.smhrd.model.NailartVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.lang.reflect.Field;


public class getNailInfoAll implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("getNailInfoAll에 요청이 들어옴");
		response.addHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		String data = request.getParameter("data");
		System.out.println("요청받은 데이터 >> " + data);
		double staff_seq = Integer.parseInt(data.substring(12));
		System.out.println(staff_seq);
		
		StaffVO vo = new StaffVO();
		vo.setStaffSeq(staff_seq);
		
		// 1. staff_seq을 입력으로 하여 NailartVO의 nailart_seq, nailart_name, nailart_img, nailart_seq, nailart_desc, staff_seq을 가져온다. 
		NailartDAO nailartDAO = new NailartDAO();
		List<NailartVO> NailInfo = nailartDAO.getNailInfoAll(vo);
		
		// 네일아트 데이터 DB에 저장하고 실행하기

		System.out.println(NailInfo.size());
        
        JSONArray req_array = new JSONArray();
        for(int i = 0; i < NailInfo.size(); i++) {
            Object fieldObj = NailInfo.get(i);
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
    			System.out.println("field : " + field.getName() + " | value : " + value);
                obj.put(field.getName(), value);
            }
            req_array.add(obj);
        }

        if (NailInfo.size() != 0) {
        	System.out.println("네일 정보 가져오기 성공");
        	// out.print("{\"name\":\"김운비\" , \"age\":\"20\"}");
        	out.print(req_array);
		} else {
			System.out.println("직원 정보 가져오기 실패");
		}
		return null;
	}
}
