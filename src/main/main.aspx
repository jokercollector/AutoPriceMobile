﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Template.Master" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="AutoPriceMobile.src.main.main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="../../Assets/Stylesheets/masterStyle.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="this_box">
    <h2>
        Friend Items
    </h2>
    <fieldset>
        <asp:GridView ID="FriendItems" runat="server" DataKeyNames="UserID" OnRowDeleting="FriendItems_RowDeleting" AutoGenerateColumns="false" EmptyDataText="There are no items to display. Please check back later!" RowStyle-HorizontalAlign="Center" GridLines="None" Width="1300px" OnRowDataBound="FriendItems_RowDataBound">
            <AlternatingRowStyle BackColor="White" Height="50px"/>
            <Columns>
                <asp:BoundField DataField="StockName" HeaderText="Item Name" SortExpression="StockName" ItemStyle-Width="100px" />
                <asp:TemplateField HeaderText="Item Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="300px" Width="300px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("StockImage")) %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StockDescription" HeaderText="Item Description" SortExpression="StockDescription" ItemStyle-Width="300px" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" ItemStyle-Width="100px" Visible="false"/>
                <asp:HyperLinkField DataTextField="UserName" DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="~/src/main/profileView.aspx?ID={0}" HeaderText="User Name" ItemStyle-Width="300px"/>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Time" HeaderText="Time Elapsed" SortExpression="Time" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Status" ItemStyle-Width="200px" Visible="false"></asp:BoundField>
                <asp:TemplateField>
			            <ItemTemplate >
				            <asp:LinkButton ID="Buy" runat="server" CommandName="Buy"
				            OnClientClick="return confirm('Are you sure you want to buy this item?');">Buy
				            </asp:LinkButton>
			            </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="#6BB9F0" height="30px"/>
            <RowStyle BackColor="#E3EAEB" height="300px"/>
        </asp:GridView>
    </fieldset>    
    </div>
    <div class="this_box">
    <h2>
        Global Item Lists
    </h2>
    <fieldset>
        <asp:GridView ID="GlobalItems" runat="server" DataKeyNames="UserID" OnRowDeleting="GlobalItems_RowDeleting" AutoGenerateColumns="false" EmptyDataText="There are no items to display. Please check back later!" RowStyle-HorizontalAlign="Center" GridLines="None" Width="1300px" OnRowDataBound="GlobalItems_RowDataBound">
            <AlternatingRowStyle BackColor="White" Height="50px"/>
            <Columns>
                <asp:BoundField DataField="StockName" HeaderText="Item Name" SortExpression="StockName" ItemStyle-Width="100px" />
                <asp:TemplateField HeaderText="Item Image">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="300px" Width="300px" ImageUrl='<%#"data:Image/png;base64," + Convert.ToBase64String((byte[])Eval("StockImage")) %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="StockDescription" HeaderText="Item Description" SortExpression="StockDescription" ItemStyle-Width="300px" />
                <asp:BoundField DataField="UserID" HeaderText="UserID" SortExpression="UserID" ItemStyle-Width="300px" Visible="false"/>
                <asp:HyperLinkField DataTextField="UserName" DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="~/src/main/profileView.aspx?ID={0}" HeaderText="User Name" ItemStyle-Width="300px"/>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Time" HeaderText="Time Elapsed" SortExpression="Time" ItemStyle-Width="100px" />
                <asp:BoundField DataField="Status" ItemStyle-Width="200px" Visible="false"></asp:BoundField>
                <asp:TemplateField>
			            <ItemTemplate >
				            <asp:LinkButton ID="Buy" runat="server" CommandName="Buy"
				            OnClientClick="return confirm('Are you sure you want to buy this item?');">Buy
				            </asp:LinkButton>
			            </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#FFFFFF" Font-Bold="True" ForeColor="#6BB9F0" height="30px"/>
            <RowStyle BackColor="#E3EAEB" height="300px"/>
        </asp:GridView>
    </fieldset>
    </div>
</asp:Content>
