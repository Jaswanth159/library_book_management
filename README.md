# library_book_management
# Digital Library Management System

A modern web-based library management system built with Java Servlets and JSP, featuring a clean and intuitive user interface.

## Features

- 📚 Book Management
  - Add new books to the library
  - View all books in a grid layout
  - Search books by various criteria
  - Update book details
  - Remove books from the collection

- 🔍 Advanced Search Functionality
  - Search by Book ID
  - Search by Title
  - Search by Author
  - Search by Genre
  - Search by Status
  - Search across all fields

- 🎨 Modern UI/UX
  - Responsive design
  - Clean and intuitive interface
  - Card-based book display
  - Interactive hover effects
  - Font Awesome icons integration

## Technologies Used

- Java Servlets
- JSP (JavaServer Pages)
- HTML5
- CSS3
- MySQL Database
- Font Awesome Icons
- Google Fonts (Poppins)

## Project Structure

```
src/
├── main/
│   ├── java/
│   │   └── com/
│   │       └── library/
│   │           ├── servlet/
│   │           │   ├── SearchBookServlet.java
│   │           │   └── GetBooksServlet.java
│   │           ├── dao/
│   │           │   └── BookDAO.java
│   │           └── model/
│   │               └── Book.java
│   └── webapp/
│       ├── css/
│       │   └── style.css
│       ├── search.jsp
│       ├── index.html
│       └── add-book.html
```

## Getting Started

1. Clone the repository
2. Set up your MySQL database
3. Configure the database connection in `BookDAO.java`
4. Deploy the application to a Java web server (e.g., Tomcat)
5. Access the application through your web browser

## Features in Detail

### Search Functionality
- Users can search books using various criteria
- Real-time results display
- No JavaScript required for basic functionality
- Responsive grid layout for search results

### Book Display
- Card-based layout for better visualization
- Book information includes:
  - Title
  - Author
  - Genre
  - Status (Available/Checked Out)
- Visual status indicators
- Hover effects for better interaction

### Navigation
- Easy access to all features
- Clear menu structure
- Active state indicators
- Mobile-responsive design
