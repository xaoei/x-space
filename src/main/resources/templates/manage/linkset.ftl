<style>
    #svgB {
        background-color: #ffffff;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg fill-opacity='0.39'%3E%3Cpolygon fill='%23f7fde4' points='800%2C100 0%2C200 0%2C800 1600%2C800 1600%2C200'/%3E%3Cpolygon fill='%23eefac8' points='800%2C200 0%2C400 0%2C800 1600%2C800 1600%2C400'/%3E%3Cpolygon fill='%23e6f8ad' points='800%2C300 0%2C600 0%2C800 1600%2C800 1600%2C600'/%3E%3Cpolygon fill='%23ddf592' points='1600%2C800 800%2C400 0%2C800'/%3E%3Cpolygon fill='%23d5f377' points='1280%2C800 800%2C500 320%2C800'/%3E%3Cpolygon fill='%23ccf05b' points='533.3%2C800 1066.7%2C800 800%2C600'/%3E%3Cpolygon fill='%23c4ee40' points='684.1%2C800 914.3%2C800 800%2C700'/%3E%3C/g%3E%3C/svg%3E");
        background-attachment: fixed;
        background-size: cover;
        background-position: center;
    }

    input {
        margin-bottom: 10px;
    }
</style>
<#if (forbidden)??>
    <h1 style="text-align: center">页面禁止访问</h1>
<#else>
<div name="网站信息修改" id="svgB">
    <hr style="height:5px;border:none;border-top:5px ridge green;"/>
    <div style="margin-left: 30%">
        <table border="0">
            <#if (friend_link)??>
                <#list friend_link as fl>
                    <nobr>名称:<input id="name${fl.id}" type="text" value="${fl.linkValue}">链接:<input id="link${fl.id}"
                type="text" value="${fl.linkHref}"> </nobr><br>
                </#list>

            </#if>
        </table>
    </div>
    <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">
    <button style="width: 10%;margin-left: 45%" type="button" class="btn btn-primary" id="save" onclick="saveLinks();">
        <i
                class="fa fa-floppy-o" aria-hidden="true"></i> 保存
    </button>
    <hr style="height:5px;border:none;border-top:5px ridge green;"/>
</div>
<script type="text/javascript">
    function saveLinks() {
        var links = new Array()
        var link1 = {}
        link1.id = 1
        link1.linkValue = $('#name1').val()
        link1.linkHref = $('#link1').val()
        links[0] = link1
        var link2 = {}
        link2.id = 2
        link2.linkValue = $('#name2').val()
        link2.linkHref = $('#link2').val()
        links[1] = link2
        var link3 = {}
        link3.id = 3
        link3.linkValue = $('#name3').val()
        link3.linkHref = $('#link3').val()
        links[2] = link3
        var link4 = {}
        link4.id = 4
        link4.linkValue = $('#name4').val()
        link4.linkHref = $('#link4').val()
        links[3] = link4
        var link5 = {}
        link5.id = 5
        link5.linkValue = $('#name5').val()
        link5.linkHref = $('#link5').val()
        links[4] = link5
        var link6 = {}
        link6.id = 6
        link6.linkValue = $('#name6').val()
        link6.linkHref = $('#link6').val()
        links[5] = link6
        $.ajax({
            url: "/update/links",
            type: "post",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(links),
            success: function (data) {
                if (data == "ok") {
                    alert("成功")
                } else {
                    alert("失败")
                }
            }
        })
    }
</script>
</#if>