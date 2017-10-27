using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

        protected void FormView1_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/portal/asdf/");
        }

        protected void FormView1_ItemCreated(object sender, EventArgs e)
        {
            //Response.Redirect("~/portal/asdf/");
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                int id = (int.Parse(rowView["Id"].ToString())); 

                HtmlAnchor editLink = (HtmlAnchor) e.Row.FindControl("editLink");
                editLink.HRef = "~/portal/asdf/updateabout.aspx?id=" + id;

            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            string id = GridView1.Rows[e.RowIndex].Cells[0].Text;

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

                      
        }
    }
}