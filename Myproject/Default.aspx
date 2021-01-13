<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>二次元分かち合い</title>
   <script src="js/jquery-3.2.1.min.js"></script>
    <!-- Bootstrap -->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/Custom-Cs.css" rel="stylesheet" />
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        #carousel-example-generic {
				height: 600px;
			}
        #carousel-example-generic .carousel-inner>.item>img {
			display: block;
			width: 100%;
			height: 600px;
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="navbar navbar-default navbar-fixed-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="Default.aspx"><span>
                            <img alt="Logo" src="Images/Kyoani.png" height="30" /></span>二次元分かち合い</a>
                    </div>
                    <div class="navbar-collapse collapse">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="active"><a href="Default.aspx">首页</a></li>
                            <li><a href="Eliteposts.aspx">精华帖子</a></li>
                            <li id="btnSignup" runat="server"><a href="SignUp.aspx">Sign Up</a></li>
                            <li id="btnSignin" runat="server"><a href="SignIn.aspx">Sign In</a></li>
                            <li>
                                <asp:Button ID="btnSignOut" runat="server" Class="btn btn-default navbar-btn" Text="Sign out" OnClick="btnSignOut_Click" />
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><b class="caret"></b></a>
                                <ul id="UserStatus" runat="server" class="dropdown-menu">
                                    <li><a href="AddProduct.aspx">发表作品</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>

            <!--- Carousel -->

            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                <!-- Indicators -->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox">
                    <div class="item active">
                        <img src="Images/01.jpg" alt="..."/>
                    </div>
                    <div class="item">
                        <img src="Images/02.jpg" alt="..."/>
                        <div class="carousel-caption">
                        </div>
                    </div>
                    <div class="item">
                        <img src="Images/03.jpg" alt="..."/>
                        <div class="carousel-caption">
                        </div>
                    </div>
                </div>

                <!-- Controls -->
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <!--- Carousel -->

        </div>
        <br />
        <br />
        <!--- Middle Contents -->
        <div class="container left">
            <h2>动漫专区</h2>
            <div class="row">
                <div class="col-sm-4">
                    <h3>动漫分享</h3>
                    <p><a class="btn btn-default" href="Products.aspx?fid=1" role="button"><img class="img-circle" src="Images/T01.jpg" alt="thumb01" width="140" height="140" />
                     &raquo;</a></p>
                </div>
                <div class="col-sm-4">
                    
                    <h3>动漫交流</h3>
                    <p><a class="btn btn-default" href="Products.aspx?fid=2" role="button"><img class="img-circle" src="Images/T02.png" alt="thumb02" width="140" height="140" />&raquo;</a></p>
                </div>
                <div class="col-sm-4">
                    
                    <h3>漫画分享</h3>
                    <p><a class="btn btn-default" href="Products.aspx?fid=3" role="button"><img class="img-circle" src="Images/T03.jpg" alt="thumb03" width="140" height="140" /> &raquo;</a></p>
                </div>
            </div>
        </div>
        <!--- Middle Contents -->

        <!--- Footer  -->

        <hr />

        <footer>
            <div class="container center">
                <p class="pull-right"><a class="btn btn-default" href="#">Back to top</a></p>
                <p>&copy; 2021 XXXXXXX.com &middot; <a href="Default.aspx">首页</a>  &middot; <a href="Eliteposts.aspx">精华帖子</a>&middot; <a href="Background.aspx">后台管理</a></p>
            </div>
        </footer>

        <!--- Footer -->

    </form>
    
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
