package com.academic.servlets;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
 
import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
 
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
 
    @Resource(name = "jdbc/testDB")
    DataSource ds;
 
    public StudentServlet() {
        super();
    }
 
    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection con = ds.getConnection();
 
            Statement stmt = con.createStatement();
            String query = "select * from students";
            ResultSet rs = stmt.executeQuery(query);
 
            PrintWriter out = response.getWriter();
            response.setContentType("text/html");
            out.print("<center><h1>Student Details</h1></center>");
            out.print("<html><body>");
            out.print("<table border=\"1\" cellspacing=10 cellpadding=5>");
            out.print("<tr><th>Student ID</th>");
            out.print("<th>Student Name</th>");
            out.print("<th>Student Surnanme</th>");
            out.print("<th>Student Email</th></tr>");
 
            while (rs.next()) {
                out.print("<tr>");
                out.print("<td>" + rs.getInt("id") + "</td>");
                out.print("<td>" + rs.getString("name") + "</td>");
                out.print("<td>" + rs.getString("surname") + "</td>");
                out.print("<td>" + rs.getString("email") + "</td>");
                out.print("</tr>");
            }
            out.print("</table></body></html>");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
 
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }
}