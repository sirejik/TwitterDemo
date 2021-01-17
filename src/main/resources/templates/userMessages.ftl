<#import "parts/common.ftl" as c>
<#import "parts/messageEdit.ftl" as m>

<@c.page>
    <div class="row">
        <div class="col-sm-9">
            <#if isCurrentUser>
                <@m.messageEdit false />
            </#if>
            <#include "parts/messageList.ftl" />
        </div>
        <div class="col-sm-3">
            <#include "parts/userDetail.ftl" />
        </div>
    </div>
</@c.page>
