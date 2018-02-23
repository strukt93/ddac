<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Container Tracking System</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
    <nav class="navbar navbar-default">
        <div class="container-fluid">
            <div class="navbar-header">
                <a class="navbar-brand" href="#">Container Tracking System</a>
            </div>
            <ul class="nav navbar-nav navbar-right">
                <li class="active"><a href="Default.aspx">Home</a></li>
                <li><a href="User.aspx">Profile</a></li>
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
        <h1 style="text-align: center; padding-bottom: 20px; text-shadow: 2px 2px 2px #c87c3b; color: #ff7600;">Welcome to Container Tracking System</h1>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="https://media.wired.com/photos/5a035e6f06eea65aaa281ea2/master/w_2400,c_limit/cargoship-TA.jpg" alt="Los Angeles" style="height: 430px; width: 100%">
                </div>

                <div class="item">
                    <img src="https://theloadstar.co.uk/wp-content/uploads/%C2%A9-Roza-_l_20426071.jpg" alt="Chicago" style="height: 430px; width: 100%">
                </div>

                <div class="item">
                    <img src="http://maritime-connector.com/ships_uploads/angeles-9399791-container_ship-8-140885.jpg" alt="New York" style="height: 430px; width: 100%">
                </div>
            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
        <br>
        <br>
        <div class="row">
            <div class="col-md-4">
                <div class="thumbnail">
                    <a href="#">
                        <img src="https://fthmb.tqn.com/k-ysvFs4bnJhVMekNBZ-ANueJVc=/2115x1418/filters:no_upscale():fill(transparent,1)/GettyImages-157113429-58c243bc5f9b58af5c07f2f2.jpg" alt="" style="width: 100%">
                        <div class="caption">
                            <p>Lorem ipsum...</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <a href="#">
                        <img src="https://images.techhive.com/images/article/2014/06/6070181195_1417accffe_b-100310846-primary.idge.jpg" alt="" style="width: 100%">
                        <div class="caption">
                            <p>Lorem ipsum...</p>
                        </div>
                    </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="thumbnail">
                    <a href="#">
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSttdS_KkzMhkjBpPU3zoK5frM-uE6iOai3i-gKilNHoJOeeYfHNQ" alt="" style="width: 100%">
                        <div class="caption">
                            <p>Lorem ipsum...</p>
                        </div>
                    </a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
