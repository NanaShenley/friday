using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace managementPortalWebforms
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor contact = Master.FindControl("contact") as HtmlAnchor;
            contact.Style.Clear();
            contact.Style.Add("background-color", "lightgrey");
            contact.Style.Add("color", "red");
            contact.Style.Add("border-bottom", "solid 3px red");
        }
    }
}