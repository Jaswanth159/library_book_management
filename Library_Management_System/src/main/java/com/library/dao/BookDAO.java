package com.library.dao;

import com.library.model.Book;
import com.library.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BookDAO {
    
    // Add a new book
    public boolean addBook(Book book) {
        String sql = "INSERT INTO books (book_id, title, author, genre, status) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, book.getBookId());
            pstmt.setString(2, book.getTitle());
            pstmt.setString(3, book.getAuthor());
            pstmt.setString(4, book.getGenre());
            pstmt.setString(5, book.getStatus());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Get all books
    public List<Book> getAllBooks() {
        List<Book> books = new ArrayList<>();
        String sql = "SELECT * FROM books";
        
        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {
            
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenre(rs.getString("genre"));
                book.setStatus(rs.getString("status"));
                books.add(book);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
    
    // Get book by ID
    public Book getBookById(String bookId) {
        String sql = "SELECT * FROM books WHERE book_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, bookId);
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenre(rs.getString("genre"));
                book.setStatus(rs.getString("status"));
                return book;
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    // Update book
    public boolean updateBook(Book book) {
        String sql = "UPDATE books SET title = ?, author = ?, genre = ?, status = ? WHERE book_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, book.getTitle());
            pstmt.setString(2, book.getAuthor());
            pstmt.setString(3, book.getGenre());
            pstmt.setString(4, book.getStatus());
            pstmt.setString(5, book.getBookId());
            
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Delete book
    public boolean deleteBook(String bookId) {
        String sql = "DELETE FROM books WHERE book_id = ?";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
            pstmt.setString(1, bookId);
            int rowsAffected = pstmt.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    // Search books
    public List<Book> searchBooks(String searchTerm, String searchType) {
        List<Book> books = new ArrayList<>();
        String sql;
        
        switch (searchType.toLowerCase()) {
	        case "id":
	            sql = "SELECT * FROM books WHERE book_id LIKE ?";
	            break;
	        case "title":
	            sql = "SELECT * FROM books WHERE title LIKE ?";
	            break;
	        case "author":
	            sql = "SELECT * FROM books WHERE author LIKE ?";
	            break;
	        case "genre":
	            sql = "SELECT * FROM books WHERE genre LIKE ?";
	            break;
	        case "status":
	            sql = "SELECT * FROM books WHERE status LIKE ?";
	            break;
	        case "all":
	            // Correct SQL query for the "all" case
	            sql = "SELECT * FROM books WHERE book_id LIKE ? OR title LIKE ? OR author LIKE ? OR genre LIKE ? OR status LIKE ?";
	            break;
	        default:
	        	sql = "SELECT * FROM books WHERE status LIKE ?";
        }
        
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(sql)) {
            
        	String searchPattern = "%" + searchTerm + "%";
            if (searchType.equalsIgnoreCase("all")) {
                pstmt.setString(1, searchPattern);
                pstmt.setString(2, searchPattern);
                pstmt.setString(3, searchPattern);
                pstmt.setString(4, searchPattern);
                pstmt.setString(5, searchPattern);
            } else {
                pstmt.setString(1, searchPattern); 
            }
            
            ResultSet rs = pstmt.executeQuery();
            
            while (rs.next()) {
                Book book = new Book();
                book.setBookId(rs.getString("book_id"));
                book.setTitle(rs.getString("title"));
                book.setAuthor(rs.getString("author"));
                book.setGenre(rs.getString("genre"));
                book.setStatus(rs.getString("status"));
                books.add(book);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }
    
    
    public static void main(String[] args) {
		
    	BookDAO bookDAO = new BookDAO();
    	
    	List<Book> searchBooks = bookDAO.searchBooks("classic", "all");
    	
    	System.out.println(searchBooks);
    	
	}
}
