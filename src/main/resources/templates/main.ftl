<#import "parts/common.ftl" as c>

<@c.page>
<div class="form-row">
    <div class="form-group col-md-6">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Search</button>
        </form>
    </div>
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
