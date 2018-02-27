<style>
    <#--修复模态框隐藏时出现的body多了'padding-right: 17px;'的问题 -->
    body {
        padding-right: 0px !important;
    }
    *.modal-open {
        overflow-y: scroll;
        padding-right: 0 !important;
    }
</style>
<div class="tm-header">
    <div class="container-fluid">
        <div class="tm-header-inner">
            <a href="#" class="navbar-brand tm-site-name">${sitename}</a>
            <!-- navbar -->
            <nav class="navbar tm-main-nav">
                <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse" data-target="#tmNavbar">
                    &#9776;
                </button>
                <div class="collapse navbar-toggleable-sm" id="tmNavbar">
                    <ul class="nav navbar-nav">
                        <#list head_items as item>
                            <#if item.isSelective == 1>
                            <li class='nav-item active'>
                            <#else>
                            <li class='nav-item'>
                            </#if>
                            <#if item.sortId == 5 && user?exists>
                            <a href="/v1/user/logout" class='nav-link'><#--${user.username}-->退出</a></li>
                            <#elseif item.sortId == 5>
                            <a href="/v1/user/login" data-toggle="modal" class='nav-link' onclick="openLoginModal();">${item.itemValue}</a></li>
                            <#else >
                            <a href=${item.itemHref} class='nav-link'>${item.itemValue}</a></li>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<#include "./login.ftl">