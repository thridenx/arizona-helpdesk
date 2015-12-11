<<<<<<< Updated upstream
<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,100,200,300,500,600,700,800,900' rel='stylesheet' type='text/css'>

<div class="ticket-block">
    <h1>Create a New Ticket</h1>
    <form action="/createticket" method="post">
        <label>Requestor:</label>
        <input type="text" value="{{get('requestor', '')}}" id="requestor" name="requestor"/>
        <label>Subject:</label>
        <input style="height:100px" type="text" value="{{get('subject', '')}}" id="subject" name="subject" height="500"/>
        <button type="submit">Submit</button>
    </form>
</div>

<style>
body {
    background-color: white;
    background-size: cover;
    font-family: Work Sans;
}

.ticket-block {
    width: 320px;
    padding: 20px;
    background: #fff;
    border-radius: 5px;
    border-top: 5px solid #000;
    margin: 0 auto;
    margin-top: 150px;
    
}

.ticket-block h1 {
    text-align: center;
    color: #000;
    font-size: 18px;
    text-transform: uppercase;
    margin-top: 0;
    margin-bottom: 20px;
}

.ticket-block label {
    text-align: center;
    color: #000;
    font-size: 18px;
    
}

.ticket-block input {
    width: 100%;
    height: 42px;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Work Sans;
    padding: 0 10px 0 10px;
    outline: none;
    margin-top: 10px;
}

.ticket-block #subject {
    width: 100%;
    box-sizing: border-box;
    border-radius: 5px;
    border: 1px solid #ccc;
    margin-bottom: 20px;
    font-size: 14px;
    font-family: Work Sans;
    outline: none;
}
    
.ticket-block button {
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

.ticket-block button:hover {
    background: #ccc;
}
 
</style>
=======
<?php 


?>


    <form action="/createticket" method="post">
        Requestor:
        <input name="requestor" type="text" value="{{get('requestor', '')}}" />
        <br> Subject:
        <input name="subject" type="text" value="{{get('subject', '')}}" />
        <br>
        <input value="Submit" type="submit" />
    </form>
>>>>>>> Stashed changes
