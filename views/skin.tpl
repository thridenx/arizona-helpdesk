<!DOCTYPE html>
<html lang="en">

<head>
    % meta_refresh = get('meta_refresh', 0)
    {{!'<meta http-equiv="refresh" content="%s">' % meta_refresh if meta_refresh else ''}}
    <meta charset="UTF-8">
    <title>{{title}}</title>
    % graph_script = get('graph_script', '') 
    % if graph_script: 
    {{!graph_script}} 
    % end
    
    
  <!----------BOOTSTRAP -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600,700' rel='stylesheet' type='text/css'>

<!----------CSS -->
<style type="text/css">
    /*				HEADER */
    
    body {
        padding:0vh 5vw;
    }
    
    header {
        padding:0 0;!important
        width: 100%;
        height: 7vh;
        display: block;
        background-color: white;
        -webkit-box-shadow: 0px 5px 5px 0px rgba(50, 50, 50, 0.2);
        -moz-box-shadow:    0px 5px 5px 0px rgba(50, 50, 50, 0.2);
        box-shadow:         0px 5px 5px 0px rgba(50, 50, 50, 0.2);
    }
    
    header a, header a:hover, header a:active, header a:visited {
        margin-top: 1vh;
        color: black;
        font-size: 18pt;
        font-family: 'Work Sans', sans-serif;
        font-weight: 500;
        text-decoration: none;
    }

    header .user {
        font-weight: 500;
        
        font-size: 12pt;
    }
    
    /*					*/
</style>
</head>

<body>
    % username_id = get('username_id', '')
    <header class="row">
        <a class="col-xs-4 pull-left" href="/?o={{username_id}}">Helpdesk UC</a>
        <a class="user col-xs-2 pull-right" href="/?o={{username_id}}">
        % username = get('username', '')
        % if username:
        {{username}}
        % end
        </a>
    </header>
    {{!base}}
</body>

</html>