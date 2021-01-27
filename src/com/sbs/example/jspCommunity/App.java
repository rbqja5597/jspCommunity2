package com.sbs.example.jspCommunity;

public class App {
	public static String getSite() {
		return "JSP Community";
	}

	public static String getContextName() {
		return "jspCommunity2";
	}

	public static String getMailUrl() {
		return "http://" + getSiteDomain() + ":" + getSitePort() + "/" + getContextName() + "/usr/home/main";
	}

	public static String getLoginUrl() {
		return "http://" + getSiteDomain() + ":" + getSitePort() + "/" + getContextName() + "/usr/member/login";
	}

	private static int getSitePort() {
		return 8083;
	}

	private static String getSiteDomain() {
		return "localhost";
	}
}
