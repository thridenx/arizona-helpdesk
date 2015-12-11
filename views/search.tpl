

% rebase('skin')
% max_len = 80

<style>
    /*              SEARCH RESULTS              */
    
    .search-title .head {
        margin-top: 28pt;
        text-align: center;
        font-size: 14pt;
    }    
</style>



<div class="row search-title">
    <p class="head">Your search for <span class="italic">{{email}} </span>found <span class="underline">{{number_tickets}}</span> results:</p>
</div>


% action_result = get('action_result', '')
% if action_result:
<p>
    <strong>Action:</strong> <i>{{action_result}}</i>
</p>
% end

<table border="1" width="100%">
    % for priority in sorted(tickets, reverse=True):
    <tr>
        <td valign="top">
            <strong>{{priority}}</strong>
        </td>
        <td valign="top">
            <table border="0">
           % for ticket in sorted(tickets[priority], reverse=True):
                <tr>
                    <td>
                        <a href="http://localhost:8080/detailofticket/{{ticket['id']}}">
                            {{ticket['id']}}
                        </a>
                    </td>
                    <td>
                        <a href="http://localhost:8080/detailofticket/{{ticket['id']}}">
                            {{ticket['status']}}
                        </a>
                    </td>
                    <td>
                        <a href="http://localhost:8080/detailofticket/{{ticket['id']}}">
                            {{ticket['cf.{servico}']}}
                        </a>
                    </td>
                    <td>
                        <a href="http://localhost:8080/detailofticket/{{ticket['id']}}">
                            {{ticket['requestors']}}
                        </a>
                    </td>
                    <td>
                        <a href="http://localhost:8080/detailofticket/{{ticket['id']}}">
                            % subject = ticket['subject']
                            % if len(ticket['subject']) > max_len:
                            %   subject = ticket['subject'][:max_len]+'...'
                            % end
                            {{subject}}
                        </a>
                    </td>
                    <td>
                        <a href="http://localhost:8080/detailofticket/{{ticket['id']}}">
                            Created: {{ticket['created']}}<br>
                            Last Update: {{ticket['lastupdated']}}
                        </a>
                    </td>
                </tr>
            % end
            </table>
        </td>
    </tr>
    % end
</table>
