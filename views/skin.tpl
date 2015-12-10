<!DOCTYPE html>
<html lang="en">

<head>
    % meta_refresh = get('meta_refresh', 0) {{!'
    <meta http-equiv="refresh" content="%s">' % meta_refresh if meta_refresh else ''}}
    <meta charset="UTF-8">
    <title>{{title}}</title>
    % graph_script = get('graph_script', '') % if graph_script: {{!graph_script}} % end
    <style type="text/css">
        header {
            width: 100%;
            height: 5vh;
        }
        
        header .link {
            font-size: 18pt;
            font-family: 'Work Sans', sans-serif;
            font-weight: 600;
            text-decoration: none;
        }
    </style>
</head>

<body>
    % username_id = get('username_id', '')
    <header>
        <div class="link"><a href="/?o={{username_id}}">Helpdesk UC</a></div>
    </header>
    {{!base}}
</body>

</html>