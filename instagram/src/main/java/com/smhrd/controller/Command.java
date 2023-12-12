package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface Command {

	// 메소드의 구현내용은 자식 클래스가 전부 담당
	// >> 메소드의 {}가 필요없다 >> 추상메소드를 가지고 있어야한다
	// >> abstract 키워드가 생략 가능한 interface로 부모 클래스 만들기!
	
	public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException;
}
