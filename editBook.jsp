<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book - Digital Library Management System</title>
    <link rel="stylesheet" href="css/style.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
        .form-container {
            max-width: 800px;
            margin: 2rem auto;
            padding: 2rem;
            background: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .form-header {
            text-align: center;
            margin-bottom: 2rem;
        }

        .form-header h1 {
            color: #2C3E50;
            margin-bottom: 0.5rem;
        }

        .form-header p {
            color: #7F8C8D;
        }
        
        #hiddenOption {
        	display: none;
        }

        .book-form {
            display: grid;
            gap: 1.5rem;
        }

        .form-group {
            display: flex;
            flex-direction: column;
            gap: 0.5rem;
        }

        .form-group label {
            color: #2C3E50;
            font-weight: 500;
        }

        .form-group input,
        .form-group select {
            padding: 0.8rem;
            border: 1px solid #E0E0E0;
            border-radius: 5px;
            font-size: 1rem;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            outline: none;
            border-color: #3498DB;
        }

        .form-group .error-message {
            color: #E74C3C;
            font-size: 0.9rem;
            display: none;
        }

        .form-group input.error,
        .form-group select.error {
            border-color: #E74C3C;
        }

        .form-buttons {
            display: flex;
            gap: 1rem;
            margin-top: 1rem;
        }

        .submit-button {
            background-color: #3498DB;
            color: #FFFFFF;
            border: none;
            padding: 1rem 2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1rem;
            flex: 1;
        }

        .submit-button:hover {
            background-color: #3498DB;
        }

        .cancel-button {
            background-color: red;
            color: #FFFFFF;
            border: none;
            padding: 1rem 2rem;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            font-size: 1rem;
            flex: 1;
        }

        .cancel-button:hover {
            background-color: red;
        }

        .required {
            color: #E74C3C;
            margin-left: 0.2rem;
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
                    <li><a href="add-book.html" class="active">Add Book</a></li>
                    <li><a href="searchServlet">Search</a></li>
                    <li><a href="about.html">About</a></li>
                </ul>
            </nav>
        </header>

        <main>
            <div class="form-container">
                <div class="form-header">
                    <h1>Update Book</h1>
                    <p>Fill in the details below to update book to the library</p>
                </div>
				<%
				
				%>
                <form class="book-form" id="addBookForm" action="bookServlet" method="post">
                    <div class="form-group">
                        <label>Book ID <span class="required">*</span></label>
                        <input type="text" id="bookId" name="id" value="${param.id}" readonly="readonly">
                        <div class="error-message">Book ID is required and must be unique</div>
                    </div>

                    <div class="form-group">
                        <label>Title <span class="required">*</span></label>
                        <input type="text" id="title" name="title" value="${param.title}" required>
                        <div class="error-message">Title is required</div>
                    </div>

                    <div class="form-group">
                        <label>Author <span class="required">*</span></label>
                        <input type="text" id="author" name="author" value="${param.author}" required>
                        <div class="error-message">Author is required</div>
                    </div>

                    <div class="form-group">
                        <label>Genre <span class="required">*</span></label>
                        <select id="genre" name="genre" required>
                            <option value="${param.genre}" id="hiddenOption" selected>${param.genre}</option>
                            <option value="Fiction">Fiction</option>
                            <option value="Non-Fiction">Non-Fiction</option>
                            <option value="Science Fiction">Science Fiction</option>
                            <option value="Mystery">Mystery</option>
                            <option value="Romance">Romance</option>
                            <option value="Classic Literature">Classic Literature</option>
                            <option value="Biography">Biography</option>
                            <option value="History">History</option>
                            <option value="Other">Other</option>
                        </select>
                        <div class="error-message">Please select a genre</div>
                    </div>

                    <div class="form-group">
                        <label>Status <span class="required">*</span></label>
                        <select id="status" name="status" required>
                            <option value="${param.status}" selected id="hiddenOption">${param.status}</option>
                            <option value="Available">Available</option>
                            <option value="Checked Out">Checked Out</option>
                        </select>
                        <div class="error-message">Please select a status</div>
                    </div>
                    
                    <div class="form-buttons">
                        <button type="submit" class="btn btn-primary submit-button">
                        <i class="fas fa-save"></i> Update Book
                    	</button>
                        <button type="button" class="cancel-button" onclick="window.location.href='index.html'">
                            <i class="fas fa-times"></i> Cancel
                        </button>
                    </div>
                    <input type="hidden" name="action" value="update">
                </form>
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