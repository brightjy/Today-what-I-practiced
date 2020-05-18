package com.hrd.test.service;

import java.sql.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrd.test.dao.MemberDao;
import com.hrd.test.dto.MemberDto;

public class memberRegisterService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		String custname = request.getParameter("custname");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String joindateStr = request.getParameter("joindate");
		Date joindate = null;
		String grade = request.getParameter("grade");
		String city = request.getParameter("city");		
		if(!joindateStr.equals("")) {
			joindate = Date.valueOf(joindateStr);
		}
		
		MemberDao mDao = MemberDao.getInstance();
		int result = mDao.memberRegister(custname, phone, address, joindate, grade, city);
		if(result==1) {
			request.setAttribute("registerResultMsg", "회원등록이 완료되었습니다.");			
		}else {
			request.setAttribute("registerResultMsg", "회원등록 실패");	
		}
		
	}

}
