using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Probjectjianghan.Models
{
    public class LoginModels
    {
        [Required]
        [StringLength(30,MinimumLength=4,ErrorMessage="用户名必须在4-30个字符内")]
        public string user { get; set; }

        [Required]
        [StringLength(40, MinimumLength = 4, ErrorMessage = "用户名必须在4-40个字符内")]
        public string pwd { get; set; }

        public string rememberme { get; set; }




        /// <summary>
        /// 登录验证
        /// </summary>
        /// <param name="user">用户名</param>
        /// <param name="pwd">密码</param>
        /// <returns>返回1 登录成功，0 密码或者用户名错误 ， -1 该用户被禁用</returns>
        internal static int LoginOn(string user, string pwd)
        {
            dbDataContext db = new dbDataContext();
            
            int i = db.users.Where(o => o.userAccount == user && o.userPwd == pwd ).Count();
            if (i>0)
            {
                i = db.users.Where(o => o.userAccount ==user && o.userState == 1).Count();
                if (i>0)
                {
                    i = db.users.Where(o => o.userAccount == user && o.groupID == 1).Count();
                    if (i>0)
                    {
                        return 1;
                    }
                    else
                    {
                        return -2;
                    }
                   
                }
                else
                {
                    return -1;
                }
            }
            return i;
        }
    }
}