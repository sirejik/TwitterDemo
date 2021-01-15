<#import "parts/common.ftl" as c>
<#import "parts/messageEdit.ftl" as m>

<@c.page>
    <#if !isCurrentUser>
        <#if isSubscriber>
            <a class="btn btn-info" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
        <#else>
            <a class="btn btn-info" href="/user/subscribe/${userChannel.id}">Subscribe</a>
        </#if>
    </#if>
    <#if isCurrentUser>
        <@m.messageEdit false />
    </#if>

    <#include "parts/messageList.ftl" />

</@c.page>
