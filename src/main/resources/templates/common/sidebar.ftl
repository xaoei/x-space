<aside class="col-xs-12 col-sm-12 col-md-4 col-lg-3 col-xl-3 tm-aside-r">

    <div class="tm-aside-container">
        <h3 class="tm-gold-text tm-title">精品转载</h3>
        <nav>
            <ul class="nav">
            <#list repring_links as rl>
                <li><a href=${rl.url} class="tm-text-link" style="text-decoration:none">${rl.desc}</a></li>
            </#list>
                </ul>
            </nav>
            <hr class="tm-margin-t-small">
            <h3 class="tm-gold-text tm-title">简单随笔</h3>
            <nav>
                <ul class="nav">
            <#list essay_links as el>
                <li><a href=${el.url} class="tm-text-link" style="text-decoration:none">${el.desc}</a></li>
            </#list>
            </ul>
        </nav>
        <#list short_hot_article as sha>
            <hr class="tm-margin-t-small">
            <div class="tm-content-box tm-margin-t-small">
                <a href=${sha.link} class="tm-text-link" style="text-decoration:none"><h4 class="tm-margin-b-20 tm-thin-font">${sha.title}</h4></a>
                <p class="tm-margin-b-30">${sha.article}</p>
            </div>
        </#list>
    </div>
</aside>