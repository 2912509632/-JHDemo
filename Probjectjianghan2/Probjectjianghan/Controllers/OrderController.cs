using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Probjectjianghan.Models;

namespace Probjectjianghan.Controllers
{
    public class OrderController : Controller
    {
        //
        // GET: /Order/

        public ActionResult Index(string id, int pageIndex = 1, int pageSize = 12)
        {
            
            if (id == "bh")
            {
                ViewData["pageIndex"] = pageIndex;
                ViewData["pageSize"] = pageSize;
                ViewData["total"] = OrdersModels.Getcc_bhCount();
                List<OrdersModels> o = OrdersModels.GetOrdersAllBh(pageIndex, pageSize);
                return View(o);
            }
            else
            {
                ViewData["pageIndex"] = pageIndex;
                ViewData["pageSize"] = pageSize;
                ViewData["total"] = OrdersModels.Getcc_ctcCount();
                List<OrdersModels> o = OrdersModels.GetOrdersAllCtc(pageIndex, pageSize);
                return View(o);
            }
        }
        
        //删除订单
        public ActionResult Deletebh(int id)
        {
            int i = OrdersModels.DeleteCC_bh(id);
            if (i > 0)
            {
                return View("error", new AlertModel(OptionResult.suceess, "删除成功", "/Order/Index/bh", 2));
            }
            else
            {
                return View("error", new AlertModel(OptionResult.fiat, "删除失败", "/Order/Delete/bh", 2));
            }
        
        }

        public ActionResult Deletectc(int id)
        {
            int i = OrdersModels.DeleteCC_ctc(id);
            if (i > 0)
            {
                return View("error", new AlertModel(OptionResult.suceess, "删除成功", "/Order/Index/ctc", 2));
            }
            else
            {
                return View("error", new AlertModel(OptionResult.fiat, "删除失败", "/Order/Delete/ctc", 2));
            }

        }

           
    }
}
