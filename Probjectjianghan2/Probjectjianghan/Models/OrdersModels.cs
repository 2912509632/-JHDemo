using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Probjectjianghan.Models
{
    public class OrdersModels : cc_bh
    {
        //升降机分页显示
        internal static List<OrdersModels> GetOrdersAllBh(int pageIndex, int pageSize)
        {
            dbDataContext db = new dbDataContext();
            var p = from u in db.cc_bh
                    select new OrdersModels()
                    {
                        id = u.id,
                        uname = u.uname,
                        type = u.type,
                        olt = u.olt,
                        ContractNO = u.ContractNO,
                        fhtime = u.fhtime
                    };
            return p.Skip(pageSize * (pageIndex - 1)).Take(pageSize).ToList();
        }

        //塔吊分页显示
        internal static List<OrdersModels> GetOrdersAllCtc(int pageIndex, int pageSize)
        {
            dbDataContext db = new dbDataContext();
            var p = from u in db.cc_ctc
                    select new OrdersModels()
                    {
                        id = u.id,
                        uname = u.uname,
                        type = u.type,
                        olt = u.sn,
                        ContractNO = u.ContractNO,
                        fhtime = u.fhtime
                    };
            return p.Skip(pageSize * (pageIndex - 1)).Take(pageSize).ToList();
        }

        //删除升降机的数据
        internal static int DeleteCC_bh(int id)
        {
            dbDataContext db = new dbDataContext();
            cc_bh c = db.cc_bh.Where(o => o.id == id).First();
            db.cc_bh.DeleteOnSubmit(c);
            try
            {
                db.SubmitChanges();
                return 1;
            }
            catch (Exception)
            {
                return -1;
                throw;
            }
        }
        //删除塔吊的数据
        internal static int DeleteCC_ctc(int id)
        {
            dbDataContext db = new dbDataContext();
            cc_ctc c = db.cc_ctc.Where(o => o.id == id).First();
            db.cc_ctc.DeleteOnSubmit(c);
            try
            {
                db.SubmitChanges();
                return 1;
            }
            catch (Exception)
            {
                return -1;
                throw;
            }
        }
        //获取升降机的数据总数
        internal static object Getcc_bhCount()
        {
            dbDataContext db = new dbDataContext();
            return db.cc_bh.Count();
        }
        //获取塔吊的数据总数
        internal static object Getcc_ctcCount()
        {
            dbDataContext db = new dbDataContext();
            return db.cc_ctc.Count();
        }

      
    }
}