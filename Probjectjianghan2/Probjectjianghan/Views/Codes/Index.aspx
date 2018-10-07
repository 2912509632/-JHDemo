<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Probject.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

<div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i>数据管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="/index.php/Index/">管理系统</a></li>
                <li><i class="fa fa-laptop">二维码设置</i></li>
            </ol>
        </div>
    </div>

    <div class="panel">
        <div class="panel-heading">
            <h3 class="panel-title">二维码设置</h3>
        </div>
        <div class="panel-body">
            <form class="form-horizontal form_add" role="form" action="" method="post">
                <div class="form-group">
                    <label for="input" class="col-sm-2 control-label">图像大小：</label>
                    <div class="col-sm-2">
                       <input type="text" name="userName" id="userName" class="form-control" value="" required="required" pattern="[\w|@|.]{3,30}" title="用户姓名不能为空，而且要在3-30个字符内">
                    </div>
                    <div class="col-sm-8 error_userName"></div>
                 </div> 
                
                <div class="form-group">
                    <label for="input" class="col-sm-2 control-label">容错级别：</label>
                    <div class="col-sm-4">
                       <div class="btn-group" role="group" aria-label="...">
                          <button type="button" class="btn btn-default">L</button>
                          <button type="button" class="btn btn-default">M</button>
                          <button type="button" class="btn btn-default">Q</button>
                          <button type="button" class="btn btn-default">H</button>
                        </div>
                    </div>
                    <div class="col-sm-8 error_userName"></div>
                 </div>    
                
                 <div class="form-group">
                    <label for="input" class="col-sm-2 control-label">信息文本：</label>
                    <div class="col-sm-5">
                       <input type="text" name="userName" id="Text2" class="form-control" value="" required="required" pattern="[\w|@|.]{3,30}" title="用户姓名不能为空，而且要在3-30个字符内">
                    </div>
                    <div class="col-sm-5 error_userName"></div>
                 </div>   
                
                <div class="form-group">
                    <label for="input" class="col-sm-2 control-label">预览：</label>
                    <div class="col-sm-4">
                       <input type="image" src="../../Public/picture/timg.jpg" style="width:150px;height:150px;"/>
                    </div>
                    <div class="col-sm-6 error_userName"></div>
                 </div>  

                <div class="form-group">
                    <label for="input" class="col-sm-2 control-label"></label>
                    <div class="col-sm-4">
                        <button type="submit" class="btn btn-default btn_save">设置</button>
                        <button type="button" class="btn btn-default btn_close">生成预览</button>
                    </div>
                    <div class="col-sm-6 error_userName"></div>
                 </div>                                             
            </form>
        </div>
    </div>


</asp:Content>
