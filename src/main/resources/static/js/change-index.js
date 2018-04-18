function uploadImage(element) {
    //上传图片
    var req = '#img'+element
    if ($(req).val()==null||$(req).val()==''){
        alert("没有要上传的图片")
        return;
    }
    doUpload(element);
}
function doUpload(element) {
    var form = '#upload'+element
    var multipartFile = new FormData($(form)[0]);
    $.ajax({
        url: '/v1/upload',
        type: 'POST',
        cache: false,
        data: multipartFile,
        processData: false,
        contentType: false
    }).success(function(res) {
        var req = '#url'+element
        var url = "/"+res.data
        alert("上传成功")
        $(req).val(url)
    }).fail(function(res) {
        alert("上传失败")
    });
}
function saveHot() {
    var hots = [
        { "id":"Bill" , "lastName":"Gates" },
        { "id":"George" , "lastName":"Bush" },
        { "id":"Thomas" , "lastName": "Carter" }
        { "id":"Thomas" , "lastName": "Carter" }
    ];
}
function saveGood() {

}