package com.library.servlet;

import java.io.IOException;
import java.util.List;

import com.library.dao.BookDAO;
import com.library.model.Book;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/getBooksServlet")
public class GetBooksServlet extends HttpServlet {
    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	
    	List<Book> allBooks = bookDAO.getAllBooks();
    	
    	request.setAttribute("allbooks", allBooks);
    	
    	RequestDispatcher requestDispatcher = request.getRequestDispatcher("books.jsp");
    	
    	requestDispatcher.forward(request, response);
    	
    }  
} 
