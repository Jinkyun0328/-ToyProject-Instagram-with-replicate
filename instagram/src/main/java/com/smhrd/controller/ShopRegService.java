package com.smhrd.controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO;
import com.smhrd.model.MemberVO;
import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;

// 일반 클래스로 만들어줌 --> POJO(Plain Old Java Object)
public class ShopRegService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
        String mem_id = ((MemberVO) session.getAttribute("result")).getMemId();
        String mem_type = ((MemberVO) session.getAttribute("result")).getMemType();
        mem_type = "s";
        ((MemberVO) session.getAttribute("result")).setMemType(mem_type);
		
		//String mem_id = request.getParameter("mem_id");
		String shop_name = request.getParameter("shop_name");
		String shop_tel = request.getParameter("shop_tel");
		String shop_addr1 = request.getParameter("shop_addr1");
		String shop_addr2 = request.getParameter("shop_addr2");
		String lat = request.getParameter("lat");
		String lng = request.getParameter("lng");
		String open_time = request.getParameter("open_time");
		String close_time = request.getParameter("close_time");
		
		System.out.println(mem_id);
		System.out.println(shop_name);
		System.out.println(shop_tel);
		System.out.println(shop_addr1);
		System.out.println(shop_addr2);
		System.out.println(lat);
		System.out.println(lng);
		System.out.println(open_time);
		System.out.println(close_time);
		System.out.println(mem_type);
		
		ShopVO vo = new ShopVO();
		vo.setShopName(shop_name);
		vo.setShopTel(shop_tel);
		vo.setShop_addr1(shop_addr1);
		vo.setShop_addr2(shop_addr2);
		vo.setLat(Double.parseDouble(lat));
		vo.setLng(Double.parseDouble(lng));
		vo.setOpenTime(open_time);
		vo.setCloseTime(close_time);
		vo.setMemId(mem_id);
		
		ShopDAO dao = new ShopDAO();
		
		int row = dao.shopReg(vo);

		if(row > 0) {
			System.out.println("shop 등록 성공");
		}else {
			System.out.println("shop 등록 실패");
		}
		
		MemberDAO mDao = new MemberDAO();
		int updateRow = mDao.update_state(mem_id);
		if(updateRow > 0) {
			
			System.out.println(mem_type);
			System.out.println("등급변경 성공");
		}else {
			System.out.println("등급변경 실패");
		}
		
		return "redirect:/Gomypage.do";
	}
}
