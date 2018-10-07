using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Probjectjianghan.Models
{
    public enum OptionResult
    { 
        suceess = 1,
        fiat = 0
    }
    public class AlertModel
    {
        public OptionResult result { get; set; }
        public string errormsg { get; set; }
        public string errorurl { get; set; }
        public int errorwati { get; set; }

        public AlertModel(OptionResult _result, string _errormsg, string _errorurl, int _errorwati=2) 
        {
            result = _result;
            errormsg = _errormsg;
            errorurl = _errorurl;
            errorwati = _errorwati;
        }

    }
}