var _menus = {
		"menus":[{
			"menuid":"1",
			"icon":"icon-sys", 
			"menuname":"系统管理",
			"menus":[{
		     	"menuname":"客户管理",
		     	"icon":"icon-bullet_right",
		     	"url":"khgl"
			     },
			     {
			     	"menuname":"原材料入库",
			     	"icon":"icon-bullet_right",
			     	"url":"khgl.html"
			     },
			     {
			     	"menuname":"货架管理",
			     	"icon":"icon-bullet_right",
			     	"url":"khgl.html"
			     }]
		},{"menuid":"2",
			"icon":"icon-sys", 
			"menuname":"系统管理23",
			"menus":[]}]	
};

$(function(){
	//1.加载菜单
	$(_menus.menus).each(function(i,o){
		var content = "<ul>";
		$(o.menus).each(function(j,k){
			content += "<li><div class='"+k.icon+"' onclick='openMenu(this)' href='"+k.url+"'><span class='"+k.icon+"'>&nbsp;</span>"+k.menuname+"</div></li>";
		})
		content += "</ul>";
		$('#menu').accordion('add', {
 			title: o.menuname,
 			content: content,
 			iconCls:"icon-server-start"
 		}); 
	})
	//2.展开菜单
	$('#menu').accordion("select",0)
})
//打开菜单
function openMenu(obj){
	var title = $(obj).text();
	if($("#index_tabs").tabs("exists",title)){//已存在
		$("#index_tabs").tabs("select",title);//选中该菜单
	}else{//不存在
		//添加新的选项卡
		$("#index_tabs").tabs("add",{
			title:title,  
		    href:$(obj).attr("href"),  //只加载body的内部,不是整个网页 
		    closable:true  	
		})
	}
	
	    
}