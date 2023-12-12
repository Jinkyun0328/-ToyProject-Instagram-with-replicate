package com.smhrd.frontcontroller;

import java.io.IOException;

import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.controller.Command;

@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	// key - value 형식으로 데이터를 저장
	// key >> 고유의 값(중복 허용 X)
	// value >> 중복 허용함
	// 순서가 없고 key값으로 데이터를 구분
	private HashMap<String, Command> map = null;
	
	public void init(ServletConfig config) throws ServletException{
		// Servlet 이 실행되는 순간 url- Command map에 추가
		map = new HashMap<String, Command>();
	}
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// FC 역할
		// --> 모든 요청을 다 처리하는 Servlet
		
		request.setCharacterEncoding("UTF-8");
		
		// 1. 요정 url 구분하기
		// 1-1) url 가져오기
		String uri = request.getRequestURI();
		// /web/Login.do
		
		// 1-2) cp 가져오기
		String cp = request.getContextPath();
		// /web
		
		// 1-3) 최종 요청 url을 잘라내기
		String finaluri = uri.substring(cp.length()+1);
		
		// 최종적으로 이동해야하는 url을 담는 공간
		String path = null;
		Command com = null;
		

		// 2. 최종 요청 uri에 따라서 각각 일반 클래스 파일을 호출!
		
		
		if(finaluri.contains("Go")) {
			// Go + 파일명 + .do
			// --> 파일명만 추출해서 path값 만들기
			
			// path = "main.jsp";
			path = finaluri.substring(2).replaceAll(".do", "");
	
		}else {
			com = map.get(finaluri);
			path = com.execute(request, response);
		}

		if(path == null) {
			// ajax를 위한 비동기통신에서 페이지 이동을 하지 않기 위한 코드
		}
		else if(path.contains("redirect:/")) {
			response.sendRedirect(path.substring(10));
		}else {
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/"+path + ".jsp");
			rd.forward(request, response);
		}
	}

}
