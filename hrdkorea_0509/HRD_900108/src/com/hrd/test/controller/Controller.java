package com.hrd.test.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.hrd.test.service.Service;
import com.hrd.test.service.memberListService;
import com.hrd.test.service.memberRegisterService;
import com.hrd.test.service.memberReigsterViewService;


@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		actionDo(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		actionDo(request, response);
	}
	
	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String command = uri.substring(conPath.length());
		Service service = null;
		String viewPage = null;
		
		if(command.contentEquals("/main.do")) {
			viewPage = "main/main.jsp";
		}else if(command.contentEquals("/memberReigsterView.do")) {
			service = new memberReigsterViewService();
			service.excute(request, response);
			viewPage = "member/memberRegisterView.jsp";
		}else if(command.contentEquals("/memberRegister.do")) {
			service = new memberRegisterService();
			service.excute(request, response);
			viewPage = "memberReigsterView.do";
		}else if(command.contentEquals("/memberList.do")) {
			service = new memberListService();
			service.excute(request, response);
			viewPage = "member/memberList.jsp";
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request,response);
	}
}
