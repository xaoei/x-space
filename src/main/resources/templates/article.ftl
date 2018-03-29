<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${sitename}:${page_name}</title>

    <!-- load stylesheets -->
    <link rel="stylesheet" type='text/css' href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.css"><!-- Bootstrap style -->
    <link rel="stylesheet" type='text/css' href="/css/templatemo-style.css">                                   <!-- Templatemo style -->

</head>

    <body>
       
        <#include "./common/head.ftl">

        <div class="tm-blog-img-container"></div>
        <section class="tm-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-xl-9">

                        <table class="table table-striped">
                            <thead>
                            <tr>
                                <th>标题</th>
                                <th>作者</th>
                                <th>分类</th>
                                <th>发布时间</th>
                            </tr>
                            </thead>
                            <tbody>
                            <#if (simple_article_info)??>
                                <#list simple_article_info as sai>
                                    <tr>
                                    <#if sai.hot == 1>
                                    <td><a href="/page/article/${sai.id}" style="color: red">${sai.title}</a></td>
                                    <#else >
                                    <td><a href="/page/article/${sai.id}">${sai.title}</a></td>
                                    </#if>
                                    <td><a href="/page/author/${sai.authorId}">${sai.authorName}</td>
                                    <td><a href="/page/type/${sai.typeId}">${sai.typeName}</td>
                                    <td><a href="/page/date/${(sai.announceTime?string("yyyy-MM-dd"))!}">${(sai.announceTime?string("yyyy-MM-dd"))!}</td>
                                    </tr>
                                </#list>
                            <#else>
                                <br>
                                    <h1 >暂无内容</h1>
                                <br>
                            </#if>
                            </tbody>
                        </table>

                        <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-xl-9" style="text-align: center">
                            <ul class="pagination">
                                <#if page_index == 1 || page_total<=0>
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                <#else >
                                        <li class="page-item"><a class="page-link" href="/article/announce_desc/${page_pre}">&laquo;</a></li>
                                </#if>
                                <#if page_total<=0>
                                    <li class="page-item active"><a class="page-link" href="#">0</a></li>
                                <#else>
                                    <#list 1..page_total as i>
                                        <#if page_index == i>
                                        <li class="page-item active"><a class="page-link" href="#">${i}</a></li>
                                        <#else >
                                        <li class="page-item"><a class="page-link" href="/article/announce_desc/${i}">${i}</a></li>
                                        </#if>
                                    </#list>
                                </#if>

                                <#if page_total == page_index||page_total<=0>
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                <#else >
                                    <li class="page-item"><a class="page-link" href="/article/announce_desc/${page_next}">&raquo;</a></li>
                                </#if>
                            </ul><br>
                        </div>
                    </div>
                    <#include "./common/sidebar.ftl">
                </div>
            </div>
        </section>
        
    <#include "./common/foot.ftl">

    <!-- load JS files -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/jquery.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/tether.min.js"></script> <!-- Tether for Bootstrap, http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.js"></script>                 <!-- Bootstrap (http://v4-alpha.getbootstrap.com/) -->
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/html5shiv.min.js"></script>
    <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/respond.min.js"></script>
    </body>
</html>