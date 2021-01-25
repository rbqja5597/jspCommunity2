package com.sbs.example.jspCommunity.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sbs.example.jspCommunity.container.Container;
import com.sbs.example.jspCommunity.dto.Member;
import com.sbs.example.jspCommunity.service.MemberService;

public class UsrMemberController {
	private MemberService memberService;

	public UsrMemberController() {
		memberService = Container.memberService;
	}

	public String showList(HttpServletRequest req, HttpServletResponse resp) {
		List<Member> members = memberService.getForPrintMembers();

		req.setAttribute("members", members);

		return "usr/member/list";
	}

	public String showjoin(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginedMemberId") != null) {
			req.setAttribute("alertMsg", "로그아웃 후 이용해주세요");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		return "usr/member/join";
	}

	public String doJoin(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();

		if (session.getAttribute("loginedMemberId") != null) {
			req.setAttribute("alertMsg", "로그아웃 후 이용해주세요");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");
		String name = req.getParameter("name");
		String nickname = req.getParameter("nickname");
		String email = req.getParameter("email");
		String cellphoneNo = req.getParameter("cellphoneNo");

		Member oldmember = memberService.getMemberByLoginId(loginId);

		if (oldmember != null) {
			req.setAttribute("alertMsg", "이미 사용중인 아이디입니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		Map<String, Object> joinArgs = new HashMap<>();
		joinArgs.put("loginId", loginId);
		joinArgs.put("loginPw", loginPw);
		joinArgs.put("name", name);
		joinArgs.put("nickname", nickname);
		joinArgs.put("email", email);
		joinArgs.put("cellphoneNo", cellphoneNo);

		int newArticleId = memberService.join(joinArgs);

		req.setAttribute("alertMsg", newArticleId + "번 회원이 생성되었습니다.");
		req.setAttribute("replaceUrl", "../home/main");
		return "common/redirect";
	}

	public String showlogin(HttpServletRequest req, HttpServletResponse resp) {
		return "usr/member/login";
	}

	public String doLogin(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();		
		
		String loginId = req.getParameter("loginId");
		String loginPw = req.getParameter("loginPwReal");

		Member member = memberService.getMemberByLoginId(loginId);

		if (member == null) {
			req.setAttribute("alertMsg", "존재하지 않는 아이디입니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		if (member.getLoginPw().equals(loginPw) == false) {
			req.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}

		session.setAttribute("loginedMemberId", member.getId());

		req.setAttribute("alertMsg", String.format("%s님 환영합니다.", member.getNickname()));
		req.setAttribute("replaceUrl", "../home/main");
		return "common/redirect";

	}
	
	public String doLogout(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		session.removeAttribute("loginedMemberId");

		req.setAttribute("alertMsg", "로그아웃 되었습니다.");
		req.setAttribute("replaceUrl", "../home/main");
		return "common/redirect";
	}

	public String getLoginIdDup(HttpServletRequest req, HttpServletResponse resp) {
		String loginId = req.getParameter("loginId");

		Member member = memberService.getMemberByLoginId(loginId);
		
		
		String data = "";

		if ( member != null ) {
			data = "NO";
		}
		else {
			data = "YES";
		}

		req.setAttribute("data", data);
		return "common/pure";
	}

	public String showFindLoginId(HttpServletRequest req, HttpServletResponse resp) {
		HttpSession session = req.getSession();
		
		if (session.getAttribute("loginMemberId") != null) {
			req.setAttribute("alertMsg", "로그아웃 후 진행해주세요.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		return "usr/member/findLoginId";
	}

	public String doFindLoginId(HttpServletRequest req, HttpServletResponse resp) {		
		
		String name = req.getParameter("name");
		String email = req.getParameter("email");

		Member member = memberService.getMemberByNameAndEmail(name, email);

		if (member == null) {
			req.setAttribute("alertMsg", "존재하지 않는 아이디입니다.");
			req.setAttribute("historyBack", true);
			return "common/redirect";
		}
		
		req.setAttribute("alertMsg", String.format("아이디는 %s 입니다.", member.getLoginId()));
		req.setAttribute("replaceUrl", "../member/login");
		return "common/redirect";
	}

}
