<%@ Page Title="漫画分享" Language="C#" MasterPageFile="~/user.master" AutoEventWireup="true" CodeFile="Products2.aspx.cs" Inherits="Products" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div class="row" style="padding-top: 50px">
        <asp:Repeater ID="rptrProducts" runat="server">
            <ItemTemplate>
                <div class="col-sm-3 col-md-3">
                    <a style="text-decoration:none;" href="detail.aspx?tid=<%#DataBinder.Eval(Container.DataItem,"tid") %>">
                    <div class="thumbnail">
                        <img src="images/ProductImages/03/<%#DataBinder.Eval(Container.DataItem,"image") %>" alt="image"/>
                        <div class="caption">
                            <div class="">标题 <%#DataBinder.Eval(Container.DataItem,"subject") %></div>
                            <div class="proViews"><span class="">观看次数 <%#DataBinder.Eval(Container.DataItem,"views")   %></span><span class="proPriceDiscount">(时间 <%#DataBinder.Eval(Container.DataItem,"addtime") %>)</span></div>
                        </div>
                    </div>
                        </a>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:content>

