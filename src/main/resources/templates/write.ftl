<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>${sitename}:${page_name}</title>

    <!-- load stylesheets -->
    <link rel="stylesheet" type='text/css' href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/bootstrap.min.css"><!-- Bootstrap style -->
    <link rel="stylesheet" type='text/css' href="css/templatemo-style.css">                                   <!-- Templatemo style -->
    <link rel="stylesheet" type='text/css' href="font-awesome-4.7.0/css/font-awesome.min.css">                                   <!-- Templatemo style -->
    <link rel="stylesheet" type='text/css' href="css/buttons.css">                                   <!-- Templatemo style -->
</head>
    <body>
        <#include "./common/head.ftl">
        <div class="tm-blog-img-container">
        </div>
        <section class="tm-section">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xs-12 col-sm-12 col-md-8 col-lg-9 col-xl-9">
                        <div id="editor"></div>
                        <textarea style="border-style: dotted;width: 100%;height: 100px; outline: #5bc0de Solid 1px;resize: none;margin-top: 20px" placeholder="文章感想..." id="feeling"></textarea>
                        <form class="col-sm-12">
                            <div style="margin-top: 20px"><i class="fa fa-cubes" aria-hidden="true"></i> 选择分类:
                                <div class="btn-group" data-toggle="buttons">
                                    <#list types as item>
                                        <label class="btn btn-primary">
                                            <input style="width: 20%" type="radio" name="category" value=${item.id}>${item.typeName}
                                        </label>
                                    </#list>
                                </div>
                            </div>
                        </form>
                        <div class="col-sm-12">
                            <div style="margin-top: 20px">
                                <i class="fa fa-tags" aria-hidden="true"></i> 设置标签:
                                <input style="width: 60%;border-style: dashed" type="text" placeholder="多个标签需以逗号分隔" id="newTags">
                                <button type="button" class="btn btn-info" onclick="addNewTags()"><i class="fa fa-floppy-o" aria-hidden="true"></i>  添加新标签</button>
                            </div>
                        </div>
                        <div class="col-sm-12" id="tagsAreaSide">
                            <div class="btn-group-sm" id="tagsArea" data-toggle="buttons">
                                <#list tags as item>
                                    <label class="btn btn-sm" style="background-color: #F6F6F6;color: #666666" onclick="buttonChoose(this)">
                                        <input type="checkbox" name="tag" mark="unchecked" value=${item.id}>${item.tagName}
                                    </label>
                                </#list>
                            </div>
                        </div>
                        <form class="col-sm-12">
                            <div style="margin-top: 20px"><i class="fa fa-rocket" aria-hidden="true"></i> 文章标题:
                                <input style="width: 60%;border-style: double" type="text" id="title" placeholder="造个大新闻..." >
                                <button style="width: 10%" type="button" class="btn btn-primary" id="save"><i class="fa fa-floppy-o" aria-hidden="true"></i>  保存</button>
                                <button style="width: 10%" type="button" class="btn btn-success" id="announce"><i class="fa fa-paper-plane-o" aria-hidden="true"></i> 发布</button>
                            </div>
                        </form>
                    </div>
                    <#include "./common/sidebar.ftl">
                </div>
            </div>
        </section>
        <#include "./common/modal.ftl">
        <#include "./common/foot.ftl">

        <!-- load JS files -->
        <script src="js/jquery.min.js"></script>             <!-- jQuery (https://jquery.com/download/) -->
        <script src="js/tether.min.js"></script> <!-- Tether for Bootstrap, http://stackoverflow.com/questions/34567939/how-to-fix-the-error-error-bootstrap-tooltips-require-tether-http-github-h -->
        <script src="js/bootstrap.min.js"></script>                 <!-- Bootstrap (http://v4-alpha.getbootstrap.com/) -->
        <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/html5shiv.min.js"></script>
        <script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/%E5%BC%80%E5%8F%91%E7%94%A8%E6%96%87%E4%BB%B6%E5%A4%B9/x-space/respond.min.js"></script>
        <!-- 引用js -->
        <script type="text/javascript" src="js/wangEditor.min.js"></script>
        <script type="text/javascript">
            var E = window.wangEditor
            var editor = new E('#editor')
            editor.create()
            editor.txt.html('')

            document.getElementById('save').addEventListener('click', function () {
                var article = getValue()
                save(article)
            }, false)

            document.getElementById('announce').addEventListener('click', function () {
                var article = getValue()
                announce(article)
            }, false)
            function getValue(){
                var article = {}
                article.id=editor.article_id
                article.content=editor.txt.html()
                article.title=$('#title').val()
                article.type=$('input:radio[name="category"]:checked').val()
                article.feeling=$('#feeling').val()
                article.tags=getTags()
                return article
            }
            function addNewTags(){
                var tags = $('#newTags').val()
                if (tags!=null&&tags!=""&&tags!="''"){
                    $.ajax({
                        url:"http://localhost:8888/v1/addNewTags",
                        type:"post",
                        contentType : "application/json; charset=UTF-8",
                        data:JSON.stringify(tags),
                        success:function(data){
                            if (data.code==1000){
                                $("#tagsArea").remove();
                                var newTags = "<div class=\"btn-group-sm\" id=\"tagsArea\" data-toggle=\"buttons\">"
                                $.each($.parseJSON("["+data.tags+"]"), function (n, item) {
                                    newTags +=
                                            "<label class=\"btn btn-sm\" style=\"background-color: #F6F6F6;color: #666666\" onclick=\"buttonChoose(this)\">\n" +
                                            "  <input type=\"checkbox\" name=\"tag\" mark=\"unchecked\" value="+item.id+">"+item.tagName+"\n" +
                                            "</label>"
                                });
                                newTags += "</div>"
                                $("#tagsAreaSide").append(newTags)
                                $("#tagsAreaSide").load(location.href+" #tagsAreaSide");
                            }else {
                                $("#modal_title").text("警告");
                                $("#modal_content").text(data.msg);
                                $('#commonModal').modal('show')
                            }
                        }
                    })
                }
            }
            function getTags() {
                var tagList =[];
                $('input:checkbox[name="tag"]:checked').each(function(){
                    tagList.push($(this).val());
                });
                if (tagList.length>0){
                    var tags = tagList[0];
                    if (tagList.length>1){
                        for (var i=1;i<tagList.length;i++){
                            tags = tags +","+tagList[i]
                        }
                    }
                    return tags
                }
            }
            function save(article) {
                $.ajax({
                    url:"http://localhost:8888/v1/write/save",
                    type:"post",
                    contentType : "application/json; charset=UTF-8",
                    data:JSON.stringify(article),
                    success:function(data){
                        if (data.id!=null){
                            //将id写入
                            editor.article_id = data.id
                        }
                        if (data.code==1000){
                            $("#modal_title").text("提示");
                        }else {
                            $("#modal_title").text("警告");
                        }
                        $("#modal_content").text(data.msg);
                        $('#commonModal').modal('show')
                    }
                })
            }
            function announce(article) {
                $.ajax({
                    url:"http://localhost:8888/v1/write/announce",
                    type:"post",
                    contentType : "application/json; charset=UTF-8",
                    data:JSON.stringify(article),
                    success:function(data){
                        if (data.id!=null){
                            //将id写入
                            editor.article_id = data.id
                        }
                        if (data.code==1000){
                            $("#modal_title").text("提示");
                        }else {
                            $("#modal_title").text("警告");
                        }
                        $("#modal_content").text(data.msg);
                        $('#commonModal').modal('show')
                    }
                })
            }
            function buttonChoose(e)
            {
                if ("checked"!=e.mark){
                    e.mark = "checked"
                    e.style.backgroundColor = "#FEC04E";
                    e.style.color = "#FFFFFF";
                }else {
                    e.mark = "unchecked"
                    e.style.backgroundColor = "#F6F6F6"
                    e.style.color = "#666666"
                }
            }
        </script>
    </body>
</html>