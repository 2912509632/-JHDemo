using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
//using System.Web.Mvc;

//一般情况下把扩展方法所在的命名空间跟要扩展类型的命名空间搞成一样
//
namespace System.Web.Mvc
{
    public static class MyHtmlHelper
    {
        public static string MyLabel(this HtmlHelper helper, string lbText)
        {
            return string.Format("<span>{0}</span>", lbText);
        }
        //HtmlHelper中遇到了MvcHtmlString时候，不进行编码化处理
        public static HtmlString MyMvcHtmlStringLabel(this HtmlHelper helper, string lbText)
        {
            string str = string.Format("<p>{0}</p>", lbText);
            return new HtmlString(str);
        }
        //主要就是输出分页的超级链接的标签
        //自定义分页Helper扩展
        public static HtmlString ShowPageNavigate(this HtmlHelper htmlHelper, int currentPage, int pageSize, int totalCount)
        {
            var redirecTo = htmlHelper.ViewContext.RequestContext.HttpContext.Request.Url.AbsolutePath;
            pageSize = pageSize == 0 ? 3 : pageSize;
            //总页数
            var totalPages = Math.Max((totalCount + pageSize - 1) / pageSize, 1);
            var output = new StringBuilder();
            if (totalPages > 1)
            {
                if (currentPage != 1)
                {
                    //处理首页连接
                    output.AppendFormat("<li><a type='button' class='pageLink' href='{0}?pageIndex=1&pageSize={1}'>首页</a></li>", redirecTo, pageSize);
                }
                if (currentPage > 1)
                {
                    //处理上一页的连接
                    output.AppendFormat("<li><a type='button' class='pageLink' href='{0}?pageIndex={1}&pageSize={2}'>上一页</a></li>", redirecTo, currentPage - 1, pageSize);
                }
                else
                {
                    //<li><a href="" type='button' class="btn_Index">首页</a> </li>
                    output.Append("<li><span class='pageLink'>上一页</span></li>");
                }
                output.Append(" ");
                //x循环打印出1-10的页数
                int currint = 1;
                for (int i = 0; i <= 10; i++)
                {
                    //一共最多显示10个代码，前面5个，后面5个
                    if ((currentPage + i - currint) >= 1 && (currentPage + i - currint) <= totalPages)
                    {
                        if (currint == i)
                        {
                            //当前页处理
                            //
                            //output.Append(string.Format("", currentPage));
                            output.AppendFormat("<li><a type='button' class='cpb' href='{0}?pageIndex={1}&pageSize='{2}'>{3}</a></li>", redirecTo, currentPage, pageSize, currentPage);
                        }
                        else
                        {
                            //一般页处理
                            output.AppendFormat("<li><a type='button' class='pageLink' href='{0}?pageIndex={1}&pageSize={2}'>{3}</a></li>", redirecTo, currentPage + i - currint, pageSize, currentPage + i - currint);
                        }
                    }
                    output.Append(" ");
                }
                if (currentPage < totalPages)
                {
                    //处理下一页的链接
                    output.AppendFormat("<li><a type='button' class='pageLink' href='{0}?pageIndex={1}&pageSize={2}'>下一页</a></li>", redirecTo, currentPage + 1, pageSize);
                }
                else
                {
                    //
                    //output.Append("<li><span class='pageLink'>下一页</span></li>");
                }
                output.Append(" ");
                if (currentPage != totalPages)
                {
                    output.AppendFormat("<li><a type='button' class='pageLink' href='{0}?pageIndex={1}&pageSize={2}'>末页</a></li>", redirecTo, totalPages, pageSize);
                }
                output.Append(" ");
            }
            //这个统计加不加都行
            output.AppendFormat("<div>共{0}条数据，{1}/{2}页</div>",totalCount, currentPage, totalPages);
            return new HtmlString(output.ToString());
        }
    }
}