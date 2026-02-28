<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Oops! Authentication Failed</title>
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
            background: linear-gradient(135deg, #FF6B6B 0%, #FF8E53 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            overflow: hidden;
            position: relative;
        }

        /* Falling X Symbols */
        .falling-x {
            position: absolute;
            color: rgba(255, 255, 255, 0.1);
            font-size: 30px;
            font-weight: bold;
            animation: fall linear infinite;
            top: -50px;
        }

        @keyframes fall {
            to {
                transform: translateY(calc(100vh + 100px)) rotate(360deg);
            }
        }

        /* Rotating Warning Signs Background */
        .warning-bg {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0.05;
            background-image: repeating-linear-gradient(
                45deg,
                transparent,
                transparent 35px,
                rgba(255,255,255,0.1) 35px,
                rgba(255,255,255,0.1) 70px
            );
            animation: slide 20s linear infinite;
        }

        @keyframes slide {
            0% {
                transform: translateX(0);
            }
            100% {
                transform: translateX(70px);
            }
        }

        /* Main Error Container */
        .error-container {
            background: rgba(255, 255, 255, 0.95);
            border-radius: 30px;
            padding: 50px;
            max-width: 500px;
            width: 90%;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.3);
            position: relative;
            animation: bounceIn 0.6s cubic-bezier(0.68, -0.55, 0.265, 1.55);
        }

        @keyframes bounceIn {
            0% {
                opacity: 0;
                transform: scale(0.3);
            }
            50% {
                opacity: 1;
                transform: scale(1.05);
            }
            70% {
                transform: scale(0.9);
            }
            100% {
                transform: scale(1);
            }
        }

        /* Bouncing Emoji */
        .emoji {
            font-size: 80px;
            animation: bounce 1s infinite;
            display: inline-block;
            margin-bottom: 20px;
        }

        @keyframes bounce {
            0%, 100% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
        }

        /* Shaking Error Title */
        .error-title {
            color: #FF6B6B;
            font-size: 36px;
            font-weight: 700;
            margin-bottom: 15px;
            animation: shake 2s infinite;
        }

        @keyframes shake {
            0%, 100% {
                transform: translateX(0);
            }
            10% {
                transform: translateX(-10px);
            }
            20% {
                transform: translateX(10px);
            }
            30% {
                transform: translateX(-10px);
            }
            40% {
                transform: translateX(10px);
            }
            50% {
                transform: translateX(-5px);
            }
            60% {
                transform: translateX(5px);
            }
            70% {
                transform: translateX(0);
            }
        }

        /* Sarcastic Messages */
        .sarcastic-message {
            color: #666;
            font-size: 18px;
            margin-bottom: 10px;
            font-weight: 500;
            animation: fadeInUp 1s ease-out 0.3s both;
        }

        @keyframes fadeInUp {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .sub-message {
            color: #999;
            font-size: 14px;
            margin-bottom: 30px;
            animation: fadeInUp 1s ease-out 0.5s both;
        }

        /* Try Again Button */
        .try-again-btn {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 15px 40px;
            border: none;
            border-radius: 50px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            animation: pulse 2s infinite;
            text-decoration: none;
            display: inline-block;
        }

        @keyframes pulse {
            0% {
                box-shadow: 0 0 0 0 rgba(102, 126, 234, 0.7);
            }
            70% {
                box-shadow: 0 0 0 15px rgba(102, 126, 234, 0);
            }
            100% {
                box-shadow: 0 0 0 0 rgba(102, 126, 234, 0);
            }
        }

        .try-again-btn:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 30px rgba(102, 126, 234, 0.4);
        }

        .try-again-btn::before {
            content: "";
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s;
        }

        .try-again-btn:hover::before {
            left: 100%;
        }

        /* Floating Objects */
        .float-object {
            position: absolute;
            animation: float 6s ease-in-out infinite;
        }

        .float-object-1 {
            top: 10%;
            left: 10%;
            font-size: 30px;
            animation-delay: 0s;
        }

        .float-object-2 {
            top: 20%;
            right: 10%;
            font-size: 25px;
            animation-delay: 2s;
        }

        .float-object-3 {
            bottom: 20%;
            left: 15%;
            font-size: 35px;
            animation-delay: 4s;
        }

        @keyframes float {
            0%, 100% {
                transform: translateY(0) rotate(0deg);
            }
            50% {
                transform: translateY(-20px) rotate(180deg);
            }
        }

        /* Glitch Effect for Fun */
        .glitch {
            position: relative;
            display: inline-block;
        }

        .glitch::before,
        .glitch::after {
            content: attr(data-text);
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
        }

        .glitch::before {
            animation: glitch-1 0.3s infinite;
            color: #FF6B6B;
            z-index: -1;
        }

        .glitch::after {
            animation: glitch-2 0.3s infinite;
            color: #4fc3f7;
            z-index: -2;
        }

        @keyframes glitch-1 {
            0%, 100% {
                transform: translateX(0);
            }
            20% {
                transform: translateX(-2px);
            }
            40% {
                transform: translateX(2px);
            }
        }

        @keyframes glitch-2 {
            0%, 100% {
                transform: translateX(0);
            }
            20% {
                transform: translateX(2px);
            }
            40% {
                transform: translateX(-2px);
            }
        }

        /* Responsive */
        @media (max-width: 600px) {
            .error-container {
                padding: 30px;
            }
            .error-title {
                font-size: 28px;
            }
            .emoji {
                font-size: 60px;
            }
        }
    </style>
</head>
<body>
    <!-- Falling X Symbols -->
    <div id="fallingXContainer"></div>
    
    <!-- Warning Background Pattern -->
    <div class="warning-bg"></div>

    <!-- Floating Objects -->
    <div class="float-object float-object-1">⚠️</div>
    <div class="float-object float-object-2">❌</div>
    <div class="float-object float-object-3">🚫</div>

    <!-- Main Error Container -->
    <div class="error-container">
        <div class="emoji" id="emoji">😅</div>
        <h1 class="error-title glitch" data-text="OOPS!">OOPS!</h1>
        <p class="sarcastic-message" id="sarcasticMsg">Nice try, but that's not it!</p>
        <p class="sub-message">Hint: The username isn't "IForgotMyPassword123" 😉</p>
        <a href="login.jsp" class="try-again-btn">Try Again →</a>
    </div>

    <script>
        // Array of sarcastic messages
        const messages = [
            "Wrong credentials, genius! 🤓",
            "Are you even trying? 🤔",
            "That password is as wrong as pineapple on pizza! 🍕",
            "Error 404: Your memory not found! 💭",
            "Did you forget your password... again? 🙄",
            "Close, but no cigar! 🚬",
            "Nice guess, but nope! 🎲",
            "Your credentials need a coffee break ☕",
            "Authentication failed! Did you try 'password123'? 😏",
            "Swing and a miss! Try again, slugger! ⚾"
        ];

        const emojis = ["😅", "🤦", "😬", "🤷", "😂", "🙈", "🤪", "😝", "🤭", "😵"];

        // Randomly select message and emoji
        const randomMsg = messages[Math.floor(Math.random() * messages.length)];
        const randomEmoji = emojis[Math.floor(Math.random() * emojis.length)];
        
        document.getElementById('sarcasticMsg').textContent = randomMsg;
        document.getElementById('emoji').textContent = randomEmoji;

        // Create falling X symbols
        function createFallingX() {
            const container = document.getElementById('fallingXContainer');
            const x = document.createElement('div');
            x.className = 'falling-x';
            x.textContent = '❌';
            x.style.left = Math.random() * 100 + '%';
            x.style.animationDuration = (Math.random() * 3 + 3) + 's';
            x.style.fontSize = (Math.random() * 20 + 20) + 'px';
            container.appendChild(x);

            setTimeout(() => {
                x.remove();
            }, 6000);
        }

        // Create falling X symbols periodically
        setInterval(createFallingX, 500);

        // Add wobble animation on hover
        document.querySelector('.error-container').addEventListener('mouseenter', function() {
            this.style.animation = 'wobble 0.5s ease-in-out';
        });

        document.querySelector('.error-container').addEventListener('animationend', function() {
            this.style.animation = '';
        });

        // Wobble animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes wobble {
                0% { transform: rotate(0deg); }
                25% { transform: rotate(3deg); }
                50% { transform: rotate(-3deg); }
                75% { transform: rotate(2deg); }
                100% { transform: rotate(0deg); }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>
