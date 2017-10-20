using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace managementPortalWebforms
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HtmlAnchor home = (HtmlAnchor) Master.FindControl("home");
            //HtmlAnchor home = FindControl("home") as HtmlAnchor;
            home.Style.Clear();
            home.Style.Add("background-color", "lightgrey");
            home.Style.Add("color", "red");
            home.Style.Add("border-bottom", "solid 3px red");


            //INSERT
            string connetionString = null;
            SqlConnection connection;
            SqlDataAdapter adapter = new SqlDataAdapter();
            string sql = null;
            connetionString = "Data Source=(LocalDb)\\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\\aspnet-managementPortalWebforms-20171011122107.mdf;Initial Catalog=aspnet-managementPortalWebforms-20171011122107;Integrated Security=True";
            connection = new SqlConnection(connetionString);
            sql = "insert into items (Title) values('Title 1')";
            try
            {
                connection.Open();
                adapter.InsertCommand = new SqlCommand(sql, connection);
                adapter.InsertCommand.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
            }
        }
    }
}