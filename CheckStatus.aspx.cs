using Microsoft.ApplicationInsights;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CheckStatus : System.Web.UI.Page
{
    private TelemetryClient telemetry = new TelemetryClient();
    object username;
    protected void Page_Load(object sender, EventArgs e)
    {
        telemetry.TrackPageView("Page View: CheckStatus");
        username = Session["username"];
        if(username == null)
            Response.Redirect("Signin.aspx");
        if (username.ToString() != "admin")
        {
            updateStatus.Attributes.Add("style", "display: none;");
        }
        string id = Request.QueryString.Get("cid");
        if(id != null && id != "")
        {
            Fetch_And_Draw(id);
        }
        else
        {
            info.Attributes.Add("style", "visibility: hidden");
        }
        if (HttpContext.Current.Request.IsSecureConnection.Equals(false) && HttpContext.Current.Request.IsLocal.Equals(false))
        {
            Response.Redirect("https://" + Request.ServerVariables["HTTP_HOST"]
        + HttpContext.Current.Request.RawUrl);
        }
    }

    public void Fetch_And_Draw(string id)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["mhasan93ConnectionString"].ConnectionString);
        con.Open();
        string query = "select * from items where id = " + id;
        if (username.ToString() != "admin")
            query += " and senderName='" + username.ToString() + "'";
        SqlCommand cmd = new SqlCommand(query, con);
        SqlDataReader reader = cmd.ExecuteReader();
        if (!reader.HasRows)
        {
            Dictionary<string, string> props = new Dictionary<string, string>();
            props.Add("CID", id);
            props.Add("Username", username.ToString());
            telemetry.TrackEvent("Possible Offending Request", props);
            info.Attributes.Add("style", "visibility: hidden");
            error_msg.InnerText = "Invalid container id";
            con.Close();
            return;
        }
        while (reader.Read())
        {
            cid.InnerHtml += id;
            sender.InnerHtml += (string)reader["senderName"];
            receiver.InnerHtml += (string)reader["receiverName"];
            source.InnerHtml += (string)reader["itemSource"];
            destination.InnerHtml += (string)reader["itemDestination"];
            string cStatus = (string)reader["itemStatus"];
            if (cStatus == "Processing")
                status.Attributes.Add("style", "color: orange");
            else if (cStatus == "Shipped")
                status.Style.Value = "color: blue";
            else if (cStatus == "Delivered")
                status.Style.Value = "color: green";
            status.InnerHtml = cStatus;
        }
        con.Close();
    }

    protected void submit_Click(object sender, EventArgs e)
    {
        Response.Redirect("CheckStatus.aspx?cid=" + container_id.Text);
    }
}