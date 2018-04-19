<style>
    #svgB{
        background-color: #ffffff;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 100 1000'%3E%3Cg %3E%3Ccircle fill='%23ffffff' cx='50' cy='0' r='50'/%3E%3Cg fill='%23fffbf7' %3E%3Ccircle cx='0' cy='50' r='50'/%3E%3Ccircle cx='100' cy='50' r='50'/%3E%3C/g%3E%3Ccircle fill='%23fff8f0' cx='50' cy='100' r='50'/%3E%3Cg fill='%23fff4e8' %3E%3Ccircle cx='0' cy='150' r='50'/%3E%3Ccircle cx='100' cy='150' r='50'/%3E%3C/g%3E%3Ccircle fill='%23fff0e1' cx='50' cy='200' r='50'/%3E%3Cg fill='%23ffecd9' %3E%3Ccircle cx='0' cy='250' r='50'/%3E%3Ccircle cx='100' cy='250' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffe9d2' cx='50' cy='300' r='50'/%3E%3Cg fill='%23ffe5ca' %3E%3Ccircle cx='0' cy='350' r='50'/%3E%3Ccircle cx='100' cy='350' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffe1c3' cx='50' cy='400' r='50'/%3E%3Cg fill='%23ffdebc' %3E%3Ccircle cx='0' cy='450' r='50'/%3E%3Ccircle cx='100' cy='450' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffdab4' cx='50' cy='500' r='50'/%3E%3Cg fill='%23ffd6ad' %3E%3Ccircle cx='0' cy='550' r='50'/%3E%3Ccircle cx='100' cy='550' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffd3a6' cx='50' cy='600' r='50'/%3E%3Cg fill='%23ffcf9e' %3E%3Ccircle cx='0' cy='650' r='50'/%3E%3Ccircle cx='100' cy='650' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffcc97' cx='50' cy='700' r='50'/%3E%3Cg fill='%23ffc890' %3E%3Ccircle cx='0' cy='750' r='50'/%3E%3Ccircle cx='100' cy='750' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffc488' cx='50' cy='800' r='50'/%3E%3Cg fill='%23ffc181' %3E%3Ccircle cx='0' cy='850' r='50'/%3E%3Ccircle cx='100' cy='850' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffbd7a' cx='50' cy='900' r='50'/%3E%3Cg fill='%23ffba72' %3E%3Ccircle cx='0' cy='950' r='50'/%3E%3Ccircle cx='100' cy='950' r='50'/%3E%3C/g%3E%3Ccircle fill='%23ffb66b' cx='50' cy='1000' r='50'/%3E%3C/g%3E%3C/svg%3E");
        background-attachment: fixed;
        background-size: contain;
        background-position: center;
        color: black;
    }
    input{
        margin-bottom: 10px;
    }
</style>
<#if (forbidden)??>
        <h1 style="text-align: center">页面禁止访问</h1>
<#else>
<div name="网站信息修改" id="svgB">
    <hr style="height:5px;border:none;border-top:5px ridge green;" />
    <div style="margin-left: 30%">
        <table border="0">
            <#if (website_info)??>
                <#list website_info as wi>
                    <tr><td style="text-align: right">${wi.itemDesc}:</td><td><input id="${wi.itemName}" type="text" style="width: 20em;" value="${wi.itemValue}"></td></tr>
                </#list>
            </#if>
        </table>
    </div>
    <hr style="height:1px;border:none;border-top:1px dashed #0066CC;">
    <button style="width: 10%;margin-left: 45%" type="button" class="btn btn-primary" id="save" onclick="saveSiteInfo();"><i
            class="fa fa-floppy-o" aria-hidden="true"></i> 保存
    </button>
    <hr style="height:5px;border:none;border-top:5px ridge green;" />
</div>
<script type="text/javascript">
    function saveSiteInfo() {
        var site_info = {}
        site_info.sitename = $('#sitename').val()
        site_info.title = $('#title').val()
        site_info.subtitle = $('#subtitle').val()
        site_info.motto = $('#motto').val()
        site_info.authorize = $('#authorize').val()
        site_info.site_master_name = $('#site_master_name').val()
        site_info.copyright_text = $('#copyright_text').val()
        site_info.copyright_link = $('#copyright_link').val()
        site_info.copyright_title = $('#copyright_title').val()
        site_info.contact_text = $('#contact_text').val()
        site_info.contact_link = $('#contact_link').val()
        site_info.contact_title = $('#contact_title').val()
        site_info.picture_area_context = $('#picture_area_context').val()
        $.ajax({
            url: "/update/siteInfo",
            type: "post",
            contentType: "application/json; charset=UTF-8",
            data: JSON.stringify(site_info),
            success: function (data) {
                // alert(data);
                if (data == "评论成功!") {
                    window.location.reload();
                }
            }
        })
    }
</script>
</#if>