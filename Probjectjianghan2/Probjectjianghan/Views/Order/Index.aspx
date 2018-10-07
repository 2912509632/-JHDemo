<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Probject.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Probjectjianghan.Models.OrdersModels>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i>订单录入管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="/index.php/Index/">管理系统</a></li>
                <li><i class="fa fa-laptop">订单录入管理</i></li>
            </ol>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <div class="row">
                <div class="col-sm-10">
                     <h3 class="panel-title">订单列表
                        <button type="button" class="btn btn-primary btn-xs">添加新订单<span class="glyphicon glyphicon-plus"></span></button>
                    </h3>
                </div>
                <div class="col-sm-2">
                    <button type="button" class="btn  btn-xs btn_bh">升降机</button>
                    <button type="button" class="btn btn-default btn-xs btn_ctc">塔吊</button>
                </div>
           
            </div>
        </div>
        <div class="panel-body">
            <table class="table table-condensed table-hover">
                <thead>
                    <tr>
                        <th>产品编号</th>
                        <th>客户单位</th>
                        <th>型号</th>
                        <th>系列号</th>
                        <th>订单号</th>
                        <th>发货时间</th>
                        <th>合格证</th>
                    </tr>
                </thead>
                <tbody>
                    <%foreach (var item in Model)
	                {
                     %>
                    <tr>
                        <td><%:item.id %></td> 
                        <td><%:item.uname %></td> 
                        <td><%:item.type %></td> 
                        <td><%:item.olt %></td> 
                        <td><%:item.ContractNO %></td> 
                        <td><%:item.fhtime %></td> 
                        <td>
                             <button type="button" class="btn  btn-xs"><span class="glyphicon glyphicon-eye-open"></span></button>
                            <button type="button" class="btn  btn-xs"><span class="glyphicon glyphicon-pencil"></span></button>
                            <button type="button" class="btn  btn-xs btn_Delete" data_type="<%:item.type %>" data_id="<%:item.id %>"><span class="glyphicon glyphicon-remove"></span></button>
                        </td> 
                    </tr>
                    <% } %>
                </tbody>
            </table>
              
            <div align="center">
                <nav>
                  <ul class="pagination">
                         <%:Html.ShowPageNavigate((int)ViewData["pageIndex"],(int)ViewData["pageSize"],(int)ViewData["total"]) %>
                  </ul>
                </nav>

            </div>
        </div><!--panel-body-->
    </div><!--panel-info-->

    <script type="text/javascript">
        $(function () {
            //升降机点击事件
            $(".btn_bh").bind("click", function () {
                location.href = "/Order/Index/bh" ;
            });

            //塔吊点击事件
            $(".btn_ctc").bind("click", function () {
                location.href = "/Order/Index/ctc";
            });

            //删除点击事件
            $(".btn_Delete").bind("click", function () {
                var id = $(this).attr("data_id");
                
                var type = window.location.pathname;
                if (type == "/Order/Index/bh") {
                    if (!confirm("是否确定删除此升降机订单")) {
                        return false;
                    } else {
                        location.href = "/Order/Deletebh/" + id;
                    }
                } else {
                    if (!confirm("是否确定删除此塔吊订单")) {
                        return false;
                    } else {
                        location.href = "/Order/Deletectc/" + id;
                    }
                }
                    
               
            });   
        });
    </script>
</asp:Content>
