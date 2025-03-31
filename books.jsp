<%@page import="javax.print.attribute.standard.MediaSize.NA"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.library.model.Book" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Books - Digital Library Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .books-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .search-section {
            background: #FFFFFF;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            margin-bottom: 2rem;
        }

        .search-form {
            display: flex;
            gap: 1rem;
            flex-wrap: wrap;
        }

        .search-input {
            flex: 1;
            min-width: 200px;
            padding: 0.8rem;
            border: 1px solid #E0E0E0;
            border-radius: 5px;
            font-size: 1rem;
        }

        .search-button {
            background-color: #3498DB;
            color: #FFFFFF;
            border: none;
            padding: 0.8rem 1.5rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .search-button:hover {
            background-color: #2980B9;
        }
        
        .add-book-button {
            background-color: #3498DB;
            color: #FFFFFF;
            border: none;
            padding: 1rem 2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-bottom: 1rem;
        }

        .add-book-button:hover {
            background-color: #2980B9;
        }

        .books-table {
            width: 100%;
            background: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        .books-table table {
            width: 100%;
            border-collapse: collapse;
        }

        .books-table th,
        .books-table td {
            padding: 1rem;
            text-align: left;
            border-bottom: 1px solid #E0E0E0;
        }

        .books-table th {
            background-color: #2C3E50;
            color: #FFFFFF;
            font-weight: 500;
        }

        .books-table tr:hover {
            background-color: #F5F6FA;
        }

        .status-available {
            color: #27AE60;
        }

        .status-checked-out {
            color: #E74C3C;
        }

        .action-buttons {
            display: flex;
            gap: 0.5rem;
        }

        .action-button {
            padding: 0.5rem;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .edit-button {
            background-color: #3498DB;
            color: #FFFFFF;
        }

        .delete-button {
            background-color: #E74C3C;
            color: #FFFFFF;
        }

    </style>
</head>
<body>
    <div class="container">
        <header>
            <nav>
                <div class="logo">
                    <i class="fas fa-book-reader"></i>
                    <span>Digital Library</span>
                </div>
                <ul class="nav-links">
                    <li><a href="index.html">Home</a></li>
                    <li><a href="getBooksServlet" class="active">Books</a></li>
                    <li><a href="add-book.html">Add Book</a></li>
                    <li><a href="searchServlet">Search</a></li>
                    <li><a href="about.html">About</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <div class="books-container">
                <button class="add-book-button" onclick="window.location.href='add-book.html'">
                    <i class="fas fa-plus"></i> Add New Book
                </button>

                <div class="search-section">
                    <form class="search-form" action="searchServlet">
                        <input type="text" class="search-input" placeholder="Search by ID or Title..." name="searchTerm">
                        <input type="hidden" name="searchType" value="all">
                        <button type="submit" class="search-button">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </form>
                </div>

                <div class="books-table">
                    <table>
                        <thead>
                            <tr>
                                <th>Book ID</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>Genre</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                        <%
                        List<Book> allBooks = (List<Book>) request.getAttribute("allbooks");
                        
                        for(Book book : allBooks) {
                        	
                        %>
                            <tr>
                                <td><%= book.getBookId() %></td>
                                <td><%= book.getTitle() %></td>
                                <td><%= book.getAuthor() %></td>
                                <td><%= book.getGenre() %></td>
                       <%
                       	if(book.getStatus().equalsIgnoreCase("available")) {
                       %>
                                <td><span class="status-available"><%= book.getStatus() %></span></td>
                      <%
                      } else {
                      %>
                                <td><span class="status-checked-out"><%= book.getStatus() %></span></td>
                      <%}%>
                                <td>
                                    <div class="action-buttons">
                                    	<form action="editBook.jsp" method="post">
                                        <input type="hidden" value="<%= book.getBookId()%>" name="id">
                                        <input type="hidden" value="<%= book.getTitle()%>" name="title">
                                        <input type="hidden" value="<%= book.getAuthor()%>" name="author">
                                        <input type="hidden" value="<%= book.getGenre()%>" name="genre">
                                        <input type="hidden" value="<%= book.getStatus()%>" name="status">
                                        <button class="action-button edit-button" type="submit">
                                            <i class="fas fa-edit"></i>
                                        </button>
                                    	</form>
                                    	<form action="bookServlet" method="post">
										<input type="hidden" name="id" value="<%= book.getBookId()%>">
										<input type="hidden" name="action" value="delete">
                                        <button class="action-button delete-button">
                                            <i class="fas fa-trash"></i>
                                        </button>
                                    	</form>
                                    </div>
                                </td>
                            </tr>
                        <%}%>
                        </tbody>
                    </table>
                </div>
            </div>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Contact Us</h4>
                    <p>Email: library@example.com</p>
                    <p>Phone: (555) 123-4567</p>
                </div>
                <div class="footer-section">
                    <h4>Follow Us</h4>
                    <div class="social-links">
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>&copy; 2024 Digital Library. All rights reserved.</p>
            </div>
        </footer>
    </div>
</body>
</html> 