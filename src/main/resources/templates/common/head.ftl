<style>
    <#--修复模态框隐藏时出现的body多了'padding-right: 17px;'的问题 -->
    body {
        padding-right: 0px !important;
    }

    *.modal-open {
        overflow-y: scroll;
        padding-right: 0 !important;
    }
    #svgH{
        background-color: #12dbff;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='100%25' height='100%25' viewBox='0 0 1600 800'%3E%3Cg stroke='%23f2fff8' stroke-width='59.5' stroke-opacity='0.29' %3E%3Ccircle fill='%2312dbff' cx='0' cy='0' r='1800'/%3E%3Ccircle fill='%231dccff' cx='0' cy='0' r='1700'/%3E%3Ccircle fill='%2328beff' cx='0' cy='0' r='1600'/%3E%3Ccircle fill='%2334b2ff' cx='0' cy='0' r='1500'/%3E%3Ccircle fill='%233fa8ff' cx='0' cy='0' r='1400'/%3E%3Ccircle fill='%234a9fff' cx='0' cy='0' r='1300'/%3E%3Ccircle fill='%235598ff' cx='0' cy='0' r='1200'/%3E%3Ccircle fill='%236193ff' cx='0' cy='0' r='1100'/%3E%3Ccircle fill='%236c90ff' cx='0' cy='0' r='1000'/%3E%3Ccircle fill='%23778eff' cx='0' cy='0' r='900'/%3E%3Ccircle fill='%23828eff' cx='0' cy='0' r='800'/%3E%3Ccircle fill='%238e90ff' cx='0' cy='0' r='700'/%3E%3Ccircle fill='%239f99ff' cx='0' cy='0' r='600'/%3E%3Ccircle fill='%23b0a4ff' cx='0' cy='0' r='500'/%3E%3Ccircle fill='%23c0afff' cx='0' cy='0' r='400'/%3E%3Ccircle fill='%23cebbff' cx='0' cy='0' r='300'/%3E%3Ccircle fill='%23dac6ff' cx='0' cy='0' r='200'/%3E%3Ccircle fill='%23e5d1ff' cx='0' cy='0' r='100'/%3E%3C/g%3E%3C/svg%3E");
        background-attachment: fixed;
        background-size: cover;
        background-position: center;
    }
</style>
<div class="tm-header" id="svgH">
    <div class="container-fluid">
        <div class="tm-header-inner">
            <a href="/" class="navbar-brand tm-site-name">${sitename}</a>
            <!-- navbar -->
            <nav class="navbar tm-main-nav">
                <button class="navbar-toggler hidden-md-up" type="button" data-toggle="collapse"
                        data-target="#tmNavbar">
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
                            <a href="/v1/user/login" data-toggle="modal" class='nav-link'
                               onclick="openLoginModal();">${item.itemValue}</a></li>
                            <#else >
                            <a href=/${item.itemHref} class='nav-link'>${item.itemValue}</a></li>
                            </#if>
                        </#list>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>
<#include "./login.ftl">