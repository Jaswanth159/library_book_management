package com.library.servlet;

import com.library.dao.BookDAO;
import com.library.model.Book;
import com.google.gson.Gson;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.BufferedReader;

@WebServlet("/api/books/update")
public class UpdateBookServlet extends HttpServlet {
    private BookDAO bookDAO;
    private Gson gson;

    @Override
    public void init() throws ServletException {
        bookDAO = new BookDAO();
        gson = new Gson();
    }

    @Override
    protected void doPut(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Read the request body
        StringBuilder buffer = new StringBuilder();
        BufferedReader reader = request.getReader();
        String line;
        while ((line = reader.readLine()) != null) {
            buffer.append(line);
        }
        
        // Parse the JSON request body
        Book book = gson.fromJson(buffer.toString(), Book.class);
        
        // Update the book in the database
        boolean success = bookDAO.updateBook(book);
        
        // Set response content type
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // Send response
        if (success) {
            response.getWriter().write(gson.toJson(book));
        } else {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\": \"Failed to update book\"}");
        }
    }
} 