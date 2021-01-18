package com.sbs.example.jspCommunity.controller.usr;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dto.Board;
import com.sbs.example.jspCommunity.dto.Member;
import com.sbs.example.jspCommunity.service.MemberService;

public class MemberController {
	private MemberService memberService;
	
	public MemberController() {
		memberService = Container.memberService;
	}
	
	public String showList(HttpServletRequest req, HttpServletResponse resp) {
		List<Member> members = memberService.getForPrintMembers();
		
		req.setAttribute("members", members);
		
		return "adm/member/list";
	}

	public String showjoin(HttpServletRequest req, HttpServletResponse resp) {
		int memberId = Integer.parseInt(req.getParameter("memberId"));

		Member member = memberService.getMemberById(memberId);
		req.setAttribute("member", member);
		req.getParameter("name");
		req.getParameter("loginId");
		req.getParameter("loginPw");
		req.getParameter("email");
		req.getParameter("nickname");
		
		return "usr/member/join";
	}

	public String dojoin(HttpServletRequest req, HttpServletResponse resp) {		
		String name = req.getParameter("name");
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPw");
		String email = req.getParameter("email");
		String nickname = req.getParameter("nickname");
		

		Map<String, Object> joinArgs = new HashMap<>();
		joinArgs.put("name", name);
		joinArgs.put("loginId", loginId);
		joinArgs.put("loginPw", loginPw);
		joinArgs.put("email", email);
		joinArgs.put("nickname", nickname);

		int newArticleId = memberService.join(joinArgs);

		req.setAttribute("alertMsg", newArticleId + "회원가입 되었습니다.");
		req.setAttribute("replaceUrl", String.format("list?id=%d", newArticleId));
		return "common/redirect";
	}
}
