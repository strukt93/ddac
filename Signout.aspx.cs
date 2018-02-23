using Microsoft.ApplicationInsights;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Signout : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    protected void Page_Load(object sender, EventArgs e)
    {
        telemetry.TrackPageView("Page View: Signout");
        Session["username"] = null;
        Response.Redirect("Signin.aspx");
    }
}