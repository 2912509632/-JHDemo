using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Probjectjianghan.Models
{
    public class UsersModels : users
    {
        public string  searchKey { get; set; }

        public string  GroupName { get; set; }

        public string  setate { get; set; }

        internal static List<UsersModels> GetUsersAll()
        {
            dbDataContext db = new dbDataContext();
            var p = from u in db.users
                    join g in db.userGroup on u.groupID equals g.groupID
                    select new UsersModels()
                    {
                        
                        userName = u.userName,
                        userAccount = u.userAccount,
                        userID = u.userID,
                        lastLoginTime = u.lastLoginTime,
                        GroupName = g.groupName,
                        setate = u.userState == 1 ? "合法" : "禁用"
                    };
            return p.ToList();
        }

        internal static void UpdateLoginTime(string user)
        {
            dbDataContext DB = new dbDataContext();
            users L = DB.users.Where(u => u.userAccount == user).First();
            L.lastLoginTime = DateTime.Now;
            try
            {
                DB.SubmitChanges();
            }
            catch (Exception)
            {             
                throw;
            }
        }


        //添加用户

        internal static int AddUsers(UsersModels model)
        {
            dbDataContext db = new dbDataContext();
            users u = new users()
            {
                userAccount = model.userAccount,
                userPwd = model.userPwd,
                userName = model.userName,
                userState = model.userState,
                groupID = model.groupID,
                lastLoginTime = null

            };

            db.users.InsertOnSubmit(u);
            try
            {
                db.SubmitChanges();
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
        }





        internal static object GetIdUsersAll(int id)
        {
            dbDataContext db = new dbDataContext();
            var p = from u in db.users
                    join g in db.userGroup
                    on u.groupID equals g.groupID
                    where u.userID == id
                    select new UsersModels()
                    {
                        userID = u.userID,
                        userName = u.userName,
                        userAccount = u.userAccount,
                        userPwd = u.userPwd,
                        lastLoginTime = u.lastLoginTime,
                        GroupName = g.groupName,
                        setate = u.userState==1?"合法":"禁用",
                        groupID = u.groupID
                    };
            return p.First();
        }

        internal static int DeleteUser(string id)
        {
            dbDataContext db = new dbDataContext();
            users u = db.users.Where(o => o.userID == int.Parse(id)).First();
            db.users.DeleteOnSubmit(u);
            try
            {
                db.SubmitChanges();
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        //修改页面的用户权限绑定
        internal static object GetGroupID(int id)
        {
            dbDataContext db = new dbDataContext();
            var p = from u in db.users
                    where u.userID == id
                    select u;
            return p ;
        }

        //实现修改
        internal static int UpdateUser(users u)
        {
            dbDataContext db = new dbDataContext();
            users p = db.users.Where(o => o.userID == u.userID).First();
            p.userName = u.userName;
            p.userAccount = u.userAccount;
            p.userPwd = (u.userPwd == null || u.userPwd == "") ? p.userPwd : u.userPwd;
            p.userState = u.userState;
            p.groupID = u.groupID;

            try
            {
                db.SubmitChanges();
                return 1;
            }
            catch (Exception)
            {
                return -1;
            }
        }

        //搜索
        internal static List<UsersModels> GetUsersByKey(string searchKey)
        {
            dbDataContext db = new dbDataContext();
            var p = from u in db.users
                    join g in db.userGroup on u.groupID equals g.groupID
                    where u.userName.Contains(searchKey) || u.userAccount.Contains(searchKey)
                    select new UsersModels()
                    {

                        userName = u.userName,
                        userAccount = u.userAccount,
                        userID = u.userID,
                        lastLoginTime = u.lastLoginTime,
                        GroupName = g.groupName, 
                        setate = u.userState == 1 ? "合法" : "禁用"
                    };
            return p.ToList();
        }

        internal static int GetUsersAccCount(string useracc)
        {
            dbDataContext db = new dbDataContext();
            try
            {
                return db.users.Where(o => o.userAccount == useracc).Count();
            }
            catch (Exception)
            {
                return 0;
                throw;
            }
            
        }

        internal static users GetUsersById(string id)
        {
            dbDataContext db = new dbDataContext();
            try
            {
                return db.users.Where(o => o.userID == int.Parse(id)).First();
            }
            catch (Exception)
            {
                return null;
                throw;
            }
            
        }
    }
}