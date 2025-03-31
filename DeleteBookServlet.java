package com.library.servlet;

import com.library.dao.BookDAO;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/api/books/delete/*")
public class DeleteBookServlet extends HttpServlet {
    private BookDAO bookDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
        gson = new Gson();
    }

    @Override
    protected void doDelete(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String pathInfo = request.getPathInfo();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        if (pathInfo != null && pathInfo.length() > 1) {
            String bookId = pathInfo.substring(1);
            boolean success = bookDAO.deleteBook(bookId);
            
            Map<String, Object> result = new HashMap<>();
            if (success) {
                result.put("message", "Book deleted successfully");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                result.put("error", "Failed to delete book");
            }
            
            response.getWriter().write(gson.toJson(result));
        } else {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\": \"Book ID is required\"}");
        }
    }
} 