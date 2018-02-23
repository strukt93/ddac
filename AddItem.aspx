<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddItem.aspx.cs" Inherits="AddItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Container Tracking System</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css" />
</head>

<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="Default.aspx">Container Tracking System</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="Default.aspx">Home</a></li>
                <li><a href="User.aspx">Profile</a></li>
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">Operations
                    <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu">
                        <li class="active"><a href="AddItem.aspx">Add new</a></li>
                        <li><a href="CheckStatus.aspx">Check Status</a></li>
                        <li id="updateStatus" runat="server"><a href="UpdateStatus.aspx">Update Status</a></li>
                    </ul>
                </li>
                <li><a href="Signout.aspx">Logout</a></li>
            </ul>
        </div>
    </nav>
    <br />
    <br />
    <div class="container">
        <center><font color="green" id="success_msg"></font></center>
        <center><font color="red" id="error_msg"></font></center>
        <h1 class="col-lg-10 well ">Registration Form</h1>
        <div class="col-lg-10 well">
            <div class="row">
                <form id="form1" runat="server">
                    <div class="col-sm-12">
                        <div class="form-group">
                            <label>Sender Name</label>
                            <asp:TextBox ID="senderName" reqiured ReadOnly class="form-control" placeholder="Enter Sender Name Here.." runat="server" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Receiver Name</label>
                            <asp:TextBox ID="receiverName" reqiured class="form-control" placeholder="Enter Receiver Name Here.." runat="server" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Shippment Source</label>
                            <asp:TextBox ID="source" reqiured class="form-control" placeholder="Enter Shippment Source Here.." runat="server" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Shippment Destination</label>
                            <asp:TextBox ID="destination" reqiured class="form-control" placeholder="Enter Shippment Destination Here.." runat="server" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Sender Phone Number</label>
                            <asp:TextBox ID="senderNo" reqiured class="form-control" placeholder="Enter Sender Phone Number Here.." runat="server" required></asp:TextBox>
                        </div>
                        <div class="form-group">
                            <label>Receiver Phone Number</label>
                            <asp:TextBox ID="receiverNo" reqiured class="form-control" placeholder="Enter Receiver Phone Number Here.." runat="server" required></asp:TextBox>
                        </div>
                        <asp:Button ID="submit" runat="server" Text="Submit" class="btn btn-lg btn-primary btn-block orange-back" OnClick="submit_Click" />
                    </div>
                </form>
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:mhasan93ConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
</body>

</html>
