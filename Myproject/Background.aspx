<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Background.aspx.cs" Inherits="Background" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>后台审核界面</title>
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
                            <li>
                                <asp:Button ID="btnSignOut" runat="server" Class="btn btn-default navbar-btn" Text="Sign out" OnClick="btnSignOut_Click" />
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>标题</th>
                        <th>类型</th>
                        <th>作者ID</th>
                        <th>审核状态</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (drs != null)
                        {
                            foreach (System.Data.DataRow dr in drs)
                            {
                    %>
                    <tr>
                        <td><%=dr["tid"] %></td>
                        <td><%=dr["subject"] %></td>
                        <td><%=dr["ftype"] %></td>
                        <td><%=dr["uid"] %></td>
                        <td><%=dr["isaudit"].ToString()=="1"?"<font color='green'>已审核</font>":"<font color='red'>未审核</font>"%></td>
                        <td>
                            <input type="submit" value="查看详细" class="btn btn-default" onclick="setOpear(<%=dr["tid"] %>)" />
                            <input type="submit" value="通过/取消" class="btn btn-default" onclick="setOpear(<%=dr["tid"] %>, '<%=dr["isaudit"]%>')" />
                        </td>
                    </tr>
                    <%
                            }
                        }
                    %>
                </tbody>
                <tfoot>
                    <tr>
                        <td colspan="6">共<asp:Label ID="TotalPageIndex" runat="server" Text="1"></asp:Label>页&nbsp;
                            当前第<asp:Label ID="CurPageIndex" runat="server" Text="1"></asp:Label>页&nbsp;
                            <asp:LinkButton ID="UpPage" runat="server" OnClick="UpPage_Click">上一页</asp:LinkButton>
                            <asp:LinkButton ID="DownPage" runat="server" OnClick="DownPage_Click">下一页</asp:LinkButton>
                        </td>
                    </tr>
                </tfoot>
            </table>
        </div>
        <script type="text/javascript">
            function setOpear(setID, setCheckState) {
                $("#opearID").val(setID);
                if (setCheckState == "1" || setCheckState == "0") {
                    $("#opearCheckState").val(setCheckState);
                }
            }
        </script>
        <input type="hidden" id="opearID" name="opearID" value=""/>
        <input type="hidden" id="opearCheckState" name="opearCheckState" value=""/>
    </form>
</body>
</html>
