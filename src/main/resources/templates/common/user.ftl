<link rel="stylesheet" type='text/css'
      href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/x-space/css/login-register.css">
<style>
    .btn-primary:active {
        background-color: green !important;
    }
</style>
<div class="modal fade login" id="userModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">修改用户信息</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" action="/change" accept-charset="UTF-8">
                                <a>用户账号:</a>
                                <input id="caccount" class="form-control" type="text" placeholder="修改账号"
                                       name="caccount">
                                <a>用户昵称:</a>
                                <input id="cusername" class="form-control" type="text" placeholder="修改昵称"
                                       name="cusername">
                                <a>用户密码:</a>
                                <input id="cpassword" class="form-control" type="text" placeholder="修改密码"
                                       name="cpassword">
                                <a>用户角色:</a>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary">
                                        <input type="radio" name="role" id="reader" value="reader"> reader
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="radio" name="role" id="author" value="author"> author
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="radio" name="role" id="admin" value="admin"> admin
                                    </label>
                                </div>
                                <a>用户状态:</a>
                                <div class="btn-group" data-toggle="buttons">
                                    <label class="btn btn-primary">
                                        <input type="radio" name="state" id="normal" value="0"> 正常
                                    </label>
                                    <label class="btn btn-primary">
                                        <input type="radio" name="state" id="forbidden" value="1"> 封禁
                                    </label>
                                </div>
                                <input class="btn btn-default btn-login" type="button" value="修改"
                                       onclick="changeAjax()">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer">
                    <span><a style="color: red">谨慎修改用户权限!</a></span>
                </div>
            </div>
        </div>
    </div>
</div>
