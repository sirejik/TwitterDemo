<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>
<@c.page>
<div>
    <@l.logout />
    <span><a href="/user">User list</a></span>
</div>
<div>
    <form method="post" enctype="multipart/form-data">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="text" name="text" placeholder="Input new message" />
        <input type="text" name="tag" placeholder="Tag" />
        <input type="file" name="file" placeholder="File" />
        <button type="submit">Send</button>
    </form>
</div>
<div>Message list:</div>
<form method="get" action="/main">
    <input type="text" name="filter" value="${filter?ifExists}">
    <button type="submit">Search messages by tag</button>
</form>
<#list messages as message>
<div>
    <b>${message.id}</b>
    <span>${message.text}</span>
    <i>${message.tag}</i>
    <strong>${message.authorName}</strong>
    <div>
        <#if message.filename??>
            <img src="/img/${message.filename}">
        </#if>
    </div>
</div>
<#else>
    No messages
</#list>
</@c.page>
