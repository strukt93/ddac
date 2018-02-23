<%@ Page Language="C#" AutoEventWireup="true" CodeFile="User.aspx.cs" Inherits="User" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Tracking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>
<body>
    <form id="form1" runat="server">
        <nav class="navbar navbar-default">
            <div class="container-fluid">
                <div class="navbar-header">
                    <a class="navbar-brand" href="#">Container Tracking System</a>
                </div>
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="Default.aspx">Home</a></li>
                    <li class="active"><a href="User.aspx">Profile</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Operations
                    <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="AddItem.aspx">Add new</a></li>
                            <li><a href="CheckStatus.aspx">Check Status</a></li>
                            <li id="updateStatus" runat="server"><a href="UpdateStatus.aspx">Update Status</a></li>
                        </ul>
                    </li>
                    <li><a href="Signout.aspx">Logout</a></li>
                </ul>
            </div>
        </nav>
        <div class="container">
            <div class="row">
                <h1>Personal info</h1>
                <h4>Username:&nbsp;<span id="uname" runat="server" style="color: #f5821f;"></span></h4>
                <h4>Phone No:&nbsp;<span id="phoneNo" runat="server" style="color: #f5821f;"></span></h4>
            </div>
            <div class="row" id="containers" runat="server">
                <h1>Containers</h1>

            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mhasan93ConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
    </form>
</body>
</html>
