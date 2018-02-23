using Microsoft.ApplicationInsights;
using Microsoft.ApplicationInsights.DataContracts;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signin : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        telemetry.TrackPageView("Page View: Signin");
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }
    }

    protected void signin_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mhasan93ConnectionString"].ConnectionString);
        con.Open();
        SqlCommand cmd = new SqlCommand("select count(*) from users where username = '"
        + username.Text + "' and password = '" + password.Text + "'", con);
        int count = Convert.ToInt32(cmd.ExecuteScalar().ToString());
        if(count > 0)
        {
            Session["username"] = username.Text;
            Response.Redirect("Default.aspx");
        }
        else
        {
            var requestTelemetry = new RequestTelemetry();
            requestTelemetry.Context.Properties["Body"] = Request.Form.ToString();
            requestTelemetry.Context.Properties["Referer"] = Request.UrlReferrer.ToString();
            requestTelemetry.Context.Properties["QueryString"] = Request.QueryString.ToString();
            telemetry.TrackRequest(requestTelemetry);
            Response.Write("<script>onload = function(){error_msg.innerHTML = 'Incorrect username/password combination';}</script>");
        }
        }
}