package com.smhrd.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class SelectAllService implements Command{
	public String execute(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


		// DAO dao = new DAO();
		// List<Object> list = dao.selectAll();


		// request.setAttribute("MemberList", list);

		return "select";

	}
}
