package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.javaex.dao.PhoneDao;
import com.javaex.vo.PersonVo;


@WebServlet("/pbc")
public class PhoneController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("컨트롤러");
		
		//파라미터 action값 읽기
		String action = request.getParameter("action");
		System.out.println(action);
		
		if("list".equals(action)) {
			//리스트업무
			System.out.println("[리스트업무]");
			
			//리스트
			PhoneDao phoneDao = new PhoneDao();
			List<PersonVo> personList = phoneDao.getPersonList();
			
			System.out.println("controller=====테스트");
			System.out.println(personList);
			
			//Data 넣기 : request attribute에 넣기
			request.setAttribute("pList", personList);
			
			//html작업하기 ->jsp에게 시키고 => forward(전달) 
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/list.jsp");
			rd.forward(request, response);
			
		}else if("wform".equals(action)) {
			//글쓰기업무
			System.out.println("[글쓰기업무]");
			
			//forward to writeForm. (데이터 x)
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/writeForm.jsp");
			rd.forward(request, response);
			
		}else if("insert".equals(action)) {
			//저장업무
			System.out.println("[저장업무]");
			
			//Dao-저장: get parameter -> Vo -> dao.personInsert(vo), redirect
			
			String name = request.getParameter("name");
			String hp = request.getParameter("hp");
			String company = request.getParameter("company");
			
			PersonVo personvo = new PersonVo(name, hp, company);
			
			PhoneDao phoneDao = new PhoneDao();
			int count = phoneDao.personInsert(personvo);
			
			response.sendRedirect("/phonebook2test/pbc?action=list");
			
		}else if("uform".equals(action)){
			//수정업무
			System.out.println("수정업무");
			
			//forward to updateForm
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/updateForm.jsp");
			rd.forward(request, response);
			
			
		}else if("delete".equals(action)) {
			//삭제업무
			System.out.println("[삭제업무]");
			
			//jsp에게 시키고 forward
			RequestDispatcher rd = request.getRequestDispatcher("WEB-INF/delete.jsp");
			rd.forward(request, response);
			
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
