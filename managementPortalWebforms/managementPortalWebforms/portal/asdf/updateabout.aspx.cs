using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace managementPortalWebforms
{
    public partial class updateabout : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor about = Master.FindControl("about") as HtmlAnchor;
            about.Style.Clear();
            about.Style.Add("background-color", "lightgrey");
            about.Style.Add("color", "red");
            about.Style.Add("border-bottom", "solid 3px red");
            if (!IsPostBack)
            {
                //get the querystring
                string id = Request.QueryString["id"];
            }
        }

        protected void FormView1_ItemUpdating(object sender, FormViewUpdateEventArgs e)
        {
            try
            {
                string path = "~/UploadedImages/";
                var fileupload = (FileUpload)FormView1.FindControl("FileUpload1");
                if (fileupload.HasFile)
                {
                    string id = Request.QueryString["id"];

                    SqlConnection connection;
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    string sql = null;
                    string connetionString = "Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-managementPortalWebforms-20171011122107.mdf;Initial Catalog=aspnet-managementPortalWebforms-20171011122107;Integrated Security=True";
                    connection = new SqlConnection(connetionString);
                    sql = "Select Image from items Where Id = " + id;
                    try
                    {
                        connection.Open();
                        adapter.SelectCommand = new SqlCommand(sql, connection);
                        var x = adapter.SelectCommand.ExecuteReader();
                        while (x.Read())
                        {
                            var url = x["Image"].ToString();
                            if (File.Exists(Server.MapPath(url)))
                            {
                                File.Delete(Server.MapPath(url));
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                    fileupload.SaveAs(Path.Combine(Server.MapPath("~\\UploadedImages\\"), fileupload.FileName));
                    SqlDataSource1.UpdateParameters["Image"].DefaultValue = "~/UploadedImages/" + fileupload.FileName;
                }
                else
                {
                    var id = Request.QueryString["id"];

                    SqlConnection connection;
                    SqlDataAdapter adapter = new SqlDataAdapter();
                    string sql = null;
                    string connetionString = "Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-managementPortalWebforms-20171011122107.mdf;Initial Catalog=aspnet-managementPortalWebforms-20171011122107;Integrated Security=True";
                    connection = new SqlConnection(connetionString);
                    sql = "Select Image from items Where Id = " + id;
                    try
                    {
                        connection.Open();
                        adapter.SelectCommand = new SqlCommand(sql, connection);
                        var x = adapter.SelectCommand.ExecuteReader();
                        while (x.Read())
                        {
                            var url = x["Image"].ToString();
                            SqlDataSource1.UpdateParameters["Image"].DefaultValue = url;
                        }
                    }
                    catch (Exception ex)
                    {
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void FormView1_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("~/portal/asdf/about.aspx");
        }

        protected void FormView1_DataBound(object sender, EventArgs e)
        {
            var id = Request.QueryString["id"];

            SqlConnection connection;
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = null;
            string connetionString = "Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-managementPortalWebforms-20171011122107.mdf;Initial Catalog=aspnet-managementPortalWebforms-20171011122107;Integrated Security=True";
            connection = new SqlConnection(connetionString);
            sql = "Select Image from items Where Id = " + id;
            try
            {
                connection.Open();
                adapter.SelectCommand = new SqlCommand(sql, connection);
                var x = adapter.SelectCommand.ExecuteReader();
                while (x.Read())
                {
                    var url = x["Image"].ToString();
                    var image = (Image)FormView1.FindControl("Image");
                    image.ImageUrl = url;
                }
            }
            catch (Exception ex)
            {
            }
        }
    }
}