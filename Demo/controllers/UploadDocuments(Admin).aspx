<%@ Page Language="C#" AutoEventWireup="true"
    CodeBehind="UploadDocuments(Admin).aspx.cs"
    Inherits="Demo.Controllers.UploadDocuments_Admin_" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <title>Upload Documents</title>

    <script type="text/javascript">

        function addRow() {

            var rowCount =
                document.getElementById("rowCount");

            rowCount.value =
                parseInt(rowCount.value) + 1;

            __doPostBack('AddRow', '');
        }

    </script>

</head>

<body>

<form id="form1"
      runat="server"
      enctype="multipart/form-data">

    <div>

        <h2>Admin File Upload</h2>

        <br />

        User Email:

        <asp:DropDownList
            ID="ddlUser"
            runat="server">
        </asp:DropDownList>

        <br />
        <br />

        <asp:HiddenField
            ID="rowCount"
            runat="server"
            Value="1" />

        <asp:Panel
            ID="pnlDocuments"
            runat="server">
        </asp:Panel>

        <br />

        <input
            type="button"
            value="+"
            onclick="addRow()" />

        <br />
        <br />

        <asp:Button
            ID="btnSave"
            runat="server"
            Text="Save"
            OnClick="btnSave_Click" />

    </div>

</form>

</body>

</html>