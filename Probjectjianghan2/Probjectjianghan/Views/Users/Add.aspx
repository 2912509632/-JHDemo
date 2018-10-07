 <%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Probject.Master" Inherits="System.Web.Mvc.ViewPage<Probjectjianghan.Models.UsersModels>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    
<script src="<%: Url.Content("~/Scripts/jquery.validate.min.js") %>" type="text/javascript"></script>
<script src="<%: Url.Content("~/Scripts/jquery.validate.unobtrusive.min.js") %>" type="text/javascript"></script>

<%--<style type="text/css">
         .form-group {
            width: 300px;
            font: normal 100% ‘Lucida Grande‘,Tahoma,sans-serif;
            font-size: 11px;
            color: #ff0000;
        }
</style>--%>




 <div class="row">
    <div class="col-lg-12">
        <h3 class="page-header"><i class="fa fa-laptop"></i> 管理首页</h3>
            <ol class="breadcrumb">
               <li><i class="fa fa-home"></i><a href="/index.php/Index/">管理系统</a></li>
               <li><i class="fa fa-laptop"><a href="/Users/Index/" >首页</a></i></li>   
               <li><i class="fa fa-plus">添加用户</i></li>                             
            </ol>
    </div>
</div>


 <div class="panel panel-info">
     <div class="panel-heading">
         <h3 class="panel-title">添加用户</h3>
     </div>
     <div class="panel-body">
        <form  class="form-horizontal form_add" role="form" action="" method="post">
          <div class="form-group">              
             <label for="input" class="col-sm-2 control-label">用户姓名：</label>
               <div class="col-sm-4">
                 <input type="text" name="userName" id="userName" class="form-control" value="" required="required" pattern="[\w|@|.]{3,30}" title="用户姓名不能为空，而且要在3-30个字符内">
               </div>
             <div class="col-sm-6 error_userName"></div>
          </div>
            

         <div class="form-group">              
             <label for="userAccount" class="col-sm-2 control-label">用户账号：</label>
               <div class="col-sm-4">
                 <input type="text" name="userAccount" id="userAccount" class="form-control" value="" required="required" pattern="[\w|@|.]{4,40}" title="用户账号不能为空，而且要在3-30个字符内">
               </div>
             <div class="col-sm-6 error_usersacc"></div>
          </div>
            
           <div class="form-group">              
             <label for="userPwd" class="col-sm-2 control-label">用户密码：</label>
               <div class="col-sm-4">
                 <input type="password" name="userPwd" id="userPwd" class="form-control" value="" required="required" pattern="[\w|@|.|~|$|*]{4,40}" title="用户密码不能为空，而且要在4-40个字符内">
               </div>
             <div class="col-sm-6 error_pwd"></div>
          </div>
            
          <div class="form-group">              
             <label for="txt_pwdtwo" class="col-sm-2 control-label">确认密码：</label>
               <div class="col-sm-4">
                 <input type="password" name="txt_pwdtwo" id="txt_pwdtwo" class="form-control" value=""  required="required" pattern="[\w|@|.|~|$|*]{4,40}" title="用户密码不能为空，而且要在4-40个字符内">
               </div>
             <div class="col-sm-6"></div>
          </div>
        
          <div class="form-group">
               <label class="col-sm-2 control-label">用户状态：</label>
                    <div class="col-sm-4">
                         <label class="checkbox-inline">
                          <input type="radio" id="Radio1" name="userState" value="1" checked="checked"> 合法
                         </label>
                         <label class="checkbox-inline">
                          <input type="radio" id="Radio2" name="userState" value="0"> 禁用
                         </label>
                    </div>
                <div class="col-sm-6 " ></div>
           </div>
            
          <div class="form-group">
              <label class="col-sm-2 control-label">用户权限：</label>
                   <div class="col-sm-4">
                       <%:Html.DropDownListFor(Model=>Model.groupID,ViewData["userGroup"] as List<SelectListItem>) %>
                   </div>
              <div class="col-sm-6"></div>
          </div>

           <div class="form-group">              
            <div class="row">
                <label for="" class="col-sm-2 control-label"></label>
                <div class="col-sm-4">
                     <button type="submit" class="btn btn-primary">添加<span class="glyphicon glyphicon-plus"></span></button>
                     <a href="/Users/Index/" type="button" class="btn btn-default"><span class="glyphicon glyphicon-chevron-left"></span>返回</a>
                </div>        
                <div class="col-sm-7">
                     
                </div>
            </div>     
          </div>
        </form>

     </div>
 </div>




<script type="text/javascript">
    $(function () {
        //判断用户姓名是否输入
        $("#userName").bind("blur", function () {
            var userName = $(this).val();
            if (userName.length < 3 || userName.length > 40) {
                $(".error_userName").html("<span class='text-danger'>*用户账号不能为空。且在3-30个字符内</span>");
                return false;
            } else {
                $(".error_userName").html("<span class='text-success'>*用户账号填写正确，请填写下一项</span>");
            }
        });

        //判断用户账号是否输入和是否已被注册
        $("#userAccount").bind("blur", function () {
            var userAccount = $(this).val();
            if (userAccount.length < 3 || userAccount.length > 30) {
                $(".error_usersacc").html("<span class='text-danger'>*用户账号不能为空。且在3-30个字符内</span>");
            } else {
                $.get("/Users/DatiUserAcc/", { userAccount: userAccount }, function (data) {
                    if (data == 1) {
                        $(".error_usersacc").html("");
                        $(".error_usersacc").html("<span class='text-danger'>*此用户账号已被注册，请重新输入！</span>");
                        $("#userAccount").focus();
                        return false;
                    } else {
                        $(".error_usersacc").html("");
                        $(".error_usersacc").html("<span class='text-success'>*此用户账号可以注册！</span>");
                    }
                });
            }
                
           
        });
        //判断两次密码是否一致
        $("#txt_pwdtwo").bind("blur", function () {
            if ($("#txt_pwdtwo").val() != $("#userPwd").val()) {
                $(".error_pwd").html("");
                $(".error_pwd").html("<span class='text-danger'>*两次密码不一致，请重新输入！</span>");
                return false;
            }
            else {
                $(".error_pwd").html("");
                $(".error_pwd").html("<span class='text-success'>*两次密码一致！</span>");
            }
        });


        
    });
</script>

</asp:Content>
