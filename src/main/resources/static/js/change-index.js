function uploadImage(element) {
    //上传图片
    var req = '#img' + element
    if ($(req).val() == null || $(req).val() == '') {
        alert("没有要上传的图片")
        return;
    }
    doUpload(element);
}

function doUpload(element) {
    var form = '#upload' + element
    var multipartFile = new FormData($(form)[0]);
    $.ajax({
        url: '/v1/upload',
        type: 'POST',
        cache: false,
        data: multipartFile,
        processData: false,
        contentType: false
    }).success(function (res) {
        var req = '#url' + element
        var url = res.data
        alert("上传成功")
        $(req).text(url)
    }).fail(function (res) {
        alert("上传失败")
    });
}

function saveHot() {
    var hots = new Array()
    var hot1 = {}
    hot1.id = 1;
    hot1.articleId = $('#id1').val()
    hot1.title = $('#title1').val()
    hot1.headImage = $('#url1').text()
    hot1.content = $('#feeling1').val()
    hots[0] = hot1
    var hot2 = {}
    hot2.id = 2;
    hot2.articleId = $('#id2').val()
    hot2.title = $('#title2').val()
    hot2.headImage = $('#url2').text()
    hot2.content = $('#feeling2').val()
    hots[1] = hot2
    var hot3 = {}
    hot3.id = 3;
    hot3.articleId = $('#id3').val()
    hot3.title = $('#title3').val()
    hot3.headImage = $('#url3').text()
    hot3.content = $('#feeling3').val()
    hots[2] = hot3
    var hot4 = {}
    hot4.id = 4;
    hot4.articleId = $('#id4').val()
    hot4.title = $('#title4').val()
    hot4.headImage = $('#url4').text()
    hot4.content = $('#feeling4').val()
    hots[3] = hot4
    // var hots = [
    //     { "id":1 , "articleId":$('id1').val(), "title":$('title1').val(), "headImage":$('url1').val(), "content":$('feeling1')},
    //     { "id":2 , "articleId":$('id2').val(), "title":$('title2').val(), "headImage":$('url2').val(), "content":$('feeling2')},
    //     { "id":3 , "articleId":$('id3').val(), "title":$('title3').val(), "headImage":$('url3').val(), "content":$('feeling3')},
    //     { "id":4 , "articleId":$('id4').val(), "title":$('title4').val(), "headImage":$('url4').val(), "content":$('feeling4')}
    // ];
    $.ajax({
        url: "/update/indexSettingHots",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify(hots),
        success: function (data) {
            if (data == "ok") {
                alert("成功")
            } else {
                alert("失败")
            }
        }
    })
}

function saveGood() {
    var good = {}
    good.id = 5;
    good.articleId = $('#idgood').val()
    good.title = $('#titlegood').val()
    good.headImage = $('#urlgood').text()
    good.feeling = $('#feelinggood').val()
    good.content = $('#contextgood').val()
    // alert(good.content)
    $.ajax({
        url: "/update/indexSettingGood",
        type: "post",
        contentType: "application/json; charset=UTF-8",
        data: JSON.stringify(good),
        success: function (data) {
            if (data == "ok") {
                alert("成功")
            } else {
                alert("失败")
            }
        }
    })
}