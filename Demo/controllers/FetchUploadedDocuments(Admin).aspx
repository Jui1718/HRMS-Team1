<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="FetchUploadedDocuments(Admin).aspx.cs"
    Inherits="Demo.Controllers.FetchUploadedDocuments_Admin_" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Uploaded Document List</title>

    <!-- DataTables CSS -->
    <link rel="stylesheet"
          href="https://cdn.datatables.net/1.13.8/css/jquery.dataTables.min.css" />

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.8/js/jquery.dataTables.min.js"></script>

</head>

<body>

<form id="form1" runat="server">

    <h2>Uploaded Document List</h2>

    <asp:GridView ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="display"
        ClientIDMode="Static"
        OnRowCommand="GridView1_RowCommand">

        <Columns>

            <asp:BoundField
                DataField="DocumentId"
                HeaderText="Document ID" />

            <asp:BoundField
                DataField="FileName"
                HeaderText="Document Name" />

            <asp:BoundField
                DataField="UserId"
                HeaderText="User ID" />

            <asp:TemplateField HeaderText="Action">

                <ItemTemplate>

                    <asp:LinkButton
                        ID="btnView"
                        runat="server"
                        CommandName="ViewDocument"
                        CommandArgument='<%# Eval("id") %>'
                        Text="👁">
                    </asp:LinkButton>

                    &nbsp;

                    <asp:LinkButton
                        ID="btnDownload"
                        runat="server"
                        CommandName="DownloadDocument"
                        CommandArgument='<%# Eval("id") %>'
                        Text="⇩">
                    </asp:LinkButton>

                    &nbsp;

                    <asp:LinkButton
                        ID="btnDelete"
                        runat="server"
                        CommandName="DeleteDocument"
                        CommandArgument='<%# Eval("id") %>'
                        Text="🗑"
                        OnClientClick="return confirm('Are you sure you want to delete this document?');">
                    </asp:LinkButton>

                </ItemTemplate>

            </asp:TemplateField>

        </Columns>

    </asp:GridView>

</form>

<script>

$(document).ready(function() {

    $('#GridView1').DataTable({
        "pageLength": 5,
        "lengthMenu": [5, 10, 25, 50, 100],
        "ordering": true,
        "searching": true
    });

});

</script>

</body>
</html>