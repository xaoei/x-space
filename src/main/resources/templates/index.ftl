<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${sitename}:主页</title>

    <!-- load stylesheets -->
    <#--<link rel='stylesheet' type='text/css' href='http://fonts.font.im/css?family=Open+Sans:300,400' >-->
    <link rel="stylesheet" type='text/css' href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.css"><!-- Bootstrap style -->
    <link rel="stylesheet" type='text/css' href="css/templatemo-style.css">                                   <!-- Templatemo style -->
    <!-- load JS files -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/jquery.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/tether.min.js"></script> <!-- Tether for Bootstrap, http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.js"></script>                 <!-- Bootstrap (http://v4-alpha.getbootstrap.com/) -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/html5shiv.min.js"></script>
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/respond.min.js"></script>

</head>

<body>

<div class="tm-header">
    <div class="container-fluid">
        <div class="tm-header-inner">
            <a href="#" class="navbar-brand tm-site-name">${sitename}</a>
            <!-- navbar -->
            <nav class="navbar tm-main-nav">

                <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse" data-target="#tmNavbar">
                    &#9776;
                </button>
                <div class="collapse navbar-toggleable-sm" id="tmNavbar">
                    <ul class="nav navbar-nav">
                        <li class="nav-item active">
                            <a href="index" class="nav-link">${nav_item_a}</a>
                        </li>
                        <li class="nav-item">
                            <a href="about" class="nav-link">${nav_item_b}</a>
                        </li>
                        <li class="nav-item">
                            <a href="blog" class="nav-link">${nav_item_c}</a>
                        </li>
                        <li class="nav-item">
                            <a href="contact" class="nav-link">${nav_item_d}</a>
                        </li>
                        <#if username == '萧大侠'>
                            <li class="nav-item">
                                <a href="http://www.leiho.me" class="nav-link">${nav_item_e}</a>
                            </li>
                        <#else>
                            <li class="nav-item">
                                <a href="http://www.leiho.me" class="nav-link">${username}</a>
                            </li>
                        </#if>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>

<div class="tm-home-img-container">
    <img src=${logo_url} alt=${logo} class="hidden-lg-up img-fluid" title=${logo},>
</div>

<section class="tm-section">
    <div class="container-fluid">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 text-xs-center">
                <h2 class="tm-gold-text tm-title">${title}</h2>
                <p class="tm-subtitle">${subtitle}</p>
            </div>
        </div>
        <div class="row">

            <#list short_new_article as sna>
                <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                    <div class="tm-content-box">
                        <img src=${sna.img} alt="Image" class="tm-margin-b-20 img-fluid">
                        <h4 class="tm-margin-b-20 tm-gold-text">${sna.title}</h4>
                        <p class="tm-margin-b-20">${sna.article}</p>
                        <a href=${sna.link} class="tm-btn text-uppercase">详情</a>
                    </div>
                </div>
            </#list>

        </div> <!-- row -->

        <div class="row tm-margin-t-big">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">
                <div class="tm-2-col-left">

                    <h3 class="tm-gold-text tm-title">${main_article_title}</h3>
                    <p class="tm-margin-b-30">${main_article_feeling}</p>
                    <img src=${main_article_img} alt="Image" class="tm-margin-b-40 img-fluid">
                    ${main_article_context}
                    <a href="#" class="tm-btn text-uppercase">阅读全部</a>

                </div>
            </div>

            <div class="copyrights">Build By <a href="http://www.leiho.me"  title="雷吼小站">萧大侠</a></div>

            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-6 col-xl-6">

                <div class="tm-2-col-right">

                    <div class="tm-2-rows-md-swap">
                        <div class="tm-overflow-auto row tm-2-rows-md-down-2">
                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6">
                                <h3 class="tm-gold-text tm-title">简单随笔</h3>
                                <nav>
                                    <ul class="nav">
                                        <#list essay_links as el>
                                            <li><a href=${el.url} class="tm-text-link">${el.desc}</a></li>
                                        </#list>
                                    </ul>
                                </nav>
                            </div> <!-- col -->

                            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 col-xl-6 tm-xs-m-t">
                                <h3 class="tm-gold-text tm-title">精品转载</h3>
                                <nav>
                                    <ul class="nav">
                                        <#list repring_links as rl>
                                            <li><a href=${rl.url} class="tm-text-link">${rl.desc}</a></li>
                                        </#list>
                                    </ul>
                                </nav>
                            </div> <!-- col -->
                        </div>

                        <div class="row tm-2-rows-md-down-1 tm-margin-t-mid">
                            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                                <h3 class="tm-gold-text tm-title tm-margin-b-30">热门文章</h3>
                                <#list short_hot_article as sha>
                                    <div class="media tm-related-post">
                                        <div class="media-left media-middle">
                                            <a href=${sha.link}>
                                                <img class="media-object" src=${sha.img} alt="Generic placeholder image">
                                            </a>
                                        </div>
                                        <div class="media-body">
                                            <a href=${sha.link}><h4 class="media-heading tm-gold-text tm-margin-b-15">${sha.title}</h4></a>
                                            <p class="tm-small-font tm-media-description">${sha.article}</p>
                                        </div>
                                    </div>
                                </#list>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div> <!-- row -->
    </div>
</section>

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
                                <li><a href=${fl.url} class="tm-footer-link">${fl.desc}</a></li>
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
</body>
</html>