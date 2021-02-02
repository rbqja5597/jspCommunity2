package com.sbs.example.jspCommunity.container;

import com.sbs.example.jspCommunity.controller.AdmMemberController;
import com.sbs.example.jspCommunity.controller.UsrArticleController;
import com.sbs.example.jspCommunity.controller.UsrHomeController;
import com.sbs.example.jspCommunity.controller.UsrMemberController;
import com.sbs.example.jspCommunity.dao.ArticleDao;
import com.sbs.example.jspCommunity.dao.AttrDao;
import com.sbs.example.jspCommunity.dao.MemberDao;
import com.sbs.example.jspCommunity.service.ArticleService;
import com.sbs.example.jspCommunity.service.AttrService;
import com.sbs.example.jspCommunity.service.EmailService;
import com.sbs.example.jspCommunity.service.MemberService;

public class Container {
	public static ArticleService articleService;
	public static ArticleDao articleDao;
	public static UsrArticleController articleController;
	
	public static MemberDao memberDao;
	public static MemberService memberService;
	public static EmailService emailService;
	public static AttrService attrService;
	
	public static UsrMemberController memberController;
	public static AdmMemberController admMemberController;
	public static UsrHomeController homeController;
	public static AttrDao attrDao;
	
	
	
	static {
		attrDao = new AttrDao();
		memberDao = new MemberDao();
		articleDao = new ArticleDao();
		
		
		emailService = new EmailService();
		attrService = new AttrService();
		memberService = new MemberService();
		articleService = new ArticleService();
		
		admMemberController = new AdmMemberController();
		memberController = new UsrMemberController();
		articleController = new UsrArticleController();
		homeController = new UsrHomeController();
	}
}
