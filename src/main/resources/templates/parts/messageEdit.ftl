<#macro messageEdit mainPage>
    <#if mainPage>
        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
           aria-controls="collapseExample">Add new message</a>
    </#if>
    <div class="collapse <#if message??>show</#if>" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.text}</#if>" name="text" placeholder="Input new message"/>
                    <#if textError??>
                        <div class="invalid-feedback">
                            ${textError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <input type="text" class="form-control ${(tagError??)?string('is-invalid', '')}"
                           value="<#if message??>${message.tag}</#if>"
                           name="tag" placeholder="Tag"/>
                    <#if tagError??>
                        <div class="invalid-feedback">
                            ${tagError}
                        </div>
                    </#if>
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile"/>
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary"><#if mainPage>Send message<#else>Save message</#if></button>
                    <#if !mainPage>
                        <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false"
                               aria-controls="collapseExample">Cancel</a>
                    </#if>
                </div>
                <input type="hidden" value="${_csrf.token}" name="_csrf"/>
                <input type="hidden" value="<#if message??>${message.id}</#if>" name="id"/>
            </form>
        </div>
    </div>
</#macro>
