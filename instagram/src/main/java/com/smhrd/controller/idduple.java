package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

@WebServlet("/idduple")
public class idduple extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.addHeader("Access-Control-Allow-Origin", "*");
	
		String id = request.getParameter("id");		
		// System.out.println("요청받은 데이터 >>" + id);

		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		MemberVO vo = new MemberVO();
		vo.setMemId(id);
		
		MemberDAO dao = new MemberDAO();
		
		MemberVO mvo = dao.selectId(vo);
	
		if(mvo != null) {
			out.print("false");
		}else {
			out.print("true");
		}
	}

}
