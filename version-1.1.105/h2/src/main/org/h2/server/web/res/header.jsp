<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Copyright 2004-2008 H2 Group.
Multiple-Licensed under the H2 License, Version 1.0,
and under the Eclipse Public License, Version 1.0
(http://h2database.com/html/license.html).
Initial Developer: H2 Group
-->
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
    <title>${text.a.title}</title>
    <link rel="stylesheet" type="text/css" href="stylesheet.css" />
</head>
<body  bgcolor="#FF00FF"  class="toolbar">
    <form name="header" method="post" action="header.jsp?jsessionid=${sessionId}">
    <table class="toolbar" cellspacing="0" cellpadding="0"><tr class="toolbar"><td class="toolbar"
    ><a href="logout.do?jsessionid=${sessionId}" target="_top"
    ><img src="icon_disconnect.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.disconnect}" title="${text.toolbar.disconnect}" border="1" /></a
    ><img src="icon_line.gif" class="iconLine" alt=""
    /><a href="tables.do?jsessionid=${sessionId}" target="h2menu"
    ><img src="icon_refresh.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.refresh}" title="${text.toolbar.refresh}" border="1" /></a
    ><img src="icon_line.gif" class="iconLine" alt=""
    /></td><td class="toolbar"><input type="checkbox" name="autoCommit" value="autoCommit"
      onclick="javascript:if(document.header.autoCommit.checked)
      top.frames['h2result'].document.location='query.do?jsessionid=${sessionId}&amp;sql=@AUTOCOMMIT+TRUE';
      else
      top.frames['h2result'].document.location='query.do?jsessionid=${sessionId}&amp;sql=@AUTOCOMMIT+FALSE';
      "
    /></td><td class="toolbar">${text.toolbar.autoCommit}&nbsp;</td><td class="toolbar"
    ><a href="query.do?jsessionid=${sessionId}&amp;sql=ROLLBACK" target="h2result"
    ><img src="icon_rollback.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.rollback}" title="${text.toolbar.rollback}" border="1" /></a
    ><a href="query.do?jsessionid=${sessionId}&amp;sql=COMMIT" target="h2result"
    ><img src="icon_commit.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.commit}" title="${text.toolbar.commit}" border="1" /></a
    ><img src="icon_line.gif" class="iconLine" alt=""
    /></td><td class="toolbar">&nbsp;${text.toolbar.maxRows}:&nbsp;</td><td class="toolbar"
    ><select name="rowcount" size="1"
      onchange="javascript:top.frames['h2result'].document.location='query.do?jsessionid=${sessionId}&amp;sql=@SET+MAXROWS+'+header.rowcount.value;"
    ><option value="0">${text.toolbar.all}</option>
        <option value="10000">10000</option>
        <option selected="selected" value="1000">1000</option>
        <option value="100">100</option>
        <option value="10">10</option>
    </select
    >&nbsp;</td><td class="toolbar"><a href="javascript:top.frames['h2query'].document.forms['h2query'].submit();"
    ><img src="icon_run.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.run}" title="${text.toolbar.run}" border="1" /></a
    ></td><td class="toolbar"><a href="query.do?jsessionid=${sessionId}&amp;sql=@CANCEL" target="h2result"
    ><img src="icon_stop.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.cancelStatement}" title="${text.toolbar.cancelStatement}" border="1" /></a
    ><img src="icon_line.gif" class="iconLine" alt=""
    /><a href="query.do?jsessionid=${sessionId}&amp;sql=@HISTORY" target="h2result"
    ><img src="icon_history.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.toolbar.history}" title="${text.toolbar.history}" border="1" /></a
    ><img src="icon_line.gif" class="iconLine" alt=""
    /></td><td class="toolbar">${text.toolbar.autoComplete}&nbsp;<select name="autoComplete" size="1"
      onchange="javascript:top.frames['h2query'].setAutoComplete(this.value)"
    ><option value="0">${text.toolbar.autoComplete.off}</option>
    <option selected="selected" value="1">${text.toolbar.autoComplete.normal}</option>
    <option value="2">${text.toolbar.autoComplete.full}</option>
    </select
    ></td
    ><td class="toolbar"
    ><a href="help.jsp?jsessionid=${sessionId}" target="h2result"
    ><img src="icon_help.gif"
        onmouseover = "this.className ='icon_hover'"
        onmouseout = "this.className ='icon'"
        class="icon" alt="${text.a.help}" title="${text.a.help}" border="1"/></a
    ></td></tr></table>
    </form>
<script type="text/javascript">
<!--
    document.header.autoCommit.checked = '${autoCommit}' != '';
//-->
</script>
</body>
</html>