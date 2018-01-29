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
                            <a href=${item.itemHref} class='nav-link'>${item.itemValue}</a></li>
                        </#list>
                    </ul>
                </div>
            </nav>
        </div>
    </div>
</div>