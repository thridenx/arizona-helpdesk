% rebase('skin')

<style>
    body {
    background-color: white;
    background-size: cover;
    font-family: Work Sans;
}

.login-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #000;
    margin: 0 auto;
    margin-top: 150px;
    
}

.login-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.login-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin: 0 auto 20px auto;
    font-size: 14px;
    font-family: Work Sans;
    padding: 0 20px 0 10px;
    outline: none;
}

.login-block button {
    width: 100%;
    height: 40px;
    background: #000;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #000;
    color: #fff;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 14px;
    font-family: Work Sans;
    outline: none;
    cursor: pointer;
}

.login-block button:hover {
    background: #ccc;
}

    
</style>

<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>

<div class="login-block">
    <h1>Login</h1>
    <form action="/auth" method="post">
        <input type="text" value="{{get('username', '')}}" placeholder="Username" id="username" name="username"/>
        <input type="password" value="{{get('password', '')}}" placeholder="Password" id="password" name="password"/>
        <button type="submit">Submit</button>
    </form>
% if message != '':
Result: <strong>{{message}}</strong>
% end
</div>
