using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace managementPortalWebforms
{
    public partial class addabout : Page
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

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/portal/asdf/");
        }

        protected void FormView1_ItemCreated(object sender, EventArgs e)
        {
            //Response.Redirect("~/portal/asdf/");
        }

        protected void FormView1_ItemInserting(object sender, FormViewInsertEventArgs e)
        {
            try
            {
                string path = "~/UploadedImages/";
                var fileupload = (FileUpload)FormView1.FindControl("FileUpload1");               
                  if (fileupload.HasFile)               
                  {  
                      fileupload.SaveAs(Path.Combine(Server.MapPath("~\\UploadedImages\\"), fileupload.FileName));
                      SqlDataSource1.InsertParameters["Image"].DefaultValue = "~/UploadedImages/" + fileupload.FileName;
                  }               
                  else
                  {                   
                     // e.Cancel = true;                   
                  }         
          }     
          catch (Exception ex)
          {                          
          }

       }

        protected void FormView1_ItemInserted1(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/portal/asdf/About.aspx");
        }
    }
}