<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>For You</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            overflow: hidden;
            background: linear-gradient(to bottom, #ffafcc, #ff77aa);
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            color: #fff;
            font-family: 'Arial', sans-serif;
        }

        .message {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            text-align: center;
            z-index: 1;
        }

        .message h1 {
            font-size: 3rem;
            margin-bottom: 1rem;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.4);
        }

        .message p {
            font-size: 1.5rem;
            margin-top: 0;
        }

        .roses-container {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
            z-index: 0;
        }

        .rose {
            position: absolute;
            width: 50px;
            height: 50px;
            background: radial-gradient(circle, #ff4d6d, #ff0055);
            border-radius: 50%;
            animation: float 8s linear infinite;
            box-shadow: 0 0 10px rgba(255, 77, 109, 0.6);
        }

        @keyframes float {
            0% {
                transform: translateY(100vh) scale(0.5);
                opacity: 0;
            }
            50% {
                opacity: 1;
            }
            100% {
                transform: translateY(-10vh) scale(1.2);
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <div class="message">
        <h1>Just For You</h1>
        <p>Beautiful roses, for someone as beautiful as you!</p>
    </div>
    <div class="roses-container" id="roses-container"></div>

    <script>
        const rosesContainer = document.getElementById('roses-container');

        function createRose() {
            const rose = document.createElement('div');
            rose.classList.add('rose');
            const size = Math.random() * 30 + 20;
            rose.style.width = `${size}px`;
            rose.style.height = `${size}px`;
            rose.style.left = `${Math.random() * 100}%`;
            rose.style.animationDuration = `${Math.random() * 5 + 5}s`;
            rosesContainer.appendChild(rose);

            setTimeout(() => {
                rose.remove();
            }, 8000);
        }

        setInterval(createRose, 200);
    </script>
</body>
</html>
