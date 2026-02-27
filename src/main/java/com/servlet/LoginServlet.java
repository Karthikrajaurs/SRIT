package com.servlet;



import com.dao.UserDAO;
import java.io.IOException;
import javax.servlet.*;
import javax.servlet.http.*;

public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, 
                          HttpServletResponse response)
                          throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        UserDAO dao = new UserDAO();
        boolean result = dao.validate(username, password);

        if (result) {
            response.sendRedirect("welcome.jsp");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
