<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Eliteposts.aspx.cs" Inherits="Eliteposts" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>精华</title>
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
                            <li><a href="Default.aspx">首页</a></li>
                            <li class="active"><a href="Eliteposts.aspx">精华帖子</a></li>
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
           <div class="container center">
               <h2>日夜の精华</h2>
               <div class="row">
                   <div class="col-md-2"></div>
                   <div class="col-md-9">
                       <asp:DataList ID="DataList1" runat="server" BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" CellPadding="4" GridLines="Horizontal" Width="750px" CellSpacing="2">
                           <FooterStyle BackColor="White" ForeColor="#333333" />
                           <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                           <HeaderTemplate>
                               <div class="row">
                                   <div class="col-sm-4">标题</div>
                                   <div class="col-sm-4">作者ID</div>
                                   <div class="col-sm-4">时间</div>
                               </div>
                           </HeaderTemplate>
                           <ItemStyle BackColor="White" ForeColor="#333333" />
                           <ItemTemplate>
                               <a href="detail.aspx?tid=<%#Eval("tid") %>"><div class="row">
                                   <div class="col-sm-4">[精]<asp:Image ImageUrl="images/boom.png" runat="server" Height="25px" /><asp:Label ID="Label2" runat="server" Text=""><%#Eval("subject") %></asp:Label></div>
                                   <div class="col-sm-4"><asp:Label ID="Label3" runat="server" Text=""><%#Eval("uid") %></asp:Label></div>
                                   <div class="col-sm-4"><asp:Label ID="Label4" runat="server" Text=""><%#Eval("addtime") %></asp:Label></div>
                               </div>
                               </a>
                           </ItemTemplate>
                           <SelectedItemStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                       </asp:DataList>
                   </div>
               </div>
           </div>
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
    <script src="js/bootstrap.min.js"></script>
</body>
</html>
