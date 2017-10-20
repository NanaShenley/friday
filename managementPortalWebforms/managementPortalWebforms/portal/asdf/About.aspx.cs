using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace managementPortalWebforms
{
    public partial class About : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor about = Master.FindControl("about") as HtmlAnchor;
            about.Style.Clear();
            about.Style.Add("background-color", "lightgrey");
            about.Style.Add("color", "red");
            about.Style.Add("border-bottom", "solid 3px red");
        }

        protected void CreateUser_Click(object sender, EventArgs e)
        {

        }
    }
}