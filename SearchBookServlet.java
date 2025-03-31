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

@WebServlet("/searchServlet")
public class SearchBookServlet extends HttpServlet {
    private BookDAO bookDAO;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String searchTerm = request.getParameter("searchTerm");
        String searchType = request.getParameter("searchType");
        List<Book> searchBooks;
        if(searchTerm != null && !searchTerm.trim().isEmpty()) {
            searchBooks = bookDAO.searchBooks(searchTerm, searchType);
        } else {
            searchBooks = null;
        }
        request.setAttribute("searchBooks", searchBooks);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("search.jsp");
        requestDispatcher.include(request, response);
    }
} 