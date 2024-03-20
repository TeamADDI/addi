package com.anim.clinic.admin.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class Interceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(Interceptor.class);

	static final String[] EXCLUDE_URL_LIST = { "/login", "/clientLogin", "/admin", "/clogin", "/cjoin", "/adminLogout",
			"/clientLogout.action"
	};

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String reqUrl = request.getRequestURL().toString();

		/** 로그인 체크 제외 리스트 */
		for (String target : EXCLUDE_URL_LIST) {
			if (reqUrl.indexOf(target) > -1) {
				return true;
			}
		}

		HttpSession session = request.getSession();
		String u_id = (String) session.getAttribute("u_id");
		System.out.println("현재 u_id 값은 : " + u_id + " 입니다.(인터셉터)");

		if (u_id == null || u_id.trim().equals("")) {
			logger.info(">> interceptor catch!!! u_id is null.. ");
			session.invalidate();
			System.out.println("세션에 값이 들어오지 않았습니다 인덱스 페이지로 이동합니다.");
			response.sendRedirect(request.getContextPath() + "/");

			return false;
		}
		System.out.println("로그인이 인터셉터 통과했습니다.");
		return true;
	}
}