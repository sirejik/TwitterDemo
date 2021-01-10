<#include "security.ftl">

<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="col-sm-6 offset-sm-3">
            <div class="card">
                <#if isRegisterForm>
                    <div class="card-header">
                        <span>Register new user</span>
                    </div>
                </#if>
                <div class="m-2">
                    <div class="row">
                        <label class="col-sm-3 col-form-label">Login</label>
                        <div class="col">
                            <input type="text" class="form-control ${(usernameError??)?string('is-invalid', '')}"
                                   value="<#if user??>${user.username}</#if>" name="username" placeholder="Username"/>
                            <#if usernameError??>
                                <div class="invalid-feedback">
                                    ${usernameError}
                                </div>
                            </#if>
                        </div>
                    </div>
                    <div class="row mt-2">
                        <label class="col-sm-3 col-form-label">Password</label>
                        <div class="col">
                            <input type="password" class="form-control ${(passwordError??)?string('is-invalid', '')}"
                                   name="password" placeholder="Password"/>
                            <#if passwordError??>
                                <div class="invalid-feedback">
                                    ${passwordError}
                                </div>
                            </#if>
                        </div>
                    </div>
                    <#if isRegisterForm>
                        <div class="row mt-2">
                            <label class="col-sm-3 col-form-label">Password:</label>
                            <div class="col">
                                <input type="password"
                                       class="form-control ${(passwordConfirmationError??)?string('is-invalid', '')}"
                                       name="passwordConfirmation" placeholder="Retype password"/>
                                <#if passwordConfirmationError??>
                                    <div class="invalid-feedback">
                                        ${passwordConfirmationError}
                                    </div>
                                </#if>
                            </div>
                        </div>
                        <div class="row mt-2">
                            <label class="col-sm-3 col-form-label">Email:</label>
                            <div class="col">
                                <input type="email" class="form-control ${(emailError??)?string('is-invalid', '')}"
                                       value="<#if user??>${user.email}</#if>" name="email" placeholder="mail@example.com"/>
                                <#if emailError??>
                                    <div class="invalid-feedback">
                                        ${emailError}
                                    </div>
                                </#if>
                            </div>
                        </div>
                        <div class="row mt-2 mx-0">
                            <div class="g-recaptcha" data-sitekey="6LeOpwMaAAAAAFONvcj5JU5Gixi0wGfcgya_8ak8"></div>
                            <#if captchaError??>
                                <div class="alert alert-danger" role="alert">
                                    ${captchaError}
                                </div>
                            </#if>
                        </div>
                    </#if>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                    <div class="row mt-2 mx-0 justify-content-center">
                        <button class="btn btn-primary col-sm-3" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button>
                    </div>
                </div>
            </div>
            <#if !isRegisterForm>
                <div class="card mt-4">
                    <div class="m-2">
                        <label class="col-form-label">Are you not registered?</label>
                        <div class="row mt-2 justify-content-center">
                            <a class="btn btn-primary col-sm-3" href="/registration">Register now</a>
                        </div>
                    </div>
                </div>
            </#if>
        </div>
    </form>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}"/>
        <button class="btn btn-primary" type="submit"><#if user??>Sign Out<#else>Log In</#if></button>
    </form>
</#macro>
