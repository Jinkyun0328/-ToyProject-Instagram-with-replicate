package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;

public class LoginService implements Command {
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String mem_id = request.getParameter("mem_id");
		String mem_pw = request.getParameter("mem_pw");
//		 System.out.println(mem_id);
//		 System.out.println(mem_pw);

		MemberVO vo = new MemberVO();
		vo.setMemId(mem_id);
		vo.setMemPw(mem_pw);

		// System.out.println(vo.getMemId());
		// System.out.println(vo.getMemPw());

		MemberDAO dao = new MemberDAO();

		MemberVO mvo = dao.login(vo);
		if (mvo != null) {
			HttpSession session = request.getSession();
			session.setAttribute("result", mvo);
			System.out.println("로그인 성공");
			System.out.println(mvo.getMemId());
			return "redirect:/Gomain.do";
		} else {
			System.out.println("로그인 실패");
			return "redirect:/Gosign.do";
		}
	}
}