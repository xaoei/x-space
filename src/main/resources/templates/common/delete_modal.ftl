<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×
                </button>
                <h4 class="modal-title" id="del_modal_title">
                    警告
                </h4>
            </div>
            <div class="modal-body" id="del_modal_content">
                删除了就不能恢复了,请谨慎操作!
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">
                    取消
                </button>
                <button id="deleteButton" type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteItem()">
                    确定
                </button>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    var type;
    var id;
    function openDelete(type_in,id_in){
        type=type_in;
        id=id_in;
        $('#del_modal_title').text('警告');
        $('#del_modal_content').text('删除了就不能恢复了,请谨慎操作!');
        $("#deleteButton").attr("onclick","deleteItem();");
        $('#deleteModal').modal('show')
    }
    function openHot(id_in){
        id=id_in;
        $('#del_modal_title').text('注意');
        $('#del_modal_content').text('你确定要切换这篇文章的热门状态吗?');
        $("#deleteButton").attr("onclick","changeHot("+id_in+");");
        $('#deleteModal').modal('show')
    }
    function changeHot(id_in) {
        $.ajax({
            url: '/update/hot',
            type: "post",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(id_in),
            success: function (data) {
                if (data == "修改成功") {
                    window.location.reload();
                } else {
                    $('#modal_title').text('错误');
                    $('#modal_content').text(data);
                    $('#commonModal').modal('show')
                }
            }
        })
    }
    function deleteItem() {
        // alert(type+','+id);
        $.ajax({
            url: '/delete/'+type,
            type: "post",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(id),
            success: function (data) {
                if (data == "删除成功") {
                    window.location.reload();
                }else {
                    $('#modal_title').text('错误');
                    $('#modal_content').text(data);
                    $('#commonModal').modal('show')
                }
            }
        })
    }
</script>