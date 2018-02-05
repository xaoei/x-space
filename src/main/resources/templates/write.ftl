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
                        <textarea style="border-style: dotted;width: 100%;height: 100px; outline: #5bc0de Solid 1px;resize: none;margin-top: 20px" placeholder="文章感想..."></textarea>
                        <form class="col-sm-12">
                            <div style="margin-top: 20px"><i class="fa fa-cubes" aria-hidden="true"></i> 选择分类:
                                <div class="btn-group" data-toggle="buttons" style="">
                                    <label class="btn btn-info">
                                        <input style="width: 20%" type="radio" name="category" id="article"><i class="fa fa-pencil" aria-hidden="true"></i> 文章
                                    </label>
                                    <label class="btn btn-info active">
                                        <input style="width: 20%" type="radio" name="category" id="tech"><i class="fa fa-book" aria-hidden="true"></i> 教程
                                    </label>
                                    <label class="btn btn-info">
                                        <input style="width: 20%" type="radio" name="category" id="essay"><i class="fa fa-leaf" aria-hidden="true"></i> 随笔
                                    </label>
                                    <label class="btn btn-info">
                                        <input style="width: 20%" type="radio" name="category" id="reprint"><i class="fa fa-retweet" aria-hidden="true"></i> 转载
                                    </label>
                                    <label class="btn btn-info">
                                        <input style="width: 20%" type="radio" name="category" id="other"><i class="fa fa-paint-brush" aria-hidden="true"></i> 其它
                                    </label>
                                </div>
                            </div>
                        </form>
                        <form class="col-sm-12">
                            <div style="margin-top: 20px"><i class="fa fa-tags" aria-hidden="true"></i> 设置标签:
                                <input style="width: 17%;border-style: dashed" type="text" placeholder="标签1" >
                                <input style="width: 17%;border-style: dashed" type="text" placeholder="标签2" >
                                <input style="width: 17%;border-style: dashed" type="text" placeholder="标签3" >
                                <input style="width: 17%;border-style: dashed" type="text" placeholder="标签4" >
                                <input style="width: 17%;border-style: dashed" type="text" placeholder="标签5" >
                            </div>
                        </form>
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
                article.content=editor.txt.html()
                article.title=$('#title').val()
                return article
            }
            function save(article) {
                alert(JSON.stringify(article))
            }
            function announce(article) {
                alert(JSON.stringify(article))
            }
        </script>
    </body>
</html>