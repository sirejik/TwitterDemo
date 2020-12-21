<#macro pager url page>
    <#if page.getTotalPages() gt 7>
        <#assign
            totalPages = page.getTotalPages()
            currentPage = page.getNumber() + 1

            head = (currentPage > 4)?then([1, -1], [1, 2, 3])
            tail = (currentPage < totalPages - 3)?then([-1, totalPages], [totalPages - 2, totalPages -1 , totalPages])
            bodyBefore = (currentPage > 4 && currentPage < totalPages - 1)?then([currentPage - 2, currentPage - 1], [])
            bodyAfter = (currentPage > 2 && currentPage < totalPages - 3)?then([currentPage + 1, currentPage + 2], [])
            bodyCenter = (currentPage > 3 && currentPage < totalPages - 2)?then([currentPage], [])

            body = head + bodyBefore + bodyCenter + bodyAfter + tail
        >
    <#else>
        <#assign body = 1..page.getTotalPages()>
    </#if>
    <div class="container mt-3">
        <div class="row">
            <ul class="pagination col justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Page</a>
                </li>
                <#list body as pageNumber>
                    <#if page.getNumber() = (pageNumber - 1)>
                        <li class="page-item active">
                            <a class="page-link" href="#">${pageNumber}</a>
                        </li>
                    <#elseif pageNumber == -1>
                        <li class="page-item disable">
                            <a class="page-link" href="#">...</a>
                        </li>
                    <#else>
                        <li class="page-item">
                            <a class="page-link" href="${url}?page=${pageNumber - 1}&size=${page.getSize()}">${pageNumber}</a>
                        </li>
                    </#if>
                </#list>
            </ul>
            <ul class="pagination col justify-content-center">
                <li class="page-item disabled">
                    <a class="page-link" href="#" tabindex="-1">Page size</a>
                </li>
                <#list [5, 10, 25, 50] as pageSize>
                    <#if page.getSize() = pageSize>
                        <li class="page-item active">
                            <a class="page-link" href="#">${pageSize}</a>
                        </li>
                    <#else>
                        <li class="page-item">
                            <a class="page-link" href="${url}?page=${page.getNumber()}&size=${pageSize}">${pageSize}</a>
                        </li>
                    </#if>
                </#list>
            </ul>
        </div>
    </div>
</#macro>