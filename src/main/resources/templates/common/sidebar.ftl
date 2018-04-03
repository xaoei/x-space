<aside class="col-xs-12 col-sm-12 col-md-4 col-lg-3 col-xl-3 tm-aside-r">
    <div class="tm-aside-container">
        <h3 class="tm-gold-text tm-title">精品转载</h3>
        <nav>
            <ul class="nav">
            <#if (repring_links)??>
                <#list repring_links as rl>
                <li><a href=${rl.url} class="tm-text-link" style="text-decoration:none">${rl.desc}</a></li>
                </#list>
            <#else>
                <h1>暂时没有转载!</h1>
            </#if>
            </ul>
        </nav>
        <hr class="tm-margin-t-small">
        <h3 class="tm-gold-text tm-title">简单随笔</h3>
        <nav>
            <ul class="nav">
                <#if (essay_links)??>
                    <#list essay_links as el>
                        <li><a href=${el.url} class="tm-text-link" style="text-decoration:none">${el.desc}</a></li>
                    </#list>
                <#else>
                    <h1>暂时没有随笔!</h1>
                    <hr>
                </#if>
            </ul>
        </nav>
        <nav>
        <#if (short_hot_article)??>
            <#list short_hot_article as sha>
                <hr class="tm-margin-t-small">
                <div class="tm-content-box tm-margin-t-small">
                    <a href="${sha.link}" class="tm-text-link" style="text-decoration:none"><h4
                            class="tm-margin-b-20 tm-thin-font" style="color: #000fff">${sha.title}</h4></a>
                    <p class="tm-margin-b-30">${sha.article}</p>
                </div>
            </#list>
        <#else>
            <hr class="tm-margin-t-small">
            <h1>暂无热门文章!</h1>
        </#if>
        </nav>
    </div>
</aside>