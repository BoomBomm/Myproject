<%@ Page Title="详细信息" Language="C#" MasterPageFile="~/User.master" AutoEventWireup="true" CodeFile="detail.aspx.cs" Inherits="detail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="row" style="padding-top: 50px">
        <asp:Repeater ID="rptrProductDetails" runat="server">
            <ItemTemplate>
                <div class="col-sm-12">
                    <img  style="width:80%;height:80%"  src="images/<%#DataBinder.Eval(Container.DataItem,"image") %>" alt="image" />
                    <div class="caption">
                        <div class="">标题 <%#DataBinder.Eval(Container.DataItem,"subject") %></div>
                        <p><%#DataBinder.Eval(Container.DataItem,"contant") %></p>
                        <div class="proViews"><span class="">观看次数 <%#DataBinder.Eval(Container.DataItem,"views")   %></span><span class="proPriceDiscount">(时间 <%#DataBinder.Eval(Container.DataItem,"addtime") %>)</span></div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
    <div>
        <br />
        <br />
        <div class="form-group">
            <label for="name">留言</label>
            <textarea id="text1" class="form-control" rows="3" runat="Server"></textarea>
            <asp:Button ID="Button1" CssClass="btn btn-default" runat="server" Text="发送" OnClick="Button1_Click" />
        </div>
        <h3>留言板</h3>
        <asp:DataList ID="DataList1" runat="server">
            <ItemTemplate>
                <img src="images/T01.jpg" height="40" width="40">
                留言者: <%# Eval("username") %>
                           EMAIL: <%# Eval("emali") %>
                           留言时间: <%# Eval("posttime")%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:LinkButton
                               ID="LinkButton1" runat="server" CommandArgument='<%# Eval("mid")%>' CausesValidation="false" OnClick="LinkButton1_Click">回复留言</asp:LinkButton>
                &nbsp;&nbsp;&nbsp;
                           <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("mid")%>' CausesValidation="false" OnClick="LinkButton2_Click">删除留言</asp:LinkButton>
                <br />
                <hr />
                留言内容: <%# Eval("content")%>
                <br />
                <hr />
                回复内容: <%# Eval("reply")%>
                <br />
                <hr />
            </ItemTemplate>
        </asp:DataList>
    </div>
</asp:Content>

