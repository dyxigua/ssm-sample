<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
$(function(){
	//加载树形菜单
	$("#khgl_tree").tree({
		url:"getKhgl.do",
		loadFilter:function(data){
			var treeJson = [{"id":0,"text":"所有用户","state":"open","children":[],"checked":"checked"}];
			//List<User>  --> json
			//把data数据格式 转换成 tree要求的格式
			$(data).each(function(i,o){
				treeJson[0].children.push({"id":o.khmc_id,"text":o.khmc_name});
			})
			return treeJson;
		},
		onClick:function(node){
			$("#gc_datagrid").datagrid({
				url:"getGcmcById/"+node.id
			})
		}
	})
	//默认选中根节点
	/* var root = document.getElementById("_easyui_tree_1");
	alert(root);
	$("#khgl_tree").tree("select",root);
	alert("222") */
	//加载表格  每次发起分页要求，自动传递参数 page: 跳转到第几页  rows: 每页显示条数
	//select * from table limit (page-1))*rows,rows
	$("#gc_datagrid").datagrid({
		url:"getGcmcById/0",
		loadFilter:function(data){
			//必须返回包含'total'和'rows'属性的标准数据对象。
			return data;
		}
	})
})
	//表格操作列格式化
	function oprFammter(value,row,index){
		var id = row.gcmc_id
		return "<a href='javascript:delGcxx("+id+")'>删除</a>&nbsp;<a>修改"+id+"</a>"
	}
	//客户名称
	function oprKhmc(value,row,index){
		/* console.log(row.khgl.khmc_id)
		console.log(row.khgl.khmc_name) */
		return value.khmc_name
	}
	//删除工程信息
	function delGcxx(id){
		var ids = [];
		if(id){//有id
			ids.push(id);
		}else{//批量删除
			var ck = $("#gc_datagrid").datagrid("getSelections");
			if(ck.length == 0){//未选
				$.messager.alert('警告','请选中一行！'); 
			    return;
			}else{
				$(ck).each(function(i,o){
					ids.push(o.gcmc_id)
				})
			}			
		}
		//确认框
		$.messager.confirm('确认','您确认想要删除记录吗？',function(r){    
		    if (r){    
		    	//ajax请求删除
		    	/* alert("ajax")
		    	alert(JSON.stringify(ids)) */
		    	$.post("deleteGcxxByids",{ids:ids.join(",")},function(data){
		    	 	if(!data){
		    	 		$.messager.alert('确认','删除失败！'); 
		    	 	}else if(data.flag == true){
		    	 		$.messager.alert('确认',data.msg);
		    	 		$("#gc_datagrid").datagrid("reload");
		    	 	}else{
		    	 		$.messager.alert('确认','删除失败！'+data.msg);
		    	 	}
				},"json")    
		    }    
		}); 
	}
	function addGcmc(){
		alert("add")
		$('#dd').dialog("open");
		$('#dd').dialog({    
		    title: '新增工程',    
		    width: 400,    
		    height: 400,    
		    closed: false,    
		    cache: false,    
		    /* href: 'index.do', */
		    modal: true,
		    buttons:[{
				text:'保存',
				handler:function(){
					alert("添加")
					$('#addGcxx').form('submit',{    
					    url:"addGcxx",    
					    onSubmit: function(param){   
					    	//1.加验证
					    	alert("进行验证")
					    	param.kgmc = "test";
					    	//2.加额外参数
					    	/* return false; */
					    },    
					    success:function(data){    
					        alert(data) 
					        //提交成功：1.显示成功信息 2.是否继续新增  3.重置表单,关闭对话框 4.刷新分页表格
					    }    
					}); 
				}
			},{
				text:'关闭',
				handler:function(){
					$("#dd").dialog('close')
				}
			}]

		}); 
	}
	//查询搜索框
	function qq(value,name){ 
		//获取树节点选中的节点
		var node = $("#khgl_tree").tree("getSelected")
		//客户id
		var id = node.id;
		$("#gc_datagrid").datagrid({
			url:"getGcmcSerach/"+id+"/"+name+"/"+value
		})
	} 


	
</script>
<div class="easyui-layout" data-options="fit:true">

	<!-- 客户管理信息的左边树形结构 -->
	<div data-options="region:'west',title:'客户管理'" style="width:180px;">
		<ul id="khgl_tree"></ul> 
	</div>
	
	<!-- 点击具体客户后在树结构的右边显示具体信息 -->
	<div data-options="region:'center',title:'工程管理'">
		<table id="gc_datagrid" data-options="rownumbers:true,toolbar:'#gcmc_tools',pageSize:20,fit:true,fitColumns:true,pagination:true">   
		    <thead>   
		        <tr>   
		        	<th data-options="field:'ck',checkbox:true,width:100"></th>
		            <th data-options="field:'gcmc_id',width:100">工程编程</th>   
		            <th data-options="field:'gcmc_name',width:100">工程名称</th>   
		            <th data-options="field:'khgl',width:100,formatter:oprKhmc">客户名称</th>  
		            <th data-options="field:'opr',width:100,title:'操作',formatter:oprFammter"></th>  
		        </tr>   
		    </thead>   
		</table>  		
	</div>
</div>


<!-- 表格工具条  增删查 -->
<div id="gcmc_tools">
	<a href="#" class="easyui-linkbutton" onclick="addGcmc()" data-options="iconCls:'icon-add',plain:true">新增</a>
	<a href="#" class="easyui-linkbutton" onclick="delGcxx()" data-options="iconCls:'icon-delete',plain:true">删除</a>
	<!-- 表格搜索框 -->
	<input id="ss" class="easyui-searchbox" style="width:300px" 
	data-options="searcher:qq,prompt:'请输入要查询的条件',menu:'#mm'" /> 
</div>

<!-- 搜索框的可选内容 -->
<div id="mm" style="width:120px"> 
	<div data-options="name:'all'">模糊查询</div>
	<div data-options="name:'khmc'">客户名称</div> 
	<div data-options="name:'gcid'">工程id</div> 
	<div data-options="name:'gcmc'">工程名称</div> 
</div> 


<div id="dd" class="easyui-dialog" title="新增工程" style="width:400px;height:200px;"   
        data-options="iconCls:'icon-save',resizable:true,modal:true,closed:true">   
    <form id="addGcxx">
    		<p><label>工程名称：</label><input name="gcmc" type="text"></p>
    		<p><label>客户名称：</label>
    			<!-- <select name="khid">
    				<option value="1">客户1</option>
    				<option value="2">客户2</option>
    			</select> -->
    			<input id="cc" class="easyui-combobox" name="khid"   
    data-options="valueField:'khmc_id',textField:'khmc_name',url:'getKhgl.do'" /> 
    		</p>
    </form>    
</div> 



</body>
</html>