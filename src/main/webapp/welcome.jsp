<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String username = (String) session.getAttribute("username");
    if(username == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - Dashboard</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            overflow-x: hidden;
            position: relative;
        }

        /* Particle Background */
        .particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
        }

        .particle {
            position: absolute;
            width: 5px;
            height: 5px;
            background: rgba(255, 255, 255, 0.5);
            border-radius: 50%;
            animation: floatUp 15s infinite linear;
        }

        @keyframes floatUp {
            0% {
                transform: translateY(100vh) translateX(0);
                opacity: 0;
            }
            10% {
                opacity: 1;
            }
            90% {
                opacity: 1;
            }
            100% {
                transform: translateY(-100vh) translateX(100px);
                opacity: 0;
            }
        }

        /* Navigation Bar */
        .navbar {
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(10px);
            padding: 15px 30px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
        }

        .logo {
            color: white;
            font-size: 24px;
            font-weight: 700;
        }

        .logout-btn {
            background: rgba(255, 255, 255, 0.2);
            color: white;
            padding: 10px 25px;
            border: 1px solid rgba(255, 255, 255, 0.3);
            border-radius: 50px;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            font-weight: 500;
        }

        .logout-btn:hover {
            background: rgba(255, 255, 255, 0.3);
            transform: translateY(-2px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }

        /* Welcome Section */
        .welcome-container {
            text-align: center;
            padding: 50px 20px;
            animation: slideDown 1s ease-out;
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .welcome-title {
            color: white;
            font-size: 48px;
            margin-bottom: 20px;
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }
            50% {
                transform: scale(1.05);
            }
        }

        .welcome-subtitle {
            color: rgba(255, 255, 255, 0.9);
            font-size: 20px;
            margin-bottom: 50px;
        }

        /* Animated Cards */
        .cards-container {
            display: flex;
            justify-content: center;
            gap: 30px;
            flex-wrap: wrap;
            padding: 0 20px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .card {
            background: rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(10px);
            border-radius: 20px;
            padding: 30px;
            width: 300px;
            border: 1px solid rgba(255, 255, 255, 0.2);
            transition: all 0.3s ease;
            animation: bounceIn 1s ease-out;
            animation-fill-mode: both;
        }

        .card:nth-child(1) { animation-delay: 0.2s; }
        .card:nth-child(2) { animation-delay: 0.4s; }
        .card:nth-child(3) { animation-delay: 0.6s; }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3) translateY(100px);
            }
            50% {
                transform: scale(1.05) translateY(-20px);
            }
            70% {
                transform: scale(0.95) translateY(0);
            }
            100% {
                opacity: 1;
                transform: scale(1) translateY(0);
            }
        }

        .card:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow: 0 20px 40px rgba(0,0,0,0.2);
        }

        .card-icon {
            font-size: 48px;
            margin-bottom: 20px;
        }

        .card-title {
            color: white;
            font-size: 24px;
            margin-bottom: 15px;
            font-weight: 600;
        }

        .card-description {
            color: rgba(255, 255, 255, 0.8);
            font-size: 14px;
            line-height: 1.6;
        }

        /* Floating Animation for Icons */
        .floating {
            animation: floating 3s ease-in-out infinite;
        }

        @keyframes floating {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-10px);
            }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .welcome-title {
                font-size: 36px;
            }
            .cards-container {
                flex-direction: column;
                align-items: center;
            }
        }
    </style>
</head>
<body>
    <!-- Particle Background -->
    <div class="particles" id="particles"></div>

    <!-- Navigation -->
    <nav class="navbar">
        <div class="logo">Dashboard</div>
        <a href="LoginServlet?action=logout" class="logout-btn">Logout</a>
    </nav>

    <!-- Welcome Section -->
    <div class="welcome-container">
        <h1 class="welcome-title">Welcome, <%= username %>! 🎉</h1>
        <p class="welcome-subtitle">You've successfully logged into your dashboard</p>

        <!-- Animated Cards -->
        <div class="cards-container">
            <div class="card">
                <div class="card-icon floating">🚀</div>
                <h3 class="card-title">Quick Start</h3>
                <p class="card-description">Get started with our comprehensive guide and unleash the full potential of our platform.</p>
            </div>

            <div class="card">
                <div class="card-icon floating">💡</div>
                <h3 class="card-title">Innovation Hub</h3>
                <p class="card-description">Explore latest features and innovations designed to boost your productivity.</p>
            </div>

            <div class="card">
                <div class="card-icon floating">🎯</div>
                <h3 class="card-title">Your Goals</h3>
                <p class="card-description">Track your progress and achievements. Stay focused on what matters most.</p>
            </div>
        </div>
    </div>

    <script>
        // Create particle effect
        function createParticles() {
            const particlesContainer = document.getElementById('particles');
            const particleCount = 50;

            for (let i = 0; i < particleCount; i++) {
                const particle = document.createElement('div');
                particle.className = 'particle';
                particle.style.left = Math.random() * 100 + '%';
                particle.style.animationDelay = Math.random() * 15 + 's';
                particle.style.animationDuration = (Math.random() * 10 + 15) + 's';
                particlesContainer.appendChild(particle);
            }
        }

        createParticles();

        // Greeting based on time
        const currentHour = new Date().getHours();
        let greeting = "Good ";
        if (currentHour < 12) greeting += "Morning";
        else if (currentHour < 18) greeting += "Afternoon";
        else greeting += "Evening";
        
        console.log(greeting + ", <%= username %>!");
    </script>
</body>
</html>
