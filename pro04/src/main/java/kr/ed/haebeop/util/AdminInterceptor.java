package kr.ed.haebeop.util;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class AdminInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        String sid = (String) session.getAttribute("sid");
        if(session.getAttribute("sid")==null) { //로그인을 하지 않은 경우
            response.sendRedirect(request.getContextPath()+"/member/login.do");
            return false;
        }
        if(sid.equals("admin")){
            return true;
        } else {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>");
            out.println("alert('해당 페이지는 관리자만 접근 가능합니다.');");
            out.println("location.href='"+request.getContextPath()+"/';"); // 페이지 리디렉션을 JavaScript로 수행
            out.println("</script>");
            out.flush();
            return false;
        }
    }
}
