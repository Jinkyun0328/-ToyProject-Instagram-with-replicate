package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.smhrd.model.DAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.ReservDAO;
import com.smhrd.model.ReservVO;

public class SelectReservService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("SelectReservService진입완료");
		String receive_memId = request.getParameter("receive_memId");

		ReservVO vo = new ReservVO();
		vo.setMem_id(receive_memId);

		ReservDAO reservList = new ReservDAO();

		List<ReservVO> result = reservList.SelectReserv(receive_memId);

		for (ReservVO value : result) {
			System.out.println(value); 
		}

		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		String jsonResult = gson.toJson(result);
		out.print(jsonResult);

		return null; 
	}
}
