<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDocumentList.aspx.cs" Inherits="Demo.Controllers.AddDocumentName_Admin_" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Admin Document Name List</title>
</head>

<body>

<form id="form1" runat="server">

    <div>

        <h2>Admin Document Name List</h2>

        <br />

        <asp:Button ID="btnAddDocument"
            runat="server"
            Text="Add Document"
            OnClick="btnAddDocument_Click" />

        <br />
        <br />

        Row Per Page

        <asp:DropDownList ID="DropDownList1"
            runat="server"
            AutoPostBack="true"
            OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">

            <asp:ListItem>5</asp:ListItem>
            <asp:ListItem>10</asp:ListItem>
            <asp:ListItem>25</asp:ListItem>
            <asp:ListItem>50</asp:ListItem>
            <asp:ListItem>100</asp:ListItem>

        </asp:DropDownList>

        Entries

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

        Search:

        <asp:TextBox ID="TextBox1"
            runat="server"
            AutoPostBack="true"
            OnTextChanged="TextBox1_TextChanged">
        </asp:TextBox>

        <br />
        <br />

        <asp:GridView ID="GridView1"
            runat="server"
            AutoGenerateColumns="False"
            AllowPaging="true"
            PageSize="5"
            DataKeyNames="Id"
            OnPageIndexChanging="GridView1_PageIndexChanging"
            OnRowCommand="GridView1_RowCommand">

            <Columns>

                <asp:BoundField
                    DataField="Id"
                    HeaderText="Document ID" />

                <asp:BoundField
                    DataField="DocName"
                    HeaderText="Document Name" />

                <asp:TemplateField HeaderText="Action">

                    <ItemTemplate>

                        <asp:LinkButton
                            ID="btnEdit"
                            runat="server"
                            Text="Edit"
                            CommandName="EditDocument"
                            CommandArgument='<%# Eval("Id") %>'>
                        </asp:LinkButton>

                        &nbsp;&nbsp;

                        <asp:LinkButton
                            ID="btnDelete"
                            runat="server"
                            Text="Delete"
                            CommandName="DeleteDocument"
                            CommandArgument='<%# Eval("Id") %>'
                            OnClientClick="return confirm('Are you sure you want to delete this document?');">
                        </asp:LinkButton>

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>

</form>

</body>

</html>