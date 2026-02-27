<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        .login-box {
            width: 300px;
            margin: 100px auto;
            padding: 20px;
            background-color: white;
            border-radius: 8px;
            box-shadow: 0px 0px 10px gray;
        }

        input[type=text], input[type=password] {
            width: 100%;
            padding: 8px;
            margin: 8px 0;
        }

        input[type=submit] {
            width: 100%;
            padding: 8px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        h2 {
            text-align: center;
        }
    </style>

</head>
<body>

<div class="login-box">
    <h2>Login</h2>

    <!-- Form sends data to LoginServlet -->
    <form action="LoginServlet" method="post">

        <label>Username:</label>
        <input type="text" name="username" required>

        <label>Password:</label>
        <input type="password" name="password" required>

        <input type="submit" value="Login">

    </form>
</div>

</body>
</html>