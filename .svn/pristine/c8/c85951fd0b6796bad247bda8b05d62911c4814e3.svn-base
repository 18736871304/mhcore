<%@ page contentType="text/html;charset=utf-8"%>
<html>

<%	
	Object obj = request.getSession().getAttribute("iamsuserinfo");
	if(obj == null)
	{
		request.getRequestDispatcher("index.jsp").forward(request, response);
	}
%>

<%@ include file="/WEB-INF/common/include.jsp"%>

<script>
	
var onlyOpenTitle="欢迎使用";//不允许关闭的标签的标题
	
var _menus;
	
	window.onload = function()
	{
		//$("#mainPanle").attr('src',"commonMenu.do?menuurl=notice/homePageNotice");
		//treeinit();
		ajaxdeal("AuthMenuList.do?userCode="+$('#iamsopr').val(),null,init_menu,null);
	}
	
	function init_menu(data)
	{
		_menus = data;
		
		InitLeftMenu();
		
		tabClose();
		tabCloseEven();
	}
	
	/*
	tree型的展示
	function showmenu(node)
	{
		if(node.attributes!=undefined)
		{
			$("#mainPanle").attr('src',node.attributes.url);
		}
	}
	
	function treeinit()
	{		
		$("#lefttree").tree(
		{
			url:'AuthMenuList.do?userCode='+$('#iamsopr').val(),
	    	onClick: function(node)
	    	{
		    	showmenu(node);
			}
		})
	}
	*/
	function InitLeftMenu() 
	{
		$("#nav").accordion({animate:false,fit:true,border:false});
		var selectedPanelname = '';
	    $.each(_menus, function(i, n) 
	    {
			var menulist ='';
			menulist +='<ul class="navlist">';
	        $.each(n.children, function(j, o) 
	        {
				menulist += '<li><div ><a ref="'+o.id+'" href="#" rel="' + o.url + '" ><span class="smsicon '+o.iconCls+'" >&nbsp;</span><span class="nav">' + o.text + '</span></a></div> ';

				if(o.children && o.children.length>0)
				{
					menulist += '<ul class="third_ul">';
					$.each(o.children,function(k,p)
					{
						menulist += '<li><div><a ref="'+p.id+'" href="#" rel="' + p.url + '" ><span class="smsicon '+p.iconCls+'" >&nbsp;</span><span class="nav">' + p.text + '</span></a></div> </li>'
					});
					menulist += '</ul>';
				}
				menulist+='</li>';
	        })
			menulist += '</ul>';

			$('#nav').accordion('add', 
			{
	            title: n.text,
	            content: menulist,
				border:false,
	            iconCls: 'smsicon ' + n.iconCls
	        });

			if(i==0)
			selectedPanelname =n.text;

	    });
		$('#nav').accordion('select',selectedPanelname);

		
		$('.navlist li a').click(function()
		{
			var tabTitle = $(this).children('.nav').text();

			var url = $(this).attr("rel");
			var menuid = $(this).attr("ref");
			var icon = $(this).find('.smsicon').attr('class');

			var third = find(menuid);
			if(third && third.children && third.children.length>0)
			{
				$('.third_ul').slideUp();

				var ul =$(this).parent().next();
				if(ul.is(":hidden"))
				{
					ul.slideDown();
				}
				else
				{
					ul.slideUp();
				}
			}
			else
			{
				addTab(tabTitle,url,icon);
				$('.navlist li div').removeClass("selected");
				$(this).parent().addClass("selected");
			}
		}).hover(function(){
			$(this).parent().addClass("hover");
		},function(){
			$(this).parent().removeClass("hover");
		});
		
	}
	
	function find(menuid)
	{
		var obj=null;
		$.each(_menus, function(i, n) 
		{
			$.each(n.children, function(j, o) 
			{
			 	if(o.id==menuid)
			 	{
					obj = o;
				}
			 });
		});
		return obj;
	}

	function addTab(subtitle,url,icon)
	{
		if(!$('#tabs').tabs('exists',subtitle))
		{
			$('#tabs').tabs('add',
			{
				title:subtitle,
				content:createFrame(url),
				closable:true,
				icon:icon
			});
		}
		else
		{
			$('#tabs').tabs('select',subtitle);
			$('#mm-tabupdate').click();
		}
		tabClose();
	}
	
	function tabClose()
	{
		/*双击关闭TAB选项卡*/
		$(".tabs-inner").dblclick(function(){
			var subtitle = $(this).children(".tabs-closable").text();
			$('#tabs').tabs('close',subtitle);
		})
		/*为选项卡绑定右键*/
		$(".tabs-inner").bind('contextmenu',function(e){
			$('#mm').menu('show', {
				left: e.pageX,
				top: e.pageY
			});

			var subtitle =$(this).children(".tabs-closable").text();

			$('#mm').data("currtab",subtitle);
			$('#tabs').tabs('select',subtitle);
			return false;
		});
	}


	//绑定右键菜单事件
	function tabCloseEven() {

	    $('#mm').menu(
	    {
	        onClick: function (item) 
	        {
	            closeTab(item.id);
	        }
	    });

	    return false;
	}

	function createFrame(url)
	{
		var s = '<iframe scrolling="auto" frameborder="0"  src="'+url+'" style="width:100%;height:100%;"></iframe>';
		return s;
	}
	
	function closeTab(action)
	{
	    var alltabs = $('#tabs').tabs('tabs');
	    var currentTab =$('#tabs').tabs('getSelected');
		var allTabtitle = [];
		$.each(alltabs,function(i,n)
		{
			allTabtitle.push($(n).panel('options').title);
		})
		
	    switch (action) 
	    {
	        case "refresh":
	            var iframe = $(currentTab.panel('options').content);
	            var src = iframe.attr('src');
	            $('#tabs').tabs('update', 
	            {
	                tab: currentTab,
	                options: {
	                    content: createFrame(src)
	                }
	            })
	            break;
	        case "close":
	            var currtab_title = currentTab.panel('options').title;
	            $('#tabs').tabs('close', currtab_title);
	            break;
	        case "closeall":
	            $.each(allTabtitle, function (i, n) 
	            {
	                if (n != onlyOpenTitle)
	                {
	                    $('#tabs').tabs('close', n);
					}
	            });
	            break;
	        case "closeother":
	            var currtab_title = currentTab.panel('options').title;
	            $.each(allTabtitle, function (i, n) {
	                if (n != currtab_title && n != onlyOpenTitle)
					{
	                    $('#tabs').tabs('close', n);
					}
	            });
	            break;
	        case "closeright":
	            var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);

	            if (tabIndex == alltabs.length - 1){
	                alert('亲，后边没有啦 ^@^!!');
	                return false;
	            }
	            $.each(allTabtitle, function (i, n) {
	                if (i > tabIndex) {
	                    if (n != onlyOpenTitle){
	                        $('#tabs').tabs('close', n);
						}
	                }
	            });

	            break;
	        case "closeleft":
	            var tabIndex = $('#tabs').tabs('getTabIndex', currentTab);
	            if (tabIndex == 1) {
	                alert('亲，前边那个上头有人，咱惹不起哦。 ^@^!!');
	                return false;
	            }
	            $.each(allTabtitle, function (i, n) {
	                if (i < tabIndex) {
	                    if (n != onlyOpenTitle){
	                        $('#tabs').tabs('close', n);
						}
	                }
	            });

	            break;
	        case "exit":
	            $('#closeMenu').menu('hide');
	            break;
	    }
	}
	

</script>

<style>
.title{
	font-family: 微软雅黑;
	font-size:24px;
	color: #226cc5
}
</style>

<head>	
	<title>美华核心管理系统</title>
</head>
<body class="easyui-layout" style="overflow-y: hidden"  fit="true"   scroll="no">
	<div data-options="region:'north',border:false" style="height:48px;">
		 
		<table bgcolor="#a6c4e8" width="100%">
			<tr>
				<td align="center" style="height:48px;" width="95%">
					<div class = "title">
						美华核心管理系统
					</div>
				</td>
				<td align="right" style="height:48px;" width="5%">
					<div style="text-align: right;margin-top: 13px;margin-right: 20px"><a href="logout.do" style="font-size: 16px;color:red">注销</a></div>
				</td>
			</tr>
		</table>
		 
	</div>
	<div data-options="region:'west',split:true,title:'导航菜单'" style="width:180px;">
		 <!--  
		 <ul id="lefttree" class="easyui-tree" data-options="animate:true,lines:true"></ul>
		 --> 
		 <div id="nav"></div>
		 
	</div>
	<div data-options="region:'south',border:false" style="height:20px;"></div>
	<div data-options="region:'center'",id = "frm_center">
        <div id="tabs" class="easyui-tabs"  fit="true" border="false" >
        	<div title="欢迎使用" style="padding:20px;overflow:hidden; color:red; " >
        		<iframe id="mainPanle" scrolling="auto" frameborder="0" style="width:100%;height:100%;"></iframe>
        	</div>
        </div>
	</div>
	
	<div id="mm" class="easyui-menu" style="width:150px;">
		<div id="refresh">刷新</div>
		<div class="menu-sep"></div>
		<div id="close">关闭</div>
		<div id="closeall">全部关闭</div>
		<div id="closeother">除此之外全部关闭</div>
		<div class="menu-sep"></div>
		<div id="closeright">当前页右侧全部关闭</div>
		<div id="closeleft">当前页左侧全部关闭</div>
		<div class="menu-sep"></div>
		<div id="exit">退出</div>
	</div>
</body>
</html>