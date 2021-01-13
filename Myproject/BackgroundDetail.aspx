<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BackgroundDetail.aspx.cs" Inherits="BackGround_DetailInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>详细页面</title>
    <script type="text/javascript" src="../Scripts/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="../Scripts/bootstrap.min.js"></script>
    <link href="../Content/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .row {
            margin-top:20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="row">
                <div class="col-xs-6 text-right">图片：</div>
                <div class="col-xs-6 text-left"><span id="txtImg" runat="server" style="width:100px;height:60px"></span></div>
            </div>
            <div class="row">
                <div class="col-xs-6 text-right">类型：</div>
                <div class="col-xs-6 text-left"><span id="txtType" runat="server" ></span></div>
            </div>
            <div class="row">
                <div class="col-xs-6 text-right">标题：</div>
                <div class="col-xs-6 text-left"><span id="txtTitle" runat="server" ></span></div>
            </div>
            <div class="row">
                <div class="col-xs-6 text-right">信息内容：</div>
                <div class="col-xs-6 text-left"><span id="txtInfo" runat="server" ></span></div>
            </div>
            <div class="row">
                <div class="col-xs-6 text-right">发布时间：</div>
                <div class="col-xs-6 text-left"><span id="txtAddtime" runat="server" ></span></div>
            </div>
            <div class="row">
                <div class="col-xs-6 text-right">作者：</div>
                <div class="col-xs-6 text-left"><span id="txtName" runat="server" ></span></div>
            </div>
        </div>
    </form>
</body>
</html>
