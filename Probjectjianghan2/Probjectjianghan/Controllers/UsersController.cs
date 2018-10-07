using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Probjectjianghan.Models;
using System.Web.Security;
using System.Web.Script.Serialization;

namespace Probjectjianghan.Controllers
{
    public class UsersController : Controller
    {
        //
        // GET: /Users/
        public ActionResult Index()
        {
            ViewData["userGroup"] = userGroupModels.GetGroupName();
            List<UsersModels> lst = UsersModels.GetUsersAll();
            return View(lst);
        }

        //[HttpPost]
        //public ActionResult Index(string searchKey)
        //{

        //    if (string.IsNullOrEmpty(searchKey) != null)
        //    {
        //        List<UsersModels> lst = UsersModels.GetUsersByKey(searchKey);
        //        return View(lst);
        //    }
        //    else
        //    {
        //        List<UsersModels> lst = UsersModels.GetUsersAll();
        //        return View(lst);
        //    }
        //}

        //登录界面
        public ActionResult Login()
        {
            return View();
        }
        //实现登陆
        [HttpPost]
        public ActionResult Login(LoginModels model)
        {
            if (ModelState.IsValid)
            {
                int i = LoginModels.LoginOn(model.user,model.pwd);
                if (i>0)
                {
                    //发放用户登录凭证
                    FormsAuthenticationTicket tick = new FormsAuthenticationTicket(1, model.user, DateTime.Now, DateTime.Now.AddMinutes(30), true, "");
                    //加密凭证
                    string enc = FormsAuthentication.Encrypt(tick);
                    //将凭证放在COOKIE中
                    HttpCookie cookie = new HttpCookie(FormsAuthentication.FormsCookieName,enc);
                    //判断是否勾选了记住我
                    if (model.rememberme == "1")
                    {
                        cookie.Expires = DateTime.Now.AddMonths(1);
                    }
                    //将凭证发放给客户
                    Response.Cookies.Add(cookie);

                    //添加登录当前时间
                    UsersModels.UpdateLoginTime(model.user);

                    return View("error",new AlertModel(OptionResult.suceess,"登录成功，您即将进入后台。","/Home/Index/",1));
                }
                else
                {
                    if (i == 0)
                    {
                        return View("error", new AlertModel(OptionResult.fiat, "用户名或密码错误，请重新输入","/Users/Login/", 2));
                    }
                    else if (i == -1)
                    {
                        return View("error", new AlertModel(OptionResult.fiat, "此用户已被禁用，请联系管理员", "/Users/Login/", 2));
                    }
                    else
                    {
                        return View("error", new AlertModel(OptionResult.fiat, "你不是管理员，你无权进入后台", "/Users/Login/", 2));
                    }

                }
            }
            else
            {
                return View();
            }
        }

        //安全退出
        public ActionResult Logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("Login");
        }

        //添加用户页面显示
        public ActionResult Add()
        {
            //绑定用户权限下拉列表
            ViewData["userGroup"] = userGroupModels.GetGroupName();
            
            return View();
        }

        public ActionResult DatiUserAcc() {
            string useracc = Request["userAccount"];
            int i = UsersModels.GetUsersAccCount(useracc);
            return Content(i.ToString());
        }
        //添加用户实现
        [HttpPost]
        public ActionResult Add(UsersModels model)
        {     
            int i = UsersModels.AddUsers(model);
            if (i > 0)
            {
                return View("error", new AlertModel(OptionResult.suceess, "添加成功", "/Users/Index/", 2));
            }
            else
            {
                return View("error", new AlertModel(OptionResult.fiat, "添加失败，请检查重试", "/Users/Add/", 2));
            }
        }

        //删除用户

        public ActionResult Delete(string id)
        {
            int i = UsersModels.DeleteUser(id);
            if (i>0)
            {
                return View("error", new AlertModel(OptionResult.suceess, "删除成功", "/Users/Index/", 2));
            }
            else
            {
                return View("error", new AlertModel(OptionResult.fiat, "删除失败", "/Users/Delete/", 2));
            }
        }

        public ActionResult DataliEdit()
        {
            string id = Request["userid"];
            users u = UsersModels.GetUsersById(id);
            return Json(u, JsonRequestBehavior.AllowGet);
        }

        //修改用户
        
        public ActionResult Edit()
        {
            JavaScriptSerializer js = new JavaScriptSerializer();
            users u = js.Deserialize<users>(Request["data"]);
            int i = UsersModels.UpdateUser(u);
            return Content(i.ToString());
        }

      
       
    }
}
