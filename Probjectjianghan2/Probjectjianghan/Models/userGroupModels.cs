using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Probjectjianghan.Models
{
    public class userGroupModels : userGroup
    {

        internal static List<SelectListItem> GetGroupName()
        {
            dbDataContext db = new dbDataContext();
            return db.userGroup.Select(g => new SelectListItem { 
                Text = g.groupName,
                Value = g.groupID.ToString()
            }).ToList();
        }



        internal static object GetGroupID()
        {
            dbDataContext db = new dbDataContext();
            return db.userGroup;
        }
    }
}