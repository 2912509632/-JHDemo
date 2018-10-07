<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Probject.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Probjectjianghan.Models.UsersModels>>" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row">
        <div class="col-lg-12">
            <h3 class="page-header"><i class="fa fa-laptop"></i>江汉集团员工管理</h3>
            <ol class="breadcrumb">
                <li><i class="fa fa-home"></i><a href="/index.php/Index/">管理系统</a></li>
                <li><a href="/Users/Add/">添加用户</a></li>
                <li><i class="fa fa-laptop">首页</i></li>
            </ol>
        </div>
    </div>

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title">用户管理</h3>
        </div>
        <div class="panel-body">
            <table class="table table-condensed table-hover">
                <thead>
                    <tr>
                        <th>用户编号
                        </th>
                        <th>用户名
                        </th>
                        <th>用户账号
                        </th>
                        <th>用户状态
                        </th>

                        <th>用户权限
                        </th>

                        <th>最后登陆时间
                        </th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <% foreach (var item in Model)
                       { %>
                    <tr>

                        <td>
                            <%: Html.DisplayFor(modelItem => item.userID) %>
                        </td>

                        <td>
                            <%: Html.DisplayFor(modelItem => item.userName) %>
                        </td>
                        <td>
                            <%: Html.DisplayFor(modelItem => item.userAccount) %>
                        </td>
                        <td>
                            <%: Html.DisplayFor(modelItem => item.setate) %>
                        </td>
                        <td>
                            <%: Html.DisplayFor(modelItem => item.GroupName) %>
                        </td>
                        <td>
                            <%: Html.DisplayFor(modelItem => item.lastLoginTime) %>
                        </td>

                        <td>
                            <button type="button" data-id="<%:item.userID %>" class="btn btn-primary btn-xs btn_edit" data-target=".bs-example-modal-sm">修改</button>
                            |
                            <button type="button" data-id="<%:item.userID %>" class="btn btn-danger btn-xs btn_del">删除</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div>
    </div>

    <!--修改模态框-->
    <<div class="modal fade" id="editModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改员工信息</h4>
                </div>
                <div class="modal-body">
                    <div class="panel panel-info">
                        <div class="panel-heading">
                            <h3 class="panel-title">修改用户</h3>
                        </div>
                        <div class="panel-body">
                            <form class="form-horizontal form_add" role="form" action="" method="post">
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
                                        <input type="password" name="userPwd" id="userPwd" class="form-control" value="" pattern="[\w|@|.|~|$|*]{4,40}" title="用户密码不能为空，而且要在4-40个字符内" placeholder="如无须修改密码，请留空。">
                                    </div>
                                    <div class="col-sm-6 error_pwd"></div>
                                </div>

                                <div class="form-group">
                                    <label for="txt_pwdtwo" class="col-sm-2 control-label">确认密码：</label>
                                    <div class="col-sm-4">
                                        <input type="password" name="txt_pwdtwo" id="txt_pwdtwo" class="form-control" value="" pattern="[\w|@|.|~|$|*]{4,40}" title="用户密码不能为空，而且要在4-40个字符内" placeholder="如无须修改密码，请留空。">
                                    </div>
                                    <div class="col-sm-6"></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户状态：</label>
                                    <div class="col-sm-4">
                                        <label class="checkbox-inline">
                                            <input type="radio" id="red_good" name="userState" value="1">
                                            合法
                                        </label>
                                        <label class="checkbox-inline">
                                            <input type="radio" id="rad_bard" name="userState" value="0">
                                            禁用
                                        </label>
                                    </div>
                                    <div class="col-sm-6 "></div>
                                </div>

                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户权限：</label>
                                    <div class="col-sm-4">
                                        <%:Html.DropDownList("groupID",ViewData["userGroup"]  as List<SelectListItem>) %>
                                    </div>
                                    <div class="col-sm-6"></div>
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
            <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
    <!-- /.modal -->


    <script type="text/javascript">
        $(function () {

            //删除用户信息
            $(".btn_del").bind("click", function () {
                var UserId = $(this).attr("data-id");
                if (!confirm("是否确认删除？")) {
                    return false;
                } else {
                    location.href = "/Users/Delete/" + UserId;
                }

            });

            //打开修改模态框 提取后台JSON传值 并赋值
            $(".btn_edit").bind("click", function () {
                var UserId = $(this).attr("data-id");
                $("#editModal").modal("show")
                $.get("/Users/DataliEdit/", { userid: UserId }, function (data) {
                    if (data == null) {
                        $("#editModal").modal("hide");
                        alert("你所操作的用户不存在！请刷新重试。");
                        return;
                    } else {
                        $("#userName").val(data.userName);
                        $("#userAccount").val(data.userAccount);
                        if (data.userState == 1) {
                            $("#red_good").attr("checked", true);
                        } else {
                            $("#rad_bard").attr("checked", true);
                        }
                        $("#groupID").val(data.groupID);
                    }
                    $(".btn_save").attr("data-id", data.userID);
                });
            });

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

            $(".btn_save").bind("click", function () {   
                var edit_json = new Object();
                edit_json.userID = $(this).attr("data-id");
                edit_json.userName = $("#userName").val();
                edit_json.userAccount = $("#userAccount").val();
                edit_json.userPwd = $("#userPwd").val();
                edit_json.userState = $("#red_good").attr("checked") == "checked" ? 1 : 0;
                edit_json.groupID = $("#groupID").val();

                $.post("/Users/Edit/", { data: JSON.stringify(edit_json) }, function () {
                    if (data > 0) {
                        loction.href = "/Users/Index/";
                    } else {
                        alert("修改失败，请刷新重试。");
                        $("#editModal").modal("hide");
                    }
                });
            });


            //关闭修改模态框
            $(".btn_close").bind("click", function () {
                $("#editModal").modal("hide")

            });
        });
    </script>


</asp:Content>
