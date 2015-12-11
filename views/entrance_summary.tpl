<!----------BOOTSTRAP -->
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">


<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>

<link href='https://fonts.googleapis.com/css?family=Work+Sans:400,500,600,700' rel='stylesheet' type='text/css'>

% result = "['Date', 'Created', 'Resolved', 'Still open'],\n"
% for day in sorted(statistics):
%   if statistics[day]:
%       result += '''["%s", %s, %s, %s],\n''' % (day,
%                                              statistics[day]["created_tickets"],
%                                              statistics[day]['team']['resolved'],
%                                              statistics[day]['team']['open'])
%   else:
%       result += '["%s", 0, 0, 0],\n' % day
%   end
% end

% graph_script = """
    <script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }"></script>

    <script type="text/javascript">
      google.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
%s
        ]);

        var options = {
          title: 'Número de tickets',
          curveType: 'function',
          legend: { position: 'bottom' },
        };

        var chart = new google.visualization.LineChart(document.getElementById('performance'));

        chart.draw(data, options);
      }
    </script>
""" % result

% result = "['Date', 'Mean Time to Resolve', 'Time worked'],\n"
% for day in sorted(statistics):
%   if statistics[day]:
%       result += '''["%s", %s, %s],\n''' % (day,
%                                      statistics[day]['team']['mean_time_to_resolve']/60,
%                                      statistics[day]['team']['time_worked']/60)
%   else:
%       result += '["%s", 0, 0],\n' % day
%   end
% end
% graph_script += """
 <script type="text/javascript"
          src="https://www.google.com/jsapi?autoload={
            'modules':[{
              'name':'visualization',
              'version':'1',
              'packages':['corechart']
            }]
          }"></script>

    <script type="text/javascript">
      google.setOnLoadCallback(drawChart);

      function drawChart() {
        var data = google.visualization.arrayToDataTable([
%s
        ]);

        var options = {
          title: 'Tempo médio de resolução vs Tempo total trabalhado (horas)',
          curveType: 'function',
          legend: { position: 'bottom' },
        };

        var chart = new google.visualization.LineChart(document.getElementById('mean_time_to_resolve'));

        chart.draw(data, options);
      }
    </script>
""" % result

% rebase('skin', meta_refresh=300)


<p>
    % username = get('username', '')
    % if username:
    <strong>Authenticated as: {{username}}</strong>
    % end
</p>


<a href="http://localhost:8080/newticket"><button class="btn">Create new ticket</button></a>

<table class="tabela1">
    <tr>
        <td><a href="/detail/dir?o={{username_id}}"><strong>DIR</strong></a></td>
        % # DIR
        % sum = 0
        % # we need this code because DIR can have tickets all along several status
        % for status in summary['dir']:
        %   sum += summary['dir'][status]
        % end
        <td valign="top">{{sum}}</td>
    </tr>
    <tr>
        <td><a href="/detail/dir-inbox?o={{username_id}}"><strong>DIR-INBOX</strong></a></td>
        % # DIR-INBOX
        % sum = 0
        % # we need this code because DIR can have tickets all along several status
        % for status in summary['dir-inbox']:
        %   sum += summary['dir-inbox'][status]
        % end
        <td valign="top">
            % urgent = get('urgent', '')
            % if urgent:
            <table>
                <td>
                    URGENT<br>
                    <br>
                    % for ticket_info in urgent:
                      <audio autoplay="autoplay">
                         <source src="/static/alert1.mp3" />
                      </audio>
                        <a href="http://localhost/rt/Ticket/Display.html?id={{ticket_info['id']}}">
                            {{ticket_info['subject']}}
                        </a>
                        % if username:
                        <a href="/ticket/{{ticket_info['id']}}/action/take?o={{username_id}}&email={{email}}">(take)</a>
                        % end
                    % end
                </td>
            </table>
            <br>
            % end
            {{sum}}
        </td>
    </tr>
</table>
<table class="tabela2">
    <tr id="cabecalho">
        <td><strong>USER</strong></td>
        <td><strong>IN</strong></td>
        <td><strong>ACTIVE</strong></td>
        <td><strong>STALLED</strong></td>
        <td><strong>DONE<strong></td>
    </tr>
                % totals = { status: 0 for status in ['new', 'open', 'stalled', 'resolved']}
                % for email in sorted(summary):
                %   if email.startswith('dir'):
                %       continue
                %   end
                %   user = email
                %   if  email != 'unknown':
                %       user = alias[email]
                %   end
    <tr>
                    <td><a href="/detail/{{email}}?o={{username_id}}">{{user}}</a></td>
                    %   for status in ['new', 'open', 'stalled', 'resolved']:
                    <td>{{summary[email][status]}}</td>
                    %       totals[status] += summary[email][status]
                    % end
    </tr>
                % end
    <tr>
                    <td><strong>Totais</strong></td>
                    %   for status in ['new', 'open', 'stalled', 'resolved']:
                    <td><strong>{{totals[status]}}</strong></td>
                    % end
    </tr>
</table>
<div id="stats">
        <div class="col-md-6" id="performance" style="width: 500px; height: 500px"></div>
        <div class="col-md-6" id="mean_time_to_resolve" style="width: 500px; height: 500px"></div>
</div>

<style>

#stats{
	display: inline-block;
	padding-left:40px;
}


tr, td {
    border-bottom: 1px solid #000;
}
tr:hover {
    background-color: #f5f5f5;
}
.tabela1 {
    background-color: white;
    font-family: 'Work Sans';
font-size: 18px;
    width: 63%;
margin-bottom: 30px;
color: black;

}

.tabela1 a, .tabela2 a{
text-decoration: none;
color:black;
}
.tabela2 {
margin-top: 50px;
font-size: 18px;
    background-color: white;
    font-family: 'Work Sans';
    width: 100%;
margin-bottom: 50px;
color:black;
}
#cabecalho{
background:#000;
color:white;
}

.btn {
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
margin-bottom: 30px; 
margin-top: 30px;
}

.btn:hover {
    background: #666666;
color:white;
}


</style>
