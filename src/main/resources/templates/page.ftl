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
    <input name="articleId" value="${one_content.id}" hidden="hidden">
    <h1 style="text-align: center">${one_content.title}</h1><br>
    <h6 style="text-align: center">---------本文章由${one_content.authorName}发布于${(one_content.announceTime?string("yyyy-MM-dd"))!}--------- </h6><br>
    <div  style="border-left-style:solid;border-left-width:15px;border-left-color:#117799;background-color:#dddddd;position:relative;">
        &nbsp;<i class="fa fa-user-circle fa-5x" aria-hidden="true"></i>&nbsp;<h3 style="position: absolute;top: 50%;transform: translateY(-50%);">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${one_content.feeling}</h3>
    </div><br>
    ${one_content.content}
    <hr>
    <div id="comment">

        <div id="comment_show" style="background-color: #F8F8F8">
            <hr>
            <#if have_comment=0>
            <h4 style="text-align: center"><#if (user)??><a>现在还没有评论喔,要不要来一条?</a><#else><a>点击网页顶部注册,就可以评论了!</a></#if>
            </h4>
            <br>
            <#elseif have_comment=1>
            <#list comment_list as cl>
                <h4><a>${cl.userName}</a>:</h4>
                <div style="background-color: #E8E8E8;margin-left: 6%;margin-right: 6%">
                    <#if cl.hot=1>
                        <a style="color: red;">${cl.comment}</a>
                    <#elseif cl.hot=0>
                        <a style="color: black;">${cl.comment}</a>
                    </#if>
                </div>
                <br>
            </#list>
            </#if>
            <hr>
        </div>
        <#if user?exists>
            <div id="comment_edit">
                <input type="text" class="form-control" id="comment_input" placeholder="想说说点什么吗?" style="width: 80%;display:inline">
                <button type="button" class="btn btn-info btn-lg" style="margin-left: 5%;display:inline" onclick="getValue()">
                    <i class="fa fa-commenting-o" aria-hidden="true"></i> 评论
                </button>
            </div>
        </#if>
        <br>
    </div>
    <br>
</div>
<#include "./common/foot.ftl">

<!-- load JS files -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/jquery.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/tether.min.js"></script> <!-- Tether for Bootstrap, http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.js"></script>                 <!-- Bootstrap (http://v4-alpha.getbootstrap.com/) -->
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/html5shiv.min.js"></script>
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/respond.min.js"></script>
<script type="text/javascript">
    function getValue(){
        var comment = {}
        comment.comment=$('#comment_input').val()
        comment.articleId=$("input[name='articleId']").val();
        // alert(comment.comment+comment.articleId)
        if (comment.comment==null)
        {
            alert("空评论可不行喔~")
            return
        }
        if (comment.articleId==null)
        {
            alert("乱改东西可不行喔~")
            return
        }
        $.ajax({
            url:"/v1/comment/save",
            type:"post",
            contentType : "application/json; charset=UTF-8",
            data:JSON.stringify(comment),
            success:function(data){
                        // alert(data)
                        if (data == "评论成功!"){
                            window.location.reload();
                        }
            }
        })
    }
</script>

</body>
</html>