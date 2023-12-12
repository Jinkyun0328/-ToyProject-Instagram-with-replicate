package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.ShopDAO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class ShopPageService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String mem_id = request.getParameter("mem_id");
		System.out.println(mem_id);
		
		
		
		// ShopDAO를 통해 가게 정보를 가져옴
        ShopVO vo = new ShopVO();
        vo.setMemId(mem_id);
        ShopDAO shopDAO = new ShopDAO();
        ShopVO shopInfo = shopDAO.getShopInfo(vo);

        if (shopInfo != null) {
        	session.setAttribute("shopInfo", shopInfo);
			System.out.println("가게 정보 가져오기 성공");
			System.out.println(shopInfo.getShopName());
			System.out.println(shopInfo.getShopSeq());
		} else {
			System.out.println("가게 정보 가져오기 실패");

		}
        
        // StaffDAO를 통해 스태프 정보를 가져옴
        Double shopSeq =  shopInfo.getShopSeq();
        StaffVO stfvo = new StaffVO();
        stfvo.setShopSeq(shopSeq);
        StaffDAO staffDAO = new StaffDAO();
        List<StaffVO> staffList = staffDAO.getStaffList(stfvo);
        System.out.println(staffList);
        session.setAttribute("staffList", staffList);
        for (StaffVO staff : staffList) {
        	System.out.println(staff.getStaffSeq());
        }
        // shopmanagement.jsp로 포워드
        return "redirect:/GoshopPage.do";
	}

}
