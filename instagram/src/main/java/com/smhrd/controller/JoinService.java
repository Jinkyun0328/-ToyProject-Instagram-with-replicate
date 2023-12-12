package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

// 일반 클래스로 만들어줌 --> POJO(Plain Old Java Object)
public class JoinService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
		String mem_name = request.getParameter("mem_name");
		String mem_phone = request.getParameter("mem_phone");
		String mem_email = request.getParameter("mem_email");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		
		System.out.println(mem_id);
		System.out.println(mem_pw);
		System.out.println(mem_name);
		System.out.println(mem_phone);
		System.out.println(mem_email);
		System.out.println(mem_addr1);
		System.out.println(mem_addr2);
		
		MemberVO vo = new MemberVO();
		vo.setMemId(mem_id);
		vo.setMemPw(mem_pw);
		vo.setMemName(mem_name);
		vo.setMemPhone(mem_phone);
		vo.setMemEmail(mem_email);
		vo.setMemAddr1(mem_addr1);
		vo.setMemAddr2(mem_addr2);
		vo.setMemType("c");
		
		MemberDAO dao = new MemberDAO();
		
		int row = dao.join(vo);

		if(row > 0) {
			request.setAttribute("member", vo);
			System.out.println("회원가입 성공");
		}else {
			// redirect:/ >> 약속 기호!!
			// redirect방식으로 이동해라!!를 FC에게 알려주는 역할
			System.out.println("회원가입 실패");
		}
		return "redirect:/Gomain.do";
	}
}
