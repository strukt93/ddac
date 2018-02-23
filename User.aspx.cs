using Microsoft.ApplicationInsights;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class User : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        telemetry.TrackPageView("Page View: User");
        object username = Session["username"];
        if (username == null)
            Response.Redirect("Signin.aspx");
        if (username.ToString() != "admin")
        {
            updateStatus.Attributes.Add("style", "display: none;");
        }

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mhasan93ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select id from items where senderName = '" + username.ToString() + "'", con);
        SqlDataReader reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            int id = (int)reader["id"];
            containers.InnerHtml += "<a href='CheckStatus.aspx?cid=" + id + "'>Container #" + id + "</a><br />";
        }
        con.Close();
        con.Open();
        cmd = new SqlCommand("select username, phoneNo from users where username='" + username.ToString() + "'", con);
        reader = cmd.ExecuteReader();
        while (reader.Read())
        {
            string unameStr = (string)reader["username"];
            string phoneNoStr = (string)reader["phoneNo"];
            uname.InnerText = unameStr;
            phoneNo.InnerText = phoneNoStr;
        }
        con.Close();
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }
    }
}