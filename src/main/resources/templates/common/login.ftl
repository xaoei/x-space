<link rel="stylesheet" type='text/css' href="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/x-space/css/login-register.css">                                   <!-- Templatemo style -->
<div class="modal fade login" id="loginModal">
    <div class="modal-dialog login animated">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title">欢迎回来!</h4>
            </div>
            <div class="modal-body">
                <div class="box">
                    <div class="content">
                        <div class="error"></div>
                        <div class="form loginBox">
                            <form method="post" action="/login" accept-charset="UTF-8">
                                <input id="laccount" class="form-control" type="text" placeholder="邮箱或手机号码"
                                       name="laccount">
                                <input id="lpassword" class="form-control" type="password" placeholder="请输入密码"
                                       name="lpassword">
                                <input class="btn btn-default btn-login" type="button" value="登陆" onclick="loginAjax()">
                            </form>
                        </div>
                    </div>
                </div>
                <div class="box">
                    <div class="content registerBox" style="display:none;">
                        <div class="form">
                            <form method="post" html="{:multipart=>true}" data-remote="true" action="/register"
                                  accept-charset="UTF-8">
                                <input id="raccount" class="form-control" type="text" placeholder="邮箱或手机号码"
                                       name="raccount">
                                <input id="rusername" class="form-control" type="text" placeholder="姓名或昵称"
                                       name="rusername">
                                <input id="rpassword" class="form-control" type="password" placeholder="添加密码"
                                       name="rpassword">
                                <input id="rpassword_confirmation" class="form-control" type="password"
                                       placeholder="重新输入密码" name="rpassword_confirmation">
                                <input class="btn btn-default btn-register" type="button" value="创建新账号"
                                       onclick="registerAjax()">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <div class="forgot login-footer">
					<span>想要
						 <a href="javascript: showRegisterForm();">创建一个新账号</a>
					?</span>
                </div>
                <div class="forgot register-footer" style="display:none">
                    <span>已经是老朋友了?</span>
                    <a href="javascript: showLoginForm();">欢迎回来!</a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="https://leiho-1252251484.cos.ap-shanghai.myqcloud.com/x-space/js/login-register.js"></script>