package com.hrd.test.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hrd.test.dao.MemberDao;
import com.hrd.test.dto.MemberDto;

public class memberListService implements Service {

	@Override
	public void excute(HttpServletRequest request, HttpServletResponse response) {
		
		MemberDao mDao = MemberDao.getInstance();
		ArrayList<MemberDto> dtos = mDao.memberList();
		request.setAttribute("memberList", dtos);

	}

}
