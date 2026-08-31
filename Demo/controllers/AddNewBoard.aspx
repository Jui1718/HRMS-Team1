<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddNewBoard.aspx.cs" Inherits="Demo.Controllers.AddNewBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            Task Board<br />
            <br />
            Project Name :
                      <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true" 
    OnSelectedIndexChanged="DropDownListProject_SelectedIndexChanged">
</asp:DropDownList>
            <br />
            <br />
            Task name :
            <asp:DropDownList ID="DropDownList2" runat="server">
            </asp:DropDownList>
            <br />
            <br />
            Percentage :
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Due date :
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />
<asp:Button 
    ID="Button1" 
    runat="server" 
    Text="Save"
    OnClick="Button1_Click" />            <br />
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
