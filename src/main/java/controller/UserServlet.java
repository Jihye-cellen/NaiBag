package controller;

import java.io.*;

import model.*;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(value={"/user/login" , "/user/logout", "/user/join",  "/user/update", "/user/update/pass", "/user/mypage"})
public class UserServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
     UserDAO dao = new UserDAO();  
    
  
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dis = request.getRequestDispatcher("/home.jsp");
		HttpSession session = request.getSession();
		switch(request.getServletPath()) {
		case "/user/login":
			request.setAttribute("pageName", "/user/login.jsp");
			dis.forward(request, response);
			break;
		case"/user/logout":
			session.invalidate();
			response.sendRedirect("/");
			break;
		case "/user/join":
			request.setAttribute("pageName", "/user/join.jsp");
			dis.forward(request, response);
			break;
		case "/user/mypage":
			String uid=(String)session.getAttribute("uid");
			request.setAttribute("user",dao.read(uid));
			request.setAttribute("pageName", "/user/mypage.jsp");
			dis.forward(request, response);
			break;
			
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		HttpSession session=request.getSession();
		PrintWriter out = response.getWriter();
		switch(request.getServletPath()) {
		case "/user/login":
			String uid = request.getParameter("uid");
			String upass=request.getParameter("upass");
			UserVO vo = dao.read(uid);
			int result=0; //아이디가 없는 경우
			if(vo.getUid()!=null) {
				  if(vo.getUpass().equals(upass)) {
		               session.setAttribute("uid", uid);
		               session.setAttribute("user", vo);
				result=1; //로그인 성공
			}else {
				result=2; //비밀번호가 불일치하는 경우
				}
			}		  
			out.print(result);
		 break;
		case "/user/join":
			UserVO user= new UserVO();
			user.setUid(request.getParameter("uid"));
			user.setUpass(request.getParameter("upass"));
			user.setUname(request.getParameter("uname"));
			user.setAddress1(request.getParameter("address1"));
			user.setAddress2(request.getParameter("address2"));
			System.out.println(user.toString());
			dao.insert(user);
			break;
		case "/user/update/pass":
			String uid1=request.getParameter("uid");
			String npass=request.getParameter("npass");
			dao.update(uid1, npass); //비밀번호변경
			break;
		case "/user/update":
			vo=new UserVO();
			uid=request.getParameter("uid");
			vo.setUid(uid);
			vo.setUname(request.getParameter("uname"));
			vo.setPhone(request.getParameter("phone"));
			vo.setAddress1(request.getParameter("address1"));
			vo.setAddress2(request.getParameter("address2"));
			System.out.print(vo.toString());
			dao.update(vo); //데이터베이스에 업데이트
			break;
		}
	
	}

}
