package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class AddDesignerService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 추가할 디자이너 이름
		String staff_name = request.getParameter("designerName");
		System.out.println(staff_name);
		// 세션에 저장되어있는 로그인 아이디
		HttpSession session = request.getSession();
		String mem_id = ((MemberVO) session.getAttribute("result")).getMemId();
		System.out.println(mem_id);
		// 세션에 저장되어있는 가게 아이디
		Double shop_seq = ((ShopVO) session.getAttribute("shopInfo")).getShopSeq();
		System.out.println(shop_seq);
		StaffVO vo = new StaffVO();
		vo.setShopSeq(shop_seq);
		vo.setMemId(mem_id);
		vo.setStaffName(staff_name);
		
		
		StaffDAO stdao = new StaffDAO();
		int row = stdao.addStaff(vo);
		
		if(row > 0) {
			System.out.println("디자이너 추가 성공");
		}else {
			System.out.println("디자이너 추가 실패");
		}
		

		return null;
	}

}
