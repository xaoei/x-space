<style>
    #avgFB{
        background-color: #000000;
        background-image: url("data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='268' height='32.2' viewBox='0 0 1000 120'%3E%3Cg fill='none' stroke='%23222' stroke-width='11.8' stroke-opacity='0.48'%3E%3Cpath d='M-500%2C75c0%2C0%2C125-30%2C250-30S0%2C75%2C0%2C75s125%2C30%2C250%2C30s250-30%2C250-30s125-30%2C250-30s250%2C30%2C250%2C30s125%2C30%2C250%2C30s250-30%2C250-30'/%3E%3Cpath d='M-500%2C45c0%2C0%2C125-30%2C250-30S0%2C45%2C0%2C45s125%2C30%2C250%2C30s250-30%2C250-30s125-30%2C250-30s250%2C30%2C250%2C30s125%2C30%2C250%2C30s250-30%2C250-30'/%3E%3Cpath d='M-500%2C105c0%2C0%2C125-30%2C250-30S0%2C105%2C0%2C105s125%2C30%2C250%2C30s250-30%2C250-30s125-30%2C250-30s250%2C30%2C250%2C30s125%2C30%2C250%2C30s250-30%2C250-30'/%3E%3Cpath d='M-500%2C15c0%2C0%2C125-30%2C250-30S0%2C15%2C0%2C15s125%2C30%2C250%2C30s250-30%2C250-30s125-30%2C250-30s250%2C30%2C250%2C30s125%2C30%2C250%2C30s250-30%2C250-30'/%3E%3Cpath d='M-500-15c0%2C0%2C125-30%2C250-30S0-15%2C0-15s125%2C30%2C250%2C30s250-30%2C250-30s125-30%2C250-30s250%2C30%2C250%2C30s125%2C30%2C250%2C30s250-30%2C250-30'/%3E%3Cpath d='M-500%2C135c0%2C0%2C125-30%2C250-30S0%2C135%2C0%2C135s125%2C30%2C250%2C30s250-30%2C250-30s125-30%2C250-30s250%2C30%2C250%2C30s125%2C30%2C250%2C30s250-30%2C250-30'/%3E%3C/g%3E%3C/svg%3E");
    }
</style>
<footer class="tm-footer" id="avgFB">
    <div class="container-fluid">
        <div class="row">

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">

                <div class="tm-footer-content-box">
                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">站长信息</h3>
                    <div class="tm-gray-bg">
                        <p>${motto}</p>
                        <p>${authorize}</p>
                        <p><strong>${site_master_name}</strong></p>
                    </div>
                </div>

            </div>

            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="tm-footer-content-box tm-footer-links-container">

                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">友情链接</h3>
                    <nav>
                        <ul class="nav">
                            <#if (friend_links)??>
                                <#list friend_links as fl>
                                    <li><a href=${fl.url} class="tm-footer-link"
                                           style="text-decoration: none">${fl.desc}</a></li>
                                </#list>
                            <#else>
                                <h1>暂无友链!</h1>
                            </#if>

                        </ul>
                    </nav>

                </div>

            </div>

            <!-- Add the extra clearfix for only the required viewport
                http://stackoverflow.com/questions/24590222/bootstrap-3-grid-with-different-height-in-each-item-is-it-solvable-using-only
            -->
            <div class="clearfix hidden-lg-up"></div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="tm-footer-content-box">
                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">最新评论</h3>
                    <hr class="tm-margin-b-30">
                    <#if (comment_links)??>
                        <#list comment_links as cl>
                        <p class="tm-margin-b-30">${cl.desc}<br/><a
                                href=/page/article/${cl.url} style="color:#BBBB88;text-decoration:none">查看原文</a></p>
                            <hr class="tm-margin-b-30">
                        </#list>
                    <#else>
                        <h1>暂无评论!</h1>
                    </#if>
                </div>
            </div>
            <div class="col-xs-12 col-sm-6 col-md-6 col-lg-3 col-xl-3">
                <div class="tm-footer-content-box">
                    <h3 class="tm-gold-text tm-title tm-footer-content-box-title">最新图片</h3>
                    <#if (picture_links)??>
                        <div class="tm-margin-b-30">
                        <#list picture_links as pl>
                            <#--<a href=${pl.link}>-->
                            <a href="/media"}><img style="max-width: 100px;height: 100px;" src=${pl.url} alt="Image" class="tm-footer-thumbnail"></a>
                        </#list>
                        </div>
                        <p class="tm-margin-b-20">${picture_area_context}</p>
                    <#else>
                        <h1>暂无图片!</h1>
                    </#if>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 tm-copyright-col">
                <p class="tm-copyright-text">${copyright_text}<a style="color: #00bbff"
                                                                 href=${copyright_link} target="_blank"
                                                                 title=${copyright_title}>${copyright_title}</a>
                    - ${contact_text} <a style="color: #00bbff" href=${contact_link} title=${contact_title}
                                         target="_blank">${contact_title}</a>
                    <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? "https://" : "http://");document.write(unescape("%3Cspan id='cnzz_stat_icon_1275867862'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s96.cnzz.com/z_stat.php%3Fid%3D1275867862%26show%3Dpic1' type='text/javascript'%3E%3C/script%3E"));</script>
                </p>
            </div>
        </div>
    </div>
</footer>
<#include "./modal.ftl">
<#include "./login_modal.ftl">