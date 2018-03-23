<aside class="col-xs-12 col-sm-12 col-md-4 col-lg-3 col-xl-3 tm-aside-r">

    <div class="tm-aside-container">
        <h3 class="tm-gold-text tm-title">半成品</h3>
        <nav>
            <ul class="nav">
            <#if unFinishArticles??>
                <#list unFinishArticles as ufa>
                <#if ufa.title?length gt 10>
                    <li><a href="/edit/article/${ufa.id}" class="tm-text-link" style="text-decoration:none">${ufa.title?substring(0,10)}...</a></li>
                <#else>
                    <li><a href="/edit/article/${ufa.id}" class="tm-text-link" style="text-decoration:none">${ufa.title}</a></li>
                </#if>
                </#list>
            </#if>
            </ul>
            <button type="button" class="btn btn-success">查看更多</button>
            </nav>
            <hr class="tm-margin-t-small">
            <h3 class="tm-gold-text tm-title">已发布</h3>
            <nav>
            <ul class="nav">
            <#if finishedArticles??>
                <#list finishedArticles as fea>
                    <#if fea.title?length gt 10>
                <li><a href="/edit/article/${fea.id}" class="tm-text-link" style="text-decoration:none">${fea.title?substring(0,10)}...</a></li>
                    <#else>
                <li><a href="/edit/article/${fea.id}" class="tm-text-link" style="text-decoration:none">${fea.title}</a></li>
                    </#if>
                </#list>
            </#if>
            </ul>
            <button type="button" class="btn btn-info">查看更多</button>
        </nav>
        <hr class="tm-margin-t-small">
        <h3 class="tm-gold-text tm-title">指指点点</h3>
        <div class="tm-content-box tm-margin-t-small">
        <#if myComments??>
            <#list myComments as mcs>
            <a href="/page/article/${mcs.articleId}" class="tm-text-link" style="text-decoration:none"><h4 class="tm-margin-b-20 tm-thin-font">
                <#if mcs.title?length gt 10>
                    ${mcs.title?substring(0,10)}...
                <#else>
                    ${mcs.title}
                </#if>
            </h4></a><p class="tm-margin-b-30">
                <#if mcs.comment?length gt 20>
                    ${mcs.comment?substring(0,20)}...
                <#else>
                    ${mcs.comment}
                </#if>
                </p>
            </#list>
        </#if>

        </div>
        <button type="button" class="btn btn-warning">查看更多</button>
    </div>
</aside>