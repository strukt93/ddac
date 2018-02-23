using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationInsights;

public partial class Signup : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    
    protected void Page_Load(object sender, EventArgs e)
    {
        telemetry.TrackPageView("Page View: Signup");
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mhasan93ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("insert into users (username, password, phoneNo) values('"
        + username.Text + "', '" + password.Text + "', '" + phoneNo.Text + "')", con);
        try {
            cmd.ExecuteNonQuery();
        }catch (SqlException ex)
        {
            Response.Write("<script>onload = function(){error_msg.innerHTML = 'Username already exists';}</script>");
            telemetry.TrackException(ex);
            return;
        }
        Response.Write("<script>onload = function(){success_msg.innerHTML = 'Registration success, redirecting...';setTimeout('location=\"Signin.aspx\"', 2000);}</script>");
    }
}