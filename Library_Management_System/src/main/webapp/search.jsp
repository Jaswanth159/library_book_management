<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List,com.library.model.Book" %>
 <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Books - Digital Library Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .search-container {
            max-width: 1200px;
            margin: 2rem auto;
            padding: 0 2rem;
        }

        .search-header {
            text-align: center;
            margin-bottom: 3rem;
        }

        .search-header h1 {
            color: #2C3E50;
            margin-bottom: 1rem;
        }

        .search-header p {
            color: #7F8C8D;
            max-width: 600px;
            margin: 0 auto;
        }

        .search-box {
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

        .search-input-group {
            flex: 1;
            min-width: 200px;
        }

        .search-type-group {
            min-width: 150px;
        }

        .search-select {
            width: 100%;
            padding: 1rem;
            border: 2px solid #E0E0E0;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
            background-color: #FFFFFF;
            cursor: pointer;
        }

        .search-select:focus {
            outline: none;
            border-color: #3498DB;
        }

        .search-input {
            width: 100%;
            padding: 1rem;
            border: 2px solid #E0E0E0;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .search-input:focus {
            outline: none;
            border-color: #3498DB;
        }

        .search-button {
            background-color: #3498DB;
            color: #FFFFFF;
            border: none;
            padding: 1rem 2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1rem;
        }

        .search-button:hover {
            background-color: #2980B9;
        }

        .search-options {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
            flex-wrap: wrap;
        }

        .search-option {
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .search-option input[type="radio"] {
            accent-color: #3498DB;
        }

        .results-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 1rem;
        }

        .results-count {
            color: #7F8C8D;
        }

        .results-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 2rem;
        }

        .book-card {
            background: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: transform 0.3s ease;
        }

        .book-card:hover {
            transform: translateY(-5px);
        }

        .book-image {
            width: 100%;
            height: 200px;
            background-color: #F5F6FA;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .book-image i {
            font-size: 3rem;
            color: #3498DB;
        }

        .book-info {
            padding: 1.5rem;
        }

        .book-title {
            color: #2C3E50;
            font-size: 1.2rem;
            margin-bottom: 0.5rem;
            font-weight: 600;
        }

        .book-author {
            color: #7F8C8D;
            margin-bottom: 0.5rem;
        }

        .book-genre {
            color: #3498DB;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        .book-status {
            display: inline-block;
            padding: 0.3rem 0.8rem;
            border-radius: 20px;
            font-size: 0.9rem;
        }

        .status-available {
            background-color: #E8F5E9;
            color: #27AE60;
        }

        .status-checked-out {
            background-color: #FFEBEE;
            color: #E74C3C;
        }

        .no-results {
            text-align: center;
            padding: 3rem;
            background: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .no-results i {
            font-size: 3rem;
            color: #95A5A6;
            margin-bottom: 1rem;
        }

        .no-results p {
            color: #7F8C8D;
            font-size: 1.1rem;
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
                    <li><a href="getBooksServlet">Books</a></li>
                    <li><a href="add-book.html">Add Book</a></li>
                    <li><a href="searchServlet" class="active">Search</a></li>
                    <li><a href="about.html">About</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <div class="search-container">
                <div class="search-header">
                    <h1>Search Books</h1>
                    <p>Find books by ID, title, author, genre or status. Use the search options below to refine your results.</p>
                </div>

                <div class="search-box">
                    <form class="search-form" id="searchForm" action="searchServlet">
                        <div class="search-input-group">
                            <input type="text" class="search-input" name="searchTerm" placeholder="Enter search term..." required="required">
                        </div>
                        <div class="search-type-group">
                            <select name="searchType" class="search-select">
                                <option value="all" selected="selected">All Fields</option>
                                <option value="id">Book ID</option>
                                <option value="title">Title</option>
                                <option value="author">Author</option>
                                <option value="genre">Genre</option>
                                <option value="status">Status</option>
                            </select>
                        </div>
                        <button type="submit" class="search-button">
                            <i class="fas fa-search"></i> Search
                        </button>
                    </form>
                </div>
                
                <%
                List<Book> books = (List<Book>) request.getAttribute("searchBooks");
                if(books != null && !books.isEmpty()) {
                %>
                
                <div class="search-results" id="searchResults">
                    <div class="results-header">
                        <h2>Search Results</h2>
                        <div class="results-count">Found <%=books.size()%> results</div>
                    </div>
                    <div class="results-grid">
                
                    <%
                    for(Book book : books) {
                    %>
                        <div class="book-card">
                            <div class="book-image">
                                <i class="fas fa-book"></i>
                            </div>
                            <div class="book-info">
                                <h3 class="book-title"><%= book.getTitle()%></h3>
                                <p class="book-author"><%= book.getAuthor() %></p>
                                <p class="book-genre"><%= book.getGenre() %></p>
                                <span class="book-status status-available"><%= book.getStatus() %></span>
                            </div>
                        </div>
                    <%}%>
                    </div>
                </div>
                <%
                } else {
                %>
                <div class="no-results" id="noResults">
                    <i class="fas fa-search"></i>
                    <p>No books found matching your search criteria.</p>
                </div>
                <%}%>
            </div>
        </main>

        <footer>
            <div class="footer-content">
                <div class="footer-section">
                    <h4>Contact Us</h4>
                    <p>Email: jaswanthjasse@gmail.com</p>
                    <p>Phone: (+91) 123-4567-890</p>
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