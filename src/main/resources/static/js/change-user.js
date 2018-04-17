/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: #
 * 
 */
function showRegisterForm(){
    $('.loginBox').fadeOut('fast',function(){
        $('.registerBox').fadeIn('fast');
        $('.login-footer').fadeOut('fast',function(){
            $('.register-footer').fadeIn('fast');
        });
        $('.modal-title').html('欢迎加入我们!');
    }); 
    $('.error').removeClass('alert alert-danger').html('');
       
}
function showLoginForm(){
    $('#loginModal .registerBox').fadeOut('fast',function(){
        $('.loginBox').fadeIn('fast');
        $('.register-footer').fadeOut('fast',function(){
            $('.login-footer').fadeIn('fast');    
        });
        
        $('.modal-title').html('欢迎回来!');
    });       
     $('.error').removeClass('alert alert-danger').html(''); 
}

function openUserModal(){
    showLoginForm();
    setTimeout(function(){
        $('#userModal').modal('show');
    }, 230);
    
}
function openRegisterModal(){
    showRegisterForm();
    setTimeout(function(){
        $('#loginModal').modal('show');    
    }, 230);
}

function loginAjax(){
    var login_info = {}
    login_info.account = $('#laccount').val()
    login_info.password = $('#lpassword').val()
    $.ajax({
        url:"/v1/user/login",
        type:"post",
        contentType : "application/json; charset=UTF-8",
        data:JSON.stringify(login_info),
        success:function(data){
            if (data.code==1000){
                $('#loginModal').modal('hide')
                $('#lr_modal_title').text("提示");
                $('#lr_modal_content').text("登陆成功!欢迎回来!");
                $('#loginAndRegistModal').modal('show')
            }else {
                shakeModal(data.msg);
            }

        }
    })
}
function registerAjax(){
    var register_info = {}
    register_info.account = $('#raccount').val()
    register_info.username = $('#rusername').val()
    register_info.password = $('#rpassword').val()
    var re_password = $('#rpassword_confirmation').val()
    if (register_info.password!=re_password){
        shakeModal("两次输入密码不一致")
        return
    }
    $.ajax({
        url:"/v1/user/register",
        type:"post",
        contentType : "application/json; charset=UTF-8",
        data:JSON.stringify(register_info),
        success:function(data){
            if (data.code==1000){
                $('#loginModal').modal('hide')
                $('#lr_modal_title').text("提示");
                $('#lr_modal_content').text("注册成功!欢迎你的加入!");
                $('#loginAndRegistModal').modal('show')
            }else {
                shakeModal(data.msg);
            }
        }
    })
}

function shakeModal(msg){
    $('#loginModal .modal-dialog').addClass('shake');
             $('.error').addClass('alert alert-danger').html(msg);
             $('input[type="password"]').val('');
             setTimeout( function(){ 
                $('#loginModal .modal-dialog').removeClass('shake'); 
    }, 1000 ); 
}

   