package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffVO;

public class ShopSelectAllService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("진입완료");
		ShopDAO dao = new ShopDAO();
		List<ShopVO> shopList = dao.shopSelectAll();
		System.out.println(shopList);
		
		HttpSession session = request.getSession();
		session.setAttribute("shopList", shopList);
		for (ShopVO shop : shopList) {
		    if (shop != null && shop.getShopName() != null) {
		        System.out.println(shop.getShopName());
		    } else {
		        System.out.println("ShopVO or shopName is null.");
		    }
		}

		

		return "redirect:/Goshop.do";
	}

}
