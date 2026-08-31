<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskBoard.aspx.cs" Inherits="Demo.Controllers.TaskBoard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add New Board" OnClick="Button1_Click" />
            <br />
            <br />
            total task :
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            Pending :<asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
            <br />
            <br />
            Completed :
            <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; search project&nbsp; :
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            select status :<asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                <asp:ListItem Value="Pending">Inprogress</asp:ListItem>
                <asp:ListItem Value="Onhold">Onhold</asp:ListItem>
                <asp:ListItem Value="Completed">Completed </asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            &nbsp;Priority :&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" Text="All"  OnClick="Button2_Click" />
&nbsp;
            <asp:Button ID="Button3" runat="server" Text="High"  OnClick="Button3_Click"/>
&nbsp;
            <asp:Button ID="Button4" runat="server" Text="Medium"  OnClick="Button4_Click"/>
&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="Low"  OnClick="Button5_Click"/>
            <br />
            <br />
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
            
            <br />
            <br />
        </div>
    </form>
</body>
</html>
