<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Probject.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Probjectjianghan.Models.KindsModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
     <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i>产品型号管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="/index.php/Index/">管理系统</a></li>
                <li><i class="fa fa-laptop">产品型号管理</i></li>
            </ol>
        </div>
    </div>
    
	
    <div class="row col-sm-12">
		<div class="col-sm-4">
			 <div class="panel panel-default" style="height:auto">
			     <div class="panel-heading">
			         <h4 class="panel-title">产品型号选择</h4>
			     </div>
			     <div class="panel-body ztree" id="treeDemo" style="width:auto;height:auto;">

			     </div>
			 </div>
		</div>


		<div class="col-sm-8">
			<div class="panel panel-default">
			     <div class="panel-heading">
			         <h4 class="panel-title">操作</h4>
			     </div>
			     <div class="panel-body">
			     	<button type="button" class="btn btn-primary btn-sm">添加新型号<span class="glyphicon glyphicon-plus"></span></button>
			     	<button type="button" class="btn btn-danger btn-sm">删除选中项<span class="glyphicon glyphicon-remove"></span></button>
			     </div>
			 </div>

            <div class="panel panel-default">
			     <div class="panel-heading">
			         <h4 class="panel-title">升降机型号配置参数设定</h4>
			     </div>
			     <div class="panel-body" style="">
			     	<form class="form-horizontal form_add" role="form" action="" method="post">
                                <div class="form-group">
                                    <label for="input" class="col-sm-2 control-label">制造许可证号：</label>
                                    <div class="col-sm-4">
                                        <input type="text" name="userName" id="userName" class="form-control" value="" >
                                    </div>
                                    <div class="col-sm-6 error_userName"></div>
                                </div>


                                <div class="form-group">
                                    <label for="userAccount" class="col-sm-2 control-label">型号-系列号：</label>
                                    <div class="col-sm-4">
                                       <span class="label"></span>
                                    </div>
                                    <div class="col-sm-6 error_usersacc"></div>
                                </div>

                                <div class="form-group">
                                    <label for="userPwd" class="col-sm-2 control-label">额定载重量：</label>
                                    <div class="col-sm-4">
                                         <div class="input-group">
                                          <input type="text" class="form-control"  aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="basic-addon1">KG左</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 ">
                                        <div class="input-group">
                                          <input type="text" class="form-control" aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="Span1">KG右</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="txt_pwdtwo" class="col-sm-2 control-label">运行速度：</label>
                                    <div class="col-sm-4">
                                        <div class="input-group">
                                          <input type="text" class="form-control" aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="Span2">M/Min</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4">
                                        
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">吊笼重量：</label>
                                    <div class="col-sm-4">
                                         <div class="input-group">
                                          <input type="text" class="form-control"  aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="Span3">KG左</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-4 ">
                                        <div class="input-group">
                                          <input type="text" class="form-control" aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="Span4">KG右</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-2 "></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">吊笼底部尺寸：</label>
                                    <div class="col-sm-4">
                                         <div class="input-group">
                                          <input type="text" class="form-control" aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="Span5">m</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6"></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">最大架设高度：</label>
                                    <div class="col-sm-4">
                                         <div class="input-group">
                                          <input type="text" class="form-control" aria-describedby="basic-addon1">
                                           <span class="input-group-addon" id="Span6">M</span>
                                        </div>
                                    </div>
                                    <div class="col-sm-6"></div>
                                </div>


                                <div class="form-group">
                                    <label class="col-sm-2 control-label">电动机型号：</label>
                                    <div class="col-sm-4">
                                         <div class="input-group">
                                             <span class="input-group-addon" id="Span7">左</span>
                                             <input type="text" class="form-control"  aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="col-sm-4 ">
                                        <div class="input-group">
                                             <span class="input-group-addon" id="Span8">右</span>
                                             <input type="text" class="form-control"  aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="col-sm-2 "></div>
                                </div>
                                
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">减速机型号：</label>
                                    <div class="col-sm-4">
                                         <div class="input-group">
                                             <span class="input-group-addon" id="Span9">左</span>
                                             <input type="text" class="form-control"  aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="col-sm-4 ">
                                        <div class="input-group">
                                             <span class="input-group-addon" id="Span10">右</span>
                                             <input type="text" class="form-control"  aria-describedby="basic-addon1">
                                        </div>
                                    </div>
                                    <div class="col-sm-2 "></div>
                                </div>
                                <div class="form-group">
                                    <div class="row">
                                        <label for="" class="col-sm-2 control-label"></label>
                                        <div class="col-sm-4">
                                            <button type="submit" class="btn btn-primary btn_save">修改<span class="glyphicon glyphicon-pencil"></span></button>
                                            <button type="button" class="btn btn-default btn_close">关闭<span class="glyphicon glyphicon-off"></span></button>
                                        </div>
                                        <div class="col-sm-7">
                                        </div>
                                    </div>
                                </div>
                            </form>
			     </div>
			 </div>
		</div>
    </div>
   <script type="text/javascript">
       var setting = {
           async: {
               enable: true,
               url: "/Kinds/GetCataLog", //数据请求地址  
               autoParam: ["id", "name", "pId"], //像后台请求数据时的参数  
               dataFilter: filter
           },
           callback: {
               onclick: nodeClick
           }
       };
       function nodeClick(event, treeId, treeNode, clickFlag) {
           //节点点击事件  
       }

       function filter(treeId, parentNode, childNodes) {
           if (childNodes)
               for (var i = 0; i < childNodes.length; i++) {
                   childNodes[i].name;
               }
           return childNodes;
       }

       $(document).ready(function () {
           $.fn.zTree.init($("#treeDemo"), setting);
       });
   </script>
</asp:Content>
