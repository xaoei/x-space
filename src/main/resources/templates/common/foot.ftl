<footer class="tm-footer">
    <div class="container-fluid">
        <div class="row">

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">

                <div class="tm-footer-content-box">
                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">站长信息</h3>
                    <div class="tm-gray-bg">
                        <p>${motto}</p>
                        <p>${authorize}</p>
                        <p><strong>${site_master_name}</strong></p>
                    </div>
                </div>

            </div>

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="tm-footer-content-box tm-footer-links-container">

                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">友情链接</h3>
                    <nav>
                        <ul class="nav">
                            <#list friend_links as fl>
                                <li><a href=${fl.url} class="tm-footer-link" style="text-decoration: none">${fl.desc}</a></li>
                            </#list>
                        </ul>
                    </nav>

                </div>

            </div>

            <!-- Add the extra clearfix for only the required viewport
                http://stackoverflow.com/questions/24590222/bootstrap-3-grid-with-different-height-in-each-item-is-it-solvable-using-only
            -->
            <div class="clearfix hidden-lg-up"></div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="tm-footer-content-box">
                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">热门评论</h3>
                    <#list comment_links as cl>
                        <p class="tm-margin-b-30">${cl.desc}<br/><a href=${cl.url} style="color:#BBBB88;text-decoration:none">查看原文</a> </p><hr class="tm-margin-b-30">
                    </#list>
                    <a href="#" class="tm-btn tm-btn-gray text-uppercase">查看更多</a>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="tm-footer-content-box">
                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">博客相册</h3>
                    <div class="tm-margin-b-30">
                        <#list picture_links as pl>
                            <a href=${pl.link}><img src=${pl.url} alt="Image" class="tm-footer-thumbnail" ></a>
                        </#list>
                    </div>
                    <p class="tm-margin-b-20">${picture_area_context}</p>
                    <a href="#" class="tm-btn tm-btn-gray text-uppercase">浏览更多</a>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 tm-copyright-col">
                <p class="tm-copyright-text">Copyright 2018 leiho site.<a href="http://www.leiho.me/" target="_blank" title="雷吼小站">雷吼小站</a> - Build By <a href="http://www.leiho.me/" title="雷吼小站" target="_blank">萧大侠</a></p>
            </div>
        </div>
    </div>
</footer>