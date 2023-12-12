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

import com.smhrd.controller.AddDesignerService;
import com.smhrd.controller.AppointmentService;
import com.smhrd.controller.Command;
import com.smhrd.controller.DeleteDesignerService;
import com.smhrd.controller.EmailCheckService;
import com.smhrd.controller.GetNailInfoAll2;
import com.smhrd.controller.JoinService;
import com.smhrd.controller.LoginService;
import com.smhrd.controller.LogoutService;
import com.smhrd.controller.SelectAllService;
import com.smhrd.controller.SelectReservService;
import com.smhrd.controller.ShopManagementService;
import com.smhrd.controller.ShopPageService;
import com.smhrd.controller.ShopRegService;
import com.smhrd.controller.ShopSelectAllService;
import com.smhrd.controller.UpdateService;
import com.smhrd.controller.getNailInfoAll;
import com.smhrd.controller.getShopInfo;
import com.smhrd.controller.getShopInfoAll;
import com.smhrd.controller.getStaffInfoAll;
import com.smhrd.controller.updateShopImg;

/**
 * Servlet implementation class FrontController
 */
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
		map.put("Join.do", new JoinService());
		map.put("Login.do", new LoginService());
		map.put("Logout.do", new LogoutService());
		map.put("SelectAll.do", new SelectAllService());
		map.put("Update.do", new UpdateService());
		map.put("EmailCheck.do", new EmailCheckService());
		map.put("ShopManagement.do", new ShopManagementService());
		map.put("getShopInfoAll.do", new getShopInfoAll());
		map.put("getShopInfo.do", new getShopInfo());
		map.put("getStaffInfoAll.do", new getStaffInfoAll());
		map.put("getNailInfoAll.do", new getNailInfoAll());
		map.put("AddDesigner.do", new AddDesignerService());
		map.put("DeleteDesigner.do", new DeleteDesignerService());
		map.put("ShopPage.do", new ShopPageService());
		map.put("ShopSelectAll.do", new ShopSelectAllService());
		map.put("GetNailInfoAll2.do", new GetNailInfoAll2());
		map.put("Appointment.do", new AppointmentService());
		map.put("SelectReserv.do", new SelectReservService());
		map.put("ShopReg.do", new ShopRegService());
		map.put("updateShopImg.do", new updateShopImg());
		// service 메소드 안쪽의 코들ㄹ 고칠 필요가 없다.

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
