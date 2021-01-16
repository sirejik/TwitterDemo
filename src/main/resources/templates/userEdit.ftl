<#import "parts/common.ftl" as c>

<@c.page>
    <form action="/user" method="post">
        <div class="col-sm-6 offset-sm-3">
            <div class="card">
                <div class="card-header">User editor</div>
                <div class="m-2">
                    <div class="row">
                        <label class="col-sm-2 col-form-label">Login</label>
                        <div class="col">
                            <input type="text" class="form-control" name="username" value="${user.username}"/>
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-2 col-form-label">Roles</label>
                        <div class="col">
                            <#list roles as role>
                                <div class="form-check">
                                    <label>
                                        <input type="checkbox" class="form-check-input name="${role}"
                                            ${user.roles?seq_contains(role)?string("checked", "")}>${role}
                                    </label>
                                </div>
                            </#list>
                        </div>
                        <input type="hidden" value="${user.id}" name="userId"/>
                        <input type="hidden" value="${_csrf.token}" name="_csrf"/>
                    </div>
                    <div class="row justify-content-center">
                        <button class="btn btn-primary" type="submit">Save</button>
                    </div>
                </div>
            </div>
        </div>
    </form>
</@c.page>
