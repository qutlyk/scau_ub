<%@ page errorPage="ShowError.jsp" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="entity.*" %>
<%@page import="model.Model" %>
<%@ page language="java" import="java.util.*"
         contentType="text/html; charset=utf-8" %>
<%@page import="java.text.SimpleDateFormat" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 引入jstl库 -->
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no"/>

    <title>首页</title>

    <link href="../../JSP/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css"/>
    <link href="../../JSP/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css"/>

    <link href="../../JSP/basic/css/demo.css" rel="stylesheet" type="text/css"/>

    <link href="../../JSP/css/hmstyle.css" rel="stylesheet" type="text/css"/>
    <link href="../../JSP/css/skin.css" rel="stylesheet" type="text/css"/>
    <script src="../../JSP/AmazeUI-2.4.2/assets/js/jquery.min.js" type="text/javascript"></script>
    <script src="../../JSP/AmazeUI-2.4.2/assets/js/amazeui.min.js" type="text/javascript"></script>


</head>
<%
    ArrayList<String> bookkindlist = Model.bookkindlist;
    ArrayList<String[]> projectlist = Model.projectlist;
%>

<body>
<div class="hmtop">
    <!--顶部导航条 -->
    <div class="am-container header">
        <ul class="message-l">
            <div class="topMessage">
                <div class="menu-hd">
                    <a href="information.do" target="_top" class="h"
                       style="color:#000000">欢迎你&nbsp${sessionScope.user.getUsername() }&nbsp,</a>
                    &nbsp
                    <a href="index" target="_top" class="h" style="color:#0033ff" text-decoration="underline">退出登录</a>
                </div>
            </div>
        </ul>
        <ul class="message-r">
            <div class="topMessage home">
                <div class="menu-hd">
                    <a href="home" target="_top" class="h"><i
                            class="am-icon-home am-icon-fw"></i>商城首页</a>
                </div>
            </div>
            <div class="topMessage my-shangcheng">
                <div class="menu-hd MyShangcheng">
                    <a href="information" target="_top"><i
                            class="am-icon-user am-icon-fw"></i>个人中心</a>
                </div>
            </div>
            <div class="topMessage mini-cart">
                <div class="menu-hd">
                    <a id="mc-menu-hd" href="shopcart" target="_top"><i
                            class="am-icon-shopping-cart  am-icon-fw"></i><span>藏书夹</span></a>
                </div>
            </div>
            <div class="topMessage favorite">
                <div class="menu-hd">
                    <a href="sellinfo" target="_top"><i
                            class="am-icon-book am-icon-fw"></i><span>旧书交易</span></a>
                </div>
            </div>
        </ul>
    </div>

    <!--悬浮搜索框-->

    <div class="nav white">
        <div class="logo"><img src="../../JSP/images/logo.png"/></div>
        <div class="logoBig">
            <li><img src="../../JSP/images/logobig.png"/></li>
        </div>


        <div class="search-bar pr">
            <a name="index_none_header_sysc" href="#"></a>
            <form action="search.do">
                <input value="${ keyword }" id="searchInput" name="keyword" type="text" placeholder="书名/出版社"
                       autocomplete="on">
                <input id="ai-topsearch" class="submit am-btn" value="搜索" index="1" type="submit">
            </form>
        </div>
    </div>


    <div class="banner">
        <!--轮播 -->
        <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
            <ul class="am-slides">
                <li class="banner1"><a><img src="JSP/images/runpage1.jpg"/></a></li>
                <li class="banner2"><a><img src="JSP/images/runpage2.jpg"/></a></li>
                <li class="banner3"><a><img src="JSP/images/runpage3.jpg"/></a></li>
                <li class="banner4"><a><img src="JSP/images/runpage4.jpg"/></a></li>

            </ul>
        </div>
        <div class="clear"></div>
    </div>

    <div class="shopNav">
        <div class="slideall">

            <div class="long-title"><span class="all-goods">书籍分类</span></div>
            <div class="nav-cont">
                <ul>
                    <li class="index"><a href="home">商城首页</a></li>
                    <li class="qc"><a href="search">旧书列表</a></li>
                    <li class="qc"><a href="information">个人中心</a></li>
                    <li class="qc"><a href="shopcart">我的藏书夹</a></li>
                </ul>

            </div>

            <!--侧边导航 -->
            <div id="nav" class="navfull">
                <div class="area clearfix">
                    <div class="category-content" id="guide_2">

                        <div class="category">
                            <ul class="category-list" id="js_climit_li">
                                <%
                                    int i = 0;
                                    for (String kind : bookkindlist) {
                                %>
                                <li href="introduction" class="appliance js_toggle relative first">
                                    <div class="category-info">
                                        <h3 class="category-name b-category-name"><a class="ml-22"><%=kind %>
                                        </a></h3>
                                        <em>&gt;</em></div>
                                    <div class="menu-item menu-in top">
                                        <div class="area-in">
                                            <div class="area-bg">
                                                <div class="menu-srot">
                                                    <div class="sort-side">
                                                        <dl class="dl-sort">
                                                            <dt><span title="<%=kind %>"><%=kind %></span></dt>
                                                            <%for (String project : projectlist.get(i)) {%>
                                                            <dd><a title="<%=project %>"
                                                                   href="search.do?keyword=<%=project %>"><span><%=project %></span></a>
                                                            </dd>
                                                            <%} %>
                                                        </dl>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <% i++;
                                }%>
                            </ul>
                        </div>
                    </div>

                </div>
            </div>
            <!--轮播 -->
            <script type="text/javascript">
                (function () {
                    $('.am-slider').flexslider();
                });
                $(document).ready(function () {
                    $("li").hover(function () {
                        $(".category-content .category-list li.first .menu-in").css("display", "none");
                        $(".category-content .category-list li.first").removeClass("hover");
                        $(this).addClass("hover");
                        $(this).children("div.menu-in").css("display", "block")
                    }, function () {
                        $(this).removeClass("hover")
                        $(this).children("div.menu-in").css("display", "none")
                    });
                })
            </script>


            <!--小导航 -->


            <!--走马灯 -->

            <div class="marqueen">


                <div class="mod-vip">
                    <div class="m-baseinfo">
                        <a href="information">
                            <img src="../../JSP/images/getAvatar.do.jpg">
                        </a>
                        <em>
                            Hi,<span class="s-name">${sessionScope.user.getUsername() }</span>
                            <br>
                            <font color="#0000FF">虚拟币值：<span class="s-name">${sessionScope.user.getMoney()}</span></font>

                        </em>
                        <br><br>
                        <a href="https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=0&rsv_idx=1
								&tn=baidu&wd=%E6%98%93%E7%8F%AD%E7%BD%91%E8%96%AA&
								rsv_pq=ac118aa50000b067&rsv_t=b97cjMIfSwIYBjhRYBvnixahluGwqqo
								DxR6HMQethrwDQrpDIwTHpl1vO2I&rqlang=cn&rsv_enter=1&
								rsv_sug3=2&rsv_sug1=2&rsv_sug7=100&rsv_sug2=0&
								inputT=3578&rsv_sug4=3579" target="block">
                            <p>想挣点网薪？点击查看攻略来了解一下</p></a>
                    </div>
                    <br><br>

                    <div class="member-logout">
                        <a class="am-btn-warning btn" href="shopcart">我的藏书夹</a>
                        <a class="am-btn-warning btn" href="bookinfo">旧书出售</a>
                    </div>


                </div>


            </div>
        </div>
        <div class="clear"></div>
    </div>
    <script type="text/javascript">
        if (640 > $(window).width()) {
            function autoScroll(obj) {
                $(obj).find("ul").animate({
                    marginTop: "-39px"
                }, 500, function () {
                    $(this).css({
                        marginTop: "0px"
                    }).find("li:first").appendTo(this);
                })
            }

            $(function () {
                setInterval('autoScroll(".demo")', 3000);
            })
        }
    </script>
</div>
<div class="shopMainbg">
    <div class="shopMain" id="shopmain">

        <!--今日推荐 -->

        <div class="am-g am-g-fixed recommendation">
            <div class="clock am-u-sm-3">
            <img src="../../JSP/images/2016.png "/>
            <p>今日<br>推荐</p>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>省钱有趣</h3>
                <h4>旧书换知识</h4>
            </div>
            <div class="recommendationMain one">
                <a href="search.do?keyword=机器学习"><img src="../../JSP/images/tj.png "></img></a>
            </div>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>绿色环保</h3>
                <h4>一起来交换旧书</h4>
            </div>
            <div class="recommendationMain two">
                <a href="search.do?keyword=数字设计"><img src="../../JSP/images/tj1.png "></img></a>
            </div>
        </div>
        <div class="am-u-sm-4 am-u-lg-3 ">
            <div class="info ">
                <h3>华农情谊</h3>
                <h4>我们的旧书有爱</h4>
            </div>
            <div class="recommendationMain three">
                <a href="search.do?keyword=华农"><img src="../../JSP/images/tj2.png "></img></a>
            </div>
        </div>

    </div>

    <div class="clear "></div>
    <!--热门活动 -->

    <div class="am-container activity ">
        <div class="shopTitle ">
            <h4>活动</h4>
            <h3>每期活动 优惠享不停 </h3>
            <span class="more ">
                              <a>全部活动<i class="am-icon-angle-right" style="padding-left:10px ;"></i></a>
                        </span>
        </div>
        <div class="am-g am-g-fixed ">
            <div class="am-u-sm-3 ">
                <div class="icon-sale one "></div>
                <h4>绿色</h4>
                <div class="activityMain ">
                    <a href="search.do?keyword=大学英语"><img src="../../JSP/images/activity1.jpg "></img></a>
                </div>
                <div class="info ">
                    <h3>最绿色的知识阶梯</h3>
                </div>
            </div>

            <div class="am-u-sm-3 ">
                <div class="icon-sale two "></div>
                <h4 href="search.do?keyword=云中歌">特惠</h4>
                <div class="activityMain ">
                    <a href="search.do?keyword=电子技术"><img src="../../JSP/images/activity2.jpg "></img></a>
                </div>
                <div class="info ">
                    <h3>省下钱更多友谊</h3>
                </div>
            </div>

            <div class="am-u-sm-3 ">
                <div class="icon-sale three "></div>
                <h4>团购</h4>
                <div class="activityMain ">
                    <a href="search.do?keyword=云中歌"><img src="../../JSP/images/activity3.jpg "></img></a>
                </div>
                <div class="info ">
                    <h3>把知识打包带走</h3>
                </div>
            </div>

            <div class="am-u-sm-3 last ">
                <div class="icon-sale "></div>
                <h4>超值</h4>
                <div class="activityMain ">
                    <a href="search.do?keyword=云中歌"><img src="../../JSP/images/activity.jpg "></img></a>
                </div>
                <div class="info ">
                    <h3>师姐的书你要吗</h3>
                </div>
            </div>

        </div>
    </div>
    <div class="clear "></div>


    <div id="f1">
        <!--甜点-->

        <div class="am-container ">
            <div class="shopTitle ">
                <h4>你的专业书架</h4>
                <h3>每一本旧书都有一个故事</h3>
                <div class="today-brands ">
                    <a href="search.do?keyword=数据结构">数据结构</a>
                    <a href="search.do?keyword=操作系统">操作系统</a>
                    <a href="search.do?keyword=数据电路">数据电路 </a>
                    <a href="search.do?keyword=C语言实践">C语言实践</a>
                    <a href="search.do?keyword=Java课程设计">Java课程设计</a>

                    <a href="search.do?keyword=">更多好书》》<i class="am-icon-angle-right"
                                                          style="padding-left:0px ;"></i></a>

                </div>
            </div>
        </div>

        <div class="am-g am-g-fixed floodFour">
            <div class="am-u-sm-5 am-u-md-4 text-one list ">
                <div class="word">
                    <a class="outer" href="search.do?keyword=c语言"><span class="inner"><b class="text">c语言</b></span></a>
                    <a class="outer" href="search.do?keyword=c++"><span class="inner"><b class="text">c++</b></span></a>
                    <a class="outer" href="search.do?keyword=c#"><span class="inner"><b class="text">c#</b></span></a>
                    <a class="outer" href="search.do?keyword=Java"><span class="inner"><b
                            class="text">Java</b></span></a>
                    <a class="outer" href="search.do?keyword=Python"><span class="inner"><b
                            class="text">Python</b></span></a>
                    <a class="outer" href="search.do?keyword=Php"><span class="inner"><b class="text">Php</b></span></a>
                </div>
                <a>
                    <div class="outer-con ">
                        <div class="title ">
                            开抢啦！
                        </div>
                        <div class="sub-title ">
                            旧书大礼包
                        </div>
                    </div>
                    <a href="search.do?keyword="><img src="../../JSP/images/act1.png "/> </a>
                </a>
                <div class="triangle-topright"></div>
            </div>

            <div class="am-u-sm-7 am-u-md-4 text-two sug">
                <div class="outer-con ">
                    <div class="title ">
                        冬雪之恋
                    </div>
                    <div class="sub-title ">

                    </div>
                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                </div>
                <a href="search.do?keyword="><img src="../../JSP/images/2.jpg"/></a>
            </div>

            <div class="am-u-sm-7 am-u-md-4 text-two">
                <div class="outer-con ">
                    <div class="title ">
                        秋风之恋
                    </div>
                    <div class="sub-title ">

                    </div>
                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                </div>
                <a href="search.do?keyword="><img src="../../JSP/images/1.jpg"/></a>
            </div>


            <div class="am-u-sm-3 am-u-md-2 text-three big">
                <div class="outer-con ">
                    <div class="title ">
                        夏日之恋
                    </div>
                    <div class="sub-title ">

                    </div>
                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                </div>
                <a href="search.do?keyword="><img src="../../JSP/images/5.jpg"/></a>
            </div>

            <div class="am-u-sm-3 am-u-md-2 text-three sug">
                <div class="outer-con ">
                    <div class="title ">
                        春花之恋
                    </div>
                    <div class="sub-title ">

                    </div>
                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                </div>
                <a href="search.do?keyword="><img src="../../JSP/images/3.jpg"/></a>
            </div>

            <div class="am-u-sm-3 am-u-md-2 text-three ">
                <div class="outer-con ">
                    <div class="title ">
                        你的大学必读
                    </div>
                    <div class="sub-title ">

                    </div>
                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                </div>
                <a href="search.do?keyword="><img src="../../JSP/images/4.jpg"/></a>
            </div>

            <div class="am-u-sm-3 am-u-md-2 text-three last big ">
                <div class="outer-con ">
                    <div class="title ">
                        毕业季送一本书
                    </div>
                    <div class="sub-title ">

                    </div>
                    <i class="am-icon-shopping-basket am-icon-md  seprate"></i>
                </div>
                <a href="search.do?keyword="><img src="../../JSP/images/5.jpg"/></a>
            </div>

        </div>
        <div class="clear "></div>
    </div>


</div>
<div class="footer ">
    <div class="footer-bd">
        <p>
        <center><em>© 2015-2025 SCAU_Used_Book 版权所有. </em></center>
        </p>
    </div>
</div>

</body>


</html>