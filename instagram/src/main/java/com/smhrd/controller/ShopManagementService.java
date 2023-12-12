package com.smhrd.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.smhrd.model.AppointmentDAO;
import com.smhrd.model.AppointmentVO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.ServiceDAO;
import com.smhrd.model.ServiceVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class ShopManagementService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 세션에서 로그인한 사용자의 ID를 가져옴
        HttpSession session = request.getSession();
        String mem_id = ((MemberVO) session.getAttribute("result")).getMemId();
        
        System.out.println("로그인 세션 확인: " + mem_id);
       
        
        

        // ShopDAO를 통해 가게 정보를 가져옴
        ShopVO vo = new ShopVO();
        vo.setMemId(mem_id);
        ShopDAO shopDAO = new ShopDAO();
        ShopVO shopInfo = shopDAO.getShopInfo(vo);

        if (shopInfo != null) {
        	session.setAttribute("shopInfo", shopInfo);
			System.out.println("가게 정보 가져오기 성공");
			System.out.println(shopInfo.getShopName());
			System.out.println(shopInfo.getShopSeq());
		} else {
			System.out.println("가게 정보 가져오기 실패");

		}
        
        // StaffDAO를 통해 스태프 정보를 가져옴
        Double shopSeq =  shopInfo.getShopSeq();
        StaffVO stfvo = new StaffVO();
        stfvo.setShopSeq(shopSeq);
        StaffDAO staffDAO = new StaffDAO();
        List<StaffVO> staffList = staffDAO.getStaffList(stfvo);
        System.out.println(staffList);
        session.setAttribute("staffList", staffList);
        
        ArrayList<Object> list1 = new ArrayList<Object>();
    	ArrayList<Object> list2 = new ArrayList<Object>();
    	List<JSONObject> jsonList2 = new ArrayList<>();
        for (StaffVO staff : staffList) {
        	System.out.println(staff.getStaffSeq());
        	System.out.println(staff.getStaffName());
        	
//        	디자이너 이름들 불러온다. 디자이너들은 staff_seq가 있다.
//
//        	디자이너별로 디자인에 대한 nail_seq가 있다.
//
//        	service_info에서 디자이너의 staff_seq조건으로 모든 SVC_SEQ를 가져온다.
//        	--> SVC_SEQ는 여러개
//
//        	appointment_info에서 SVC_SEQ조건으로 정보를 가져온다.
//        	정보 : 예약날짜, 시간
        	
        	ServiceVO servo = new ServiceVO();
            servo.setStaffSeq(staff.getStaffSeq());
            
            ServiceDAO serDao = new ServiceDAO();
            
            List<Double> SVC_seqList = serDao.getSVC_seq2(servo);
            System.out.println("가져온 서비스 번호 리스트 : " + SVC_seqList);
            
            for (Double SVC_seq : SVC_seqList) {
            	System.out.println(SVC_seq);
            }
            
            AppointmentDAO aptDao = new AppointmentDAO();
            List<AppointmentVO> AppointmentList = aptDao.getAppointmentBySVC_seqList(SVC_seqList);
            
            for (AppointmentVO Appointment : AppointmentList) {
            	System.out.println("스태프 시퀀스 : " + staff.getStaffSeq());
            	System.out.println("예약자 아이디 : " + Appointment.getMemId());
            	System.out.println("예약 날짜&시간" + Appointment.getAppointedAt());
            	
            	list1 = new ArrayList<>();
            	list1.add(staff.getStaffSeq());
            	list1.add(Appointment.getMemId());
            	list1.add(Appointment.getAppointedAt());
            	list2.add(list1);
            	
            	JSONObject jsonItem = new JSONObject();
                jsonItem.put("staffSeq", staff.getStaffSeq());
                jsonItem.put("memId", Appointment.getMemId());
                jsonItem.put("appointedAt", Appointment.getAppointedAt());
                
                jsonList2.add(jsonItem);
            }
        }
//        for(Object list : list2) {
//        	System.out.println(list);
//        }
        
        //String jsonString = JSONArray.toJSONString(jsonList2);
        //session.setAttribute("AppointmentList", jsonString);
        
        session.setAttribute("AppointmentList", list2);
        
        
        //session.setAttribute("AppointmentList", jsonList2);
        
        
        
        // shopmanagement.jsp로 포워드
        return "redirect:/GoshopManagement.do";
	}

}