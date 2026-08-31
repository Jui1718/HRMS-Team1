<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddTask.aspx.cs" Inherits="Demo.Controllers.AddTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <title>Add New Task</title>

   

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />

    <!-- Tabler Icons -->
    <link rel="stylesheet" href="../assets/plugins/tabler-icons/tabler-icons.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="../assets/css/style.css" />
</head>
    <script src="../assets/js/jquery-3.7.1.min.js"></script>
<script src="../assets/js/bootstrap.bundle.min.js"></script>

<body>
    <form id="form1" runat="server">
         <!-- Main Wrapper -->
    <div class="page-wrapper">

        <!-- Page Content -->
        <div class="content">
      <!-- Breadcrumb -->
<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

    <div class="my-auto mb-2">

        <h2 class="mb-1">Add New Task</h2>

        <nav>
            <ol class="breadcrumb mb-0">

                <li class="breadcrumb-item">
                    <a href="index.html">
                        <i class="ti ti-smart-home"></i>
                    </a>
                </li>

                <li class="breadcrumb-item">
                    Employee
                </li>

                <li class="breadcrumb-item active" aria-current="page">
                    Add Task
                </li>

            </ol>
        </nav>

    </div>

</div>
<!-- /Breadcrumb -->
            <div class="card">
    <div class="card-body">

        <h4 class="mb-4">Add New Task</h4>

        <!-- YOUR EXISTING CONTROLS -->
            <br />
            Add New Task<br />
            <br />
            Title :
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />
            Due Date:
            <asp:TextBox ID="TextBox2" runat="server" TextMode="Date"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
            <br />
            <br />

            <%--here we have to fetch all the projects names from allProject table  procedure name (GetAllProjects)--%>
            select Project : <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="true"
    OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
</asp:DropDownList>
            <br />
            <br />
            select members :
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" Height="16px">
            </asp:CheckBoxList>
            <br />
            status :
            <asp:DropDownList ID="DropDownList2" runat="server">
                <asp:ListItem>Inprogress</asp:ListItem>
                <asp:ListItem>Completed</asp:ListItem>
                <asp:ListItem>Pending</asp:ListItem>
                <asp:ListItem>Hold</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Priority :
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem>High</asp:ListItem>
                <asp:ListItem>Medium</asp:ListItem>
                <asp:ListItem>Low</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
            Description :
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />
            Upload Attachment :
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add New Task" OnClick="Button1_Click" />            
            <br />
            <br />
            <br />
            <br />
        </div>
                    </div>
</div>
    </form>
</body>
</html>
