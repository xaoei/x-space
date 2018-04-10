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
                <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="deleteItem()">
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
        $('#deleteModal').modal('show')
    }
    function deleteItem() {
        alert(type+','+id);
        var url;
        if (type='image'){
            url='/delete/image';
        }else if(type='article'){
            url='/delete/article';
        }else if(type='article'){
            url='/delete/comment';
        }else if(type='article'){
            url='/delete/user';
        }else{
            return;
        }
        $.ajax({
            url: url,
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