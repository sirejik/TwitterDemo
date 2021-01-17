<div class="card">
    <div class="card-header">
        <span>User: ${userChannel.username}</span>
    </div>
    <div class="m-2">
        <div class="row">
            <div class="col">Subscriptions</div>
            <h3 class="col">
                <a href="/user/subscriptions/${userChannel.id}/list">${subscriptionsCount}</a>
            </h3>
        </div>
        <div class="row">
            <div class="col">Subscribers</div>
            <h3 class="col">
                <a href="/user/subscribers/${userChannel.id}/list">${subscribersCount}</a>
            </h3>
        </div>
        <div class="row justify-content-center">
            <#if !isCurrentUser>
                <#if isSubscriber>
                    <a class="btn btn-primary" href="/user/unsubscribe/${userChannel.id}">Unsubscribe</a>
                <#else>
                    <a class="btn btn-primary" href="/user/subscribe/${userChannel.id}">Subscribe</a>
                </#if>
            </#if>
        </div>
    </div>
</div>
