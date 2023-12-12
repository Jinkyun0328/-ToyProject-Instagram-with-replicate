package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.StaffDAO;
import com.smhrd.model.StaffVO;

public class DeleteDesignerService implements Command {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		Double staff_seq = Double.parseDouble(request.getParameter("staff_seq"));
		System.out.println(staff_seq);
		
		StaffVO vo = new StaffVO();
		vo.setStaffSeq(staff_seq);
		StaffDAO stdao = new StaffDAO();
		int row = stdao.deleteStaff(vo);
		
		if(row>0) {
			System.out.println("디자이너 삭제 성공");
		}else {
			System.out.println("디자이너 삭제 실패");
		}
		
		return null;
	}

}
