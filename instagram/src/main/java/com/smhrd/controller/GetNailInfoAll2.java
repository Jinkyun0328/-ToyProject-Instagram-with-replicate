package com.smhrd.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.smhrd.model.NailartDAO;
import com.smhrd.model.NailartVO;
import com.smhrd.model.ShopVO;
import com.smhrd.model.StaffVO;

public class GetNailInfoAll2 implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		System.out.println("getNailInfo2 >> 들어와짐");
		String data = request.getParameter("data");
		System.out.println("요청받은 데이터 >> " + data);

		double staff_seq = Double.parseDouble(data);
		System.out.println(staff_seq);
		StaffVO vo = new StaffVO();
		vo.setStaffSeq(staff_seq);

		// 1. staff_seq을 입력으로 하여 NailartVO의 nailart_seq, nailart_name, nailart_img,
		// nailart_seq, nailart_desc, staff_seq을 가져온다.
		NailartDAO nailartDAO = new NailartDAO();
		List<NailartVO> NailInfo = nailartDAO.getNailInfoAll(vo);

		System.out.println(NailInfo.size());
		for (NailartVO nail : NailInfo) {
			System.out.println("NailartImg: " + nail.getNailartImg());
		}

		JSONArray jsonArray = new JSONArray();
		for (NailartVO nail : NailInfo) {
			JSONObject jsonNail = new JSONObject();
			jsonNail.put("nailart_img", nail.getNailartImg());
			jsonNail.put("nailart_seq", nail.getNailartSeq());
			// 필요한 다른 속성들도 추가 가능

			jsonArray.add(jsonNail);
		}
		
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().print(jsonArray.toJSONString());
		
		// 생성된 JSON 데이터를 문자열로 변환하여 반환
		System.out.println(jsonArray.toJSONString());
		
		
		return null;
	}

}
