using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Probjectjianghan.Models;

namespace Probjectjianghan.Controllers
{
    public class KindsController : Controller
    {
        //
        // GET: /Kinds/

        public ActionResult Index()
        {
            return View();
        }


        public ActionResult GetCataLog(int id = -1)
        {
            var p = KindsModels.getCataLog(id);
            return Json(p,JsonRequestBehavior.AllowGet);
        }
    }
}
