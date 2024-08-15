package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;

@WebServlet(value= {"/com/list.json", "/com/total", "/com/insert", "/com/delete", "/com/update", "/com/read"})
public class CommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    CommentDAOImpl dao=new CommentDAOImpl(); 
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out=response.getWriter();
		
		switch(request.getServletPath()) {
		
		case "/com/total": //테스트: 
			int bid=Integer.parseInt(request.getParameter("bid"));
			out.print(dao.total(bid));
			break;
		case "/com/list.json":
			int page=request.getParameter("page")==null ?
					1 : Integer.parseInt(request.getParameter("page"));
			int size=request.getParameter("size")==null ?
					5 : Integer.parseInt(request.getParameter("size"));
			bid=Integer.parseInt(request.getParameter("bid"));
			Gson gson=new Gson();
			out.print(gson.toJson(dao.list(bid, page, size)));
			break;
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		switch(request.getServletPath()) {
		
		case "/com/insert":
			CommentVO vo = new CommentVO();
			vo.setBid(Integer.parseInt(request.getParameter("bid")));
			vo.setContents(request.getParameter("contents"));
			vo.setWriter(request.getParameter("writer"));
			dao.insert(vo);
			break;
			
		case "/com/delete":
			int cid = Integer.parseInt(request.getParameter("cid"));
			System.out.println("cid:.........."+ cid);
			dao.delete(cid);
			break;
			
		case  "/com/update":
			vo = new CommentVO();
			vo.setContents(request.getParameter("contents"));
			vo.setCid(Integer.parseInt(request.getParameter("cid")));
			dao.update(vo);
			System.out.println(vo);
			response.sendRedirect("/bbs/read");
			break;
		}
	}

}
