package com.library.servlet;

import java.io.IOException;

import com.library.dao.BookDAO;
import com.library.model.Book;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/bookServlet")
public class AddBookServlet extends HttpServlet {
    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	String action = request.getParameter("action");
    	String id = request.getParameter("id");
    	
        
    	if(action.equals("add") || action.equals("update")) {
    		String title = request.getParameter("title");
    		String author = request.getParameter("author");
    		String genre = request.getParameter("genre");
    		String status = request.getParameter("status");
    		System.out.println("add || update");
    		Book book = new Book(id, title, author, genre, status);
    		
    		if(action.equals("add")) {
    			boolean res = bookDAO.addBook(book);
    			System.out.println("add");
    			if(res) {
    				response.sendRedirect("getBooksServlet");
    			} 
    		} else if(action.equals("update")) {
        		boolean res = bookDAO.updateBook(book);
        		System.out.println("inside update");
        		System.out.println(id + " " + action + " " + title + " " + author + " " + genre + " " + status);
        		System.out.println(res);
        		if(res) {
        			response.sendRedirect("getBooksServlet");    			
        		}
    		} 
    	} else if(action.equals("delete")) {
    		boolean res = bookDAO.deleteBook(id);
    		if(res) {
    			response.sendRedirect("getBooksServlet");    			
    		}
    	}
    }
} 