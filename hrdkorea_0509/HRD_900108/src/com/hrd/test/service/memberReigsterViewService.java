package com.hrd.test.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hrd.test.dao.MemberDao;

public class memberReigsterViewService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {		
		MemberDao mDao = MemberDao.getInstance();
		int custno = mDao.getCustno();
		request.setAttribute("custno", custno);
	}

}
