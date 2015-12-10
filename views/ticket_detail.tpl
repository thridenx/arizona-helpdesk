% rebase('skin')

<FORM><INPUT Type="button" VALUE="Back" onClick="history.go(-1);return true;"></FORM>

<p>
    <strong>Created:</strong> {{ticket['created']}}    <strong>|    Started:</strong> {{ticket['started']}}
</p>
<p>
    <strong>ID:</strong> {{ticket['id']}}
</p>
<p>
    <strong>Status:</strong> {{ticket['status']}}
</p>
<p>
    <strong>Subject:</strong> {{ticket['subject']}}
</p>
<p>
    <strong>Requester:</strong> {{ticket['requestors']}}
</p>
<p>
    <strong>Owner:</strong> {{ticket['owner']}}
</p>
<p>
    <strong>Time worked:</strong> {{ticket['timeworked']}}
</p>
<p>
    <strong>Initial priority:</strong> {{ticket['initialpriority']}}    <strong>|    Priority:</strong> {{ticket['priority']}}
</p>
<p>
    <strong>All:</strong> {{ticket}}
</p>

