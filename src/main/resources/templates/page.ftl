<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${sitename}:${one_content.title}</title>

    <!-- load stylesheets -->
    <link rel="stylesheet" type='text/css' href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.css"><!-- Bootstrap style -->
    <link rel="stylesheet" type='text/css' href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/templatemo-style.css">                                   <!-- Templatemo style -->
    <link rel="stylesheet" type='text/css' href="/font-awesome-4.7.0/css/font-awesome.min.css">

    <style type="text/css">
        .tm-blog-img-container { background-image: url('/img/tm-blog-img.jpg'); }
        .article_div img{max-width:880px}
    </style>

</head>

<body>
<#include "./common/head.ftl">
<div class="tm-blog-img-container"></div>
<div class="article_div" style="width: 880px;Margin-Right: auto;Margin-Left: auto;"><br>
    <h1 style="text-align: center">${one_content.title}</h1><br>
    <h6 style="text-align: center">---------本文章由${one_content.author}发布于${(one_content.announceTime?string("yyyy-MM-dd"))!}--------- </h6><br>
    <div  style="border-left-style:solid;border-left-width:15px;border-left-color:#117799;background-color:#dddddd;position:relative;">
        &nbsp;<i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>&nbsp;<h3 style="position: absolute;top: 50%;transform: translateY(-50%);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${one_content.feeling}</h3>
    </div><br>
    ${one_content.content}
</div>
<#include "./common/foot.ftl">

<!-- load JS files -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/jquery.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/tether.min.js"></script> <!-- Tether for Bootstrap, http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.js"></script>                 <!-- Bootstrap (http://v4-alpha.getbootstrap.com/) -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/html5shiv.min.js"></script>
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/respond.min.js"></script>


</body>
</html>