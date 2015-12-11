







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

<link href='https://fonts.googleapis.com/css?family=Lato:400,300,100,700,900,100italic,300italic,400italic,700italic,900italic' rel='stylesheet' type='text/css'>
    
<!----------CSS -->
<style type="text/css">
    /*				HEADER */
    
    textarea:focus, input:focus{
    outline: 0;
}
    
    .container {
        padding:0vh 5vw;
        font-size: 12pt;
        font-family: 'Lato', sans-serif;
        font-weight: 400;
        line-height: 14pt;
    }
    
    .underline {
        text-decoration: underline;
    }
    
    .italic {
        font-style:italic;
    }
    
    nav {
        
        font-family: 'Lato', sans-serif;
        width: 100%;
        height: 10vh;
        display: block;
        border-radius: 0px;
    }
    
    nav .container-fluid {
        background-color: black;
         padding-bottom: 1.5vh;!important
    }

    nav .container-fluid .navbar-header .navbar-brand, .navbar-brand:hover, .navbar-brand:active, .navbar-brand:visited {
        background-color: black;
        margin-top: 1vh;
        color: white;
        font-size: 16pt;
        font-weight: 500;
        text-decoration: none;
    }


    nav .user,  header .user:hover, header .user:active, header .user:visited {
        color: white;
        font-weight: 500;
        font-size: 12pt;
        text-align: right;
        font-weight: 400;
        margin-top: 3vh;
    }
    
    nav .container-fluid form {
        background-color: white;
	   margin-top: 2vh;
        font-size: 12;
        padding: .6em .9em;
        -moz-box-sizing: border-box;
        -webkit-box-sizing: border-box;
        box-sizing: border-box;
        outline: none;
        border: 0;
        color: #000;
    }
    
    nav .container-fluid form #search-icon {
        color:black;
        top:2px;
        left:30px;
    }
    
    nav .container-fluid form #search-input {
        background-color: transparent;
        border: 0px solid;
        color: #CCC;
    }
    
    
    
    /*					*/
</style>
</head>

<body>
    % username_id = get('username_id', '')
   
<nav class="navbar">
    <div class="container-fluid">
        <div class="navbar-header col-xs-3">
            <a class="navbar-brand " href="/?o={{username_id}}">Helpdesk UC</a>
        </div>
        <form class="col-xs-7 row" action="/search?o={{get('username_id', '')}}" method="post">
            <span id="search-icon" class="glyphicon glyphicon-search" aria-hidden="true"></span>
            <input id="search-input" class="col-xs-11 pull-right" name="search" type="search" placeholder="Pesquisar tickets...">
        </form>
        <a class="nav navbar-nav navbar-right user col-xs-2" href="/detail/dir-inbox?o=777">
            <span id="search-icon" class="glyphicon glyphicon-user" aria-hidden="true"> </span>
        % username = get('username', '')
        % if username:
        {{user}}
        % end
      </a>

    </div>
    <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>
    <div class="container">
        {{!base}}
</body>

</html>