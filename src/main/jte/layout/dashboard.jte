@import gg.jte.TemplateEngine
@param gg.jte.Content content
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            height: 100vh;
        }
        header {
            background-color: blue;
            color: white;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        header a {
            color: white;
            text-decoration: none;
            margin: 0 10px;
        }
        .container {
            display: flex;
            flex: 1;
        }
        nav {
            background-color: #f4f4f4;
            width: 200px;
            padding: 20px;
        }
        nav a {
            display: block;
            margin: 10px 0;
            text-decoration: none;
            color: #333;
        }
        main {
            flex: 1;
            padding: 20px;
        }
    </style>
</head>
<body>
<header>
    <h1><a href="/"> ALL PUBLISHER</a></h1>
    <div>
        <a href="/settings">Settings</a>
        <a href="/aboutus">About Us</a>
        <a href="/contactus">Contact Us</a>
    </div>
</header>
<div class="container">
    <nav>
        <a href="/dashboard">Dashboard</a>
        <a href="/reports">Reports</a>
        <a href="/settings">Settings</a>
    </nav>
    <main>
        ${content}
    </main>
</div>
</body>
</html>