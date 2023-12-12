package com.smhrd.controller;

import java.io.IOException;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;


public class EmailCheckService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.addHeader("Access-Control-Allow-Origin", "*");

		String email = request.getParameter("mem_email");
		System.out.println("요청받은 데이터 >> " + email);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();

		MemberVO vo = new MemberVO();
		vo.setMemEmail(email);

		MemberDAO dao = new MemberDAO();

		MemberVO res = dao.emailCheck(vo);

		//if (res != null) {
		// 	// JSON형식으로 데이터를 돌려주자~~!!!
			// 1. 일일이 하나씩 문자열로 지정
		// 	out.print("{\"emailCheck\":\"true\"}");
		// }else {
		// 	out.print("{\"emailCheck\":\"false\"}");
		// }
		return null;
	}
}
