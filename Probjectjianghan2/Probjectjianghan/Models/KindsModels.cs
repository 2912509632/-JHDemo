using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Probjectjianghan.Models
{
    public class KindsModels : ctc_data   
    {
        internal static object getCataLog(int id)
        {
            dbDataContext db = new dbDataContext();
            var p = db.catalog.Select(c => new
            {
                id = c.catID,
                name = c.catName,
                pId = c.parentID,
                isParent = db.catalog.Any(a => a.parentID == c.catID)
            }).Where(o => o.pId == id);
            return p;
        }
    }
}