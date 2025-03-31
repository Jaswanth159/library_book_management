package com.library.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DatabaseConnection {
	public static final Connection getConnection() {
		Connection connection = null;
		String URL = "jdbc:mysql://localhost:3306/library_db";
		String USERNAME = "root";
		String PASSWORD = "Jasse@159";
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");			
			connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return connection;
	}
} 