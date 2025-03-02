local response = [[{{response}}]]
response = '<textarea>' .. response .. '</textarea>'

-- HTML and CSS structure
local html = [[
<!DOCTYPE html>
<html>
<head>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
        }
        .container {
            width: 80%;
            max-width: 800px;
            margin: auto;
        }
        textarea {
            width: 100%;
            height: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            background-color: #fff;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            resize: none;
        }
    </style>
</head>
<body>
    <div class="container">
        ]] .. response .. [[
    </div>
</body>
</html>
]]

ngx.print(html)
