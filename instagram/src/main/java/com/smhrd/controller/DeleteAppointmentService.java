package com.smhrd.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.AppointmentDAO;
import com.smhrd.model.AppointmentVO;

public class DeleteAppointmentService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mem_id = request.getParameter("mem_id");
		String appointed_at = request.getParameter("appointed_at");
		appointed_at = appointed_at.substring(0, appointed_at.length() - 1);
		System.out.println("예약삭제 데이터 확인 >> " + mem_id);
		System.out.println("예약삭제 데이터 확인 >> " + appointed_at);
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS");
			Date parsedDate = dateFormat.parse(appointed_at);
			Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());

			System.out.println("Converted Timestamp: " + timestamp);
			AppointmentVO aptvo = new AppointmentVO();
			aptvo.setMemId(mem_id);
			aptvo.setAppointedAt(timestamp);
			
			AppointmentDAO aptdao = new AppointmentDAO();
			int row = aptdao.deleteAppointment(aptvo);
			
			if(row>0) {
				System.out.println("예약 삭제 성공");
			}else {
				System.out.println("예약 삭제 실패");
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
