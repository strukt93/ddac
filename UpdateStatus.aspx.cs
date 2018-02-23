using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.ApplicationInsights;


public partial class UpdateStatus : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        telemetry.TrackPageView("Page View: UpdateStatus");
        object username = Session["username"];
        if (username == null)
            Response.Redirect("Signin.aspx");
        if (username.ToString() != "admin")
        {
            Dictionary<string, string> props = new Dictionary<string, string>();
            props.Add("Username", username.ToString());
            props.Add("RemoteAddress", Request.UserHostAddress.ToString());
            telemetry.TrackEvent("Unauthorized Access", props);
            Response.Redirect("Default.aspx");
        }
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }
    }

    protected void update_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mhasan93ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("update dbo.items set itemStatus ='" + status.SelectedValue + "' where id =" + container_id.Text, con);
        try
        {
            cmd.ExecuteNonQuery();
        }
        catch (SqlException ex)
        {
            Response.Write("<script>onload = function(){error_msg.innerHTML = 'Item update was unsuccessful';}</script>");
            telemetry.TrackException(ex);
            return;
        }
        Response.Write("<script>onload = function(){success_msg.innerHTML = 'Item updated successfully, redirecting...';setTimeout('location=\"CheckStatus.aspx?cid=" + container_id.Text + "\"', 2000);}</script>");
    }
}