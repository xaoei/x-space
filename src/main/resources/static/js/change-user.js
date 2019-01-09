/*
 *
 * login-register modal
 * Autor: Creative Tim
 * Web-autor: creative.tim
 * Web script: #
 * 
 */
var postId = '';

function openUserModal(id, account, username, role, del) {
    // showLoginForm();
    postId = id;
    $('#caccount').val(account);
    $('#cusername').val(username);
    if (role == 'reader') {
        $('#reader').prop("checked", true);
        $('#reader').parent().addClass('active');
    } else if (role == 'author') {
        $('#author').prop("checked", true);
        $('#author').parent().addClass('active');
    } else if (role == 'admin') {
        $('#admin').prop("checked", true);
        $('#admin').parent().addClass('active');
    }
    if (del == '0') {
        $('#normal').prop("checked", true);
        $('#normal').parent().addClass('active');
    } else if (del == '1') {
        $('#forbidden').prop("checked", true);
        $('#forbidden').parent().addClass('active');
    }
    setTimeout(function () {
        $('#userModal').modal('show');
    }, 230);
}

function changeAjax() {
    var user_info = {}
    var passwd = $('#cpassword').val()
    if (passwd != null || passwd != "") {
        user_info.password = passwd;
    }
    user_info.id = postId;
    user_info.account = $('#caccount').val()
    user_info.username = $('#cusername').val()
    user_info.role = $('input[name="role"]:checked').val();
    user_info.del = $('input[name="state"]:checked').val();

    // alert(user_info.id)
    // alert(user_info.account)
    // alert(user_info.username)
    // alert(user_info.role)
    // alert(user_info.del)
    $.ajax({
        url: "/update/userInfo",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify(user_info),
        success: function (data) {
            if (data == '修改成功') {
                $('#userModal').modal('hide');
                $('#lr_modal_title').text("提示");
                $('#lr_modal_content').text("修改成功");
                $('#loginAndRegistModal').modal('show');
            } else {
                shakeModal(data);
            }

        }
    })
}

function shakeModal(msg) {
    $('#userModal .modal-dialog').addClass('shake');
    $('.error').addClass('alert alert-danger').html(msg);
    setTimeout(function () {
        $('#userModal .modal-dialog').removeClass('shake');
    }, 1000);
}

   