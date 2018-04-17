<style>
    #svgB{
        background-color: #ffffff;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='77' height='77' viewBox='0 0 120 120'%3E%3Cpolygon fill='%23dbab79' fill-opacity='0.12' points='120%2C0 120%2C60 90%2C30 60%2C0 0%2C0 0%2C0 60%2C60 0%2C120 60%2C120 90%2C90 120%2C60 120%2C0'/%3E%3C/svg%3E");
        background-attachment: fixed;
        color: black;
    }
    input{
        margin-bottom: 10px;
    }
</style>
<div name="个人管理" id="svgB">
    <div name="修改密码">
        <hr style="height:5px;border:none;border-top:5px ridge green;" />
        <h2 style="margin-left: 1%">修改密码</h2>
        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">
        <div name="旧的密码" style="margin-left: 5%">
            <h3 style="margin-left: 5%">旧的密码</h3>
            <div style="margin-left: 5%">
                <nobr>旧的密码:<input type="password" style="width: 10em;" id="c_old_password"><a style="font-style: italic">(限制10个字以上!)</a></nobr><br>
            </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">
        <div name="新的密码" style="margin-left: 10%">
            <h3 style="margin-left: 10%">新的密码</h3>
            <div style="margin-left: 10%">
                <nobr>新的密码:<input type="password" style="width: 10em;" id="c_new_password"><a style="font-style: italic">(限制10个字以上!)</a></nobr><br>
            </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">
        <div name="再来一遍" style="margin-left: 15%">
            <h3 style="margin-left: 15%">再来一遍</h3>
            <div style="margin-left: 15%">
                <nobr>再来一遍:<input type="password" style="width: 10em;" id="c_re_password"><a style="font-style: italic">(限制10个字以上!)</a></nobr><br>
            </div>
        </div>
        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">
        <button style="width: 10%;margin-left: 10%" type="button" class="btn btn-primary" id="save" onclick="changePwd();"><i
                class="fa fa-floppy-o" aria-hidden="true"></i> 保存
        </button>
        <hr style="height:5px;border:none;border-top:5px ridge green;" />
    </div>
</div>
<script type="text/javascript">
    function changePwd() {
        var oldP = $('#c_old_password').val()
        var newP = $('#c_new_password').val()
        var reP = $('#c_re_password').val()
        if (!oldP||!newP||!reP){
            return;
        }
        if (oldP==newP){
            alert("新密码和原密码一致");
            return;
        }
        if (reP!=newP){
            alert("两次密码不一致");
            return;
        }
        var pwd = {}
        pwd.oldPwd = oldP;
        pwd.newPwd = newP;
        $.ajax({
            url: "/v1/user/changePwd",
            type: "post",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(pwd),
            success: function (data) {
                // alert(data)
                if (data == "修改成功") {
                    alert("修改成功,请重新登录")
                    window.location.href="/v1/user/logout"
                }else {
                    alert(data)
                }
            }
        })
    }
</script>