<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>中医诊疗系统|实用保健医学资讯</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <meta name="keyword" content ="中医,诊疗"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/test1.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/sidebar.js"></script>

    <script type="text/javascript">
        //点击搜索将方剂数据取回
        function myclick() {
            var text = $("#MedicineName").val();
            $.ajax({
                type : 'get',
                url : '${pageContext.request.contextPath}/Search',
                data : {

                    'text' : text, //把数据发给servlet
                },
                dataType : 'json',
                success : function(data) {

                    var mDiv = $("#ycontent"); //通过ID取到可以拿的控件--等jwj发代码给我
                    mDiv.css('display','block');


                    mDiv.html( "<tr><th>"+"方剂名"+"</th><td>"+data.name+"</td> </tr>"+
                        "<tr><th>"+"功用大类"+"</th> <td>"+data.mclass+"</td> </tr>"+
                        "<tr> <th>"+"功用小类"+"</th><td>"+data.sclass+"</td> </tr>"+
                        "<tr><th>"+"组成成分"+"</th><td>"+data.component+"</td> </tr>"+
                        "<tr><th>"+"功效"+"</th> <td>"+data.effect+"</td></tr>"+
                        "<tr><th>"+"症状"+"</th> <td>"+data.symptom+"</td></tr>"
                    );



                    window.console.log(mDiv.innerHTML);
                    window.console.log('成功回调函数');

                },
                error : function() {
                    window.console.log('失败回调函数');
                }
            })
        }

        //提示条目点击事件，将该行添加到搜索input中

        function rowClick(obj) {
            var rowText = obj.innerHTML;
            var sInput = $("#MedicineName");
            var showText = $("#MedicineList");
            sInput.val(rowText);
            showText.css('display','None');
        }


        //ajax搜索函数将input中的参数发给servlet，
        //然后将servlet返回的列表显示在搜索条下面的div中
        function search(obj) {
//         window.console.log(obj.value);
            var text = obj.value;
            var showText = $("#MedicineList");
            showText.css('display','block');
            var content = "";
            if(text==''){
                return;
            }
            $.ajax({
                type : 'get',
                url : '${pageContext.request.contextPath}/SearchName',
                data : {
                    'text' : text, //把数据发给servlet
                },
                dataType : 'json',
                success : function(data) {
                    for(var i=0;i<data.length;i++){
//                 window.console.log(data[i].name);
                        content += "<div class='show-row' onclick='rowClick(this);'>" + data[i] + "</div>"
                    }
                    showText.html(content);
//                 window.console.log(data);
                    window.console.log('成功回调函数');

                },
                error : function() {
                    window.console.log('失败回调函数');
                }
            })
        }

    </script>



</head>
<body>
<div id="navbar"> <!--导航栏-->
    <ul>
        <li><span><img src="${pageContext.request.contextPath}/images/icon_1.png"/></span></li>
        <li><a href="#">首页</a></li>
        <li><img src="${pageContext.request.contextPath}/images/img.png"></li>
        <li><a href="#">经方</a></li>
        <li><img src="${pageContext.request.contextPath}/images/img.png"></li>
        <li><a href="#">针灸</a></li>
        <li><img src="${pageContext.request.contextPath}/images/img.png"></li>
        <li><a href="#">登录</a></li>
        <li><img src="${pageContext.request.contextPath}/images/img.png"></li>
        <li><a href="#">注册</a></li>
    </ul>
    <span class="icon"><img src="${pageContext.request.contextPath}/images/icon_2.png"/></span>
</div>
<div id="login"><!--登录、注册--></div>

<div id="container"> <!--内容-->


    <div id="search"> <!--搜索框-->


        <div class="searchIcon">
            <img src="${pageContext.request.contextPath}/images/logo.png" alt="logo" height="46" width="122"/>
        </div>

        <div class="searchContainer">

            <input type="text" placeholder="请输入方剂名" class="searchInput" name="MedicineName" id="MedicineName" value="" onkeyup="search(this);"/>

            <div id="MedicineList" class="searchList"></div>

        </div>

        <button onclick="myclick()"class="searchBtn">查询</button>


    </div>




    <div id="sidebar"> <!--侧边导航-->
        <div class="all">
            <span class="all_text">快速查经方</span>
        </div>
        <div class="sidebar_main">
            <dl>
                <dt onClick="changeimages()">壹&emsp;解表方<img src="${pageContext.request.contextPath}/images/icon.png"><img src="images/icon.png"></dt>
                <dd><a href="#">辛温解表</a></dd>
                <dd><a href="#">辛凉解表</a></dd>
                <dd><a href="#">扶正解表</a></dd>
                <dd><a href="#">全部</a></dd>
            </dl>

            <dl>
                <dt onClick="changeimages()">贰&emsp;泻下方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>
                <dd><a href="#">寒下</a></dd>
                <dd><a href="#">温下</a></dd>
                <dd><a href="#">润下</a></dd>
                <dd><a href="#">逐水</a></dd>
                <dd><a href="#">攻补兼施</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">叁&emsp;和解方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">和解少阳</a></dd>
                <dd><a href="#">调和脾胃</a></dd>
                <dd><a href="#">调和肠胃</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">肆&emsp;清热方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">清气分热</a></dd>
                <dd><a href="#">清营凉血</a></dd>
                <dd><a href="#">清热解毒</a></dd>
                <dd><a href="#">清脏腑热</a></dd>
                <dd><a href="#">清虚热</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">伍&emsp;祛暑方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">祛暑方</a></dd>
                <dd><a href="#">清暑利湿</a></dd>
                <dd><a href="#">清心解暑</a></dd>
                <dd><a href="#">祛暑解表</a></dd>
                <dd><a href="#">祛暑清肝</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">陆&emsp;温里方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>
                >
                <dd><a href="#">温中祛寒</a></dd>
                <dd><a href="#">回阳救逆</a></dd>
                <dd><a href="#">温经散寒</a></dd>
                <dd><a href="#">温通心阳</a></dd>
                <dd><a href="#">稳中缓急</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">柒&emsp;补益方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">补气</a></dd>
                <dd><a href="#">补血</a></dd>
                <dd><a href="#">气血双补</a></dd>
                <dd><a href="#">补阴</a></dd>
                <dd><a href="#">补阳</a></dd>
                <dd><a href="#">阴阳双补</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">捌&emsp;固涩方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">固表止汗</a></dd>
                <dd><a href="#">敛肺止咳</a></dd>
                <dd><a href="#">涩肠固脱</a></dd>
                <dd><a href="#">涩精止遗</a></dd>
                <dd><a href="#">固崩止带</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">玖&emsp;安神方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">重镇安神</a></dd>
                <dd><a href="#">滋养安神</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾&emsp;开窍方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">温开</a></dd>
                <dd><a href="#">凉开</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾壹&emsp;理气方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">行气</a></dd>
                <dd><a href="#">降气</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾贰&emsp;理血方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">活血祛瘀</a></dd>
                <dd><a href="#">止血</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾叁&emsp;治风方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">疏散外风</a></dd>
                <dd><a href="#">平熄内风</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾肆&emsp;治燥方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">轻宣外燥</a></dd>
                <dd><a href="#">滋阴润燥</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾伍&emsp;祛湿方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">燥湿和胃</a></dd>
                <dd><a href="#">清热祛湿</a></dd>
                <dd><a href="#">利水渗湿</a></dd>
                <dd><a href="#">温化寒湿</a></dd>
                <dd><a href="#">祛风胜湿</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾陆&emsp;祛痰方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">燥湿化痰</a></dd>
                <dd><a href="#">清热化痰</a></dd>
                <dd><a href="#">润燥化痰</a></dd>
                <dd><a href="#">温化寒痰</a></dd>
                <dd><a href="#">化痰息风</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾柒&emsp;消食方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">消食化滞</a></dd>
                <dd><a href="#">健脾消食</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾捌&emsp;驱虫方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">驱虫方</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">拾玖&emsp;涌吐方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">涌吐方</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>

            <dl>
                <dt onClick="changeimages()">贰拾&emsp;治疡方<img src="${pageContext.request.contextPath}/images/icon.png"></dt>

                <dd><a href="#">外用</a></dd>
                <dd><a href="#">内服</a></dd>
                <dd><a href="#">全部</a></dd>

            </dl>
        </div>
    </div>

    <%--方剂数据显示区域--%>
    <div id="MedicineShow">
        <table id="ycontent">
        </table>
    </div>

</div>
</body>
</html>
