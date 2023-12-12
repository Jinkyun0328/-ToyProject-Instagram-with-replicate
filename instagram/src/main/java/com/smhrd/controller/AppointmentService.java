package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.AppointmentDAO;
import com.smhrd.model.AppointmentVO;
import com.smhrd.model.ServiceDAO;
import com.smhrd.model.ServiceVO;

public class AppointmentService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		 // 사용자로부터 받은 예약 정보를 가져옴
        Double staff_seq = Double.parseDouble(request.getParameter("staff_seq"));
        String selectedNailImg = request.getParameter("selectedNailImg");
        Double nailart_seq = Double.parseDouble(request.getParameter("selectedNailSeq"));
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String mem_id = request.getParameter("mem_id");
        
        System.out.println("staff_seq" + staff_seq);
        System.out.println("nailart_seq" + nailart_seq);
        System.out.println("선택된 이미지 이름 : " + selectedNailImg);
        System.out.println("날짜:" + date);
        System.out.println("시간:"+ time);
        System.out.println("mem_id" + mem_id);
        
        ServiceVO servo = new ServiceVO();
        servo.setStaffSeq(staff_seq);
        servo.setNailartSeq(nailart_seq);
        ServiceDAO serDao = new ServiceDAO();
        
        Double SVC_seq = serDao.getSVC_seq(servo);
        System.out.println("가져온 서비스 번호 : " + SVC_seq);
        
        
        
        AppointmentVO aptvo = new AppointmentVO();
        aptvo.setMemId(mem_id);
        aptvo.setServiceSeq(SVC_seq);
        
        
        String combinedDateString = date + " " + time + ":00"; // 초까지 표시하는 형식
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Timestamp appointedAt = null;

        try {
            appointedAt = Timestamp.valueOf(combinedDateString);
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            // 예외 처리: 날짜 변환에 실패한 경우
            System.out.println("날짜변환 실패");
        }
        System.out.println(appointedAt);
        aptvo.setAppointedAt(appointedAt);

        aptvo.setApproved('L');
        
        AppointmentDAO aptDao = new AppointmentDAO();
        int row = aptDao.insertAppointment(aptvo);
        
        if (row > 0) {
            System.out.println("예약 신청 성공!!!!");

            // 예약 성공 메시지를 JSON 형식으로 클라이언트에게 전송
            String successResponse = "{\"status\": \"success\", \"message\": \"예약 신청에 성공했습니다.\"}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(successResponse);
        } else {
            System.out.println("예약신청 실패 ㅠㅜㅜㅜㅜ");

            // 예약 실패 메시지를 JSON 형식으로 클라이언트에게 전송
            String failureResponse = "{\"status\": \"failure\", \"message\": \"예약 신청에 실패했습니다.\"}";
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(failureResponse);
        }        return null;
	}

}
