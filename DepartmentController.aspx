<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentController.aspx.cs" Inherits="ProjectDemo.DepartmentController" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta name="description" content="Smarthr - Bootstrap Admin Template" />
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects" />
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template" />
    <meta name="robots" content="noindex, nofollow" />
    <title>Smarthr Admin Template</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png" />

    <!-- Theme Script js -->
    <script src="assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />

    <!-- Feather CSS -->
    <link rel="stylesheet" href="assets/plugins/icons/feather/feather.css" />

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="assets/plugins/tabler-icons/tabler-icons.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/fontawesome.min.css" />
    <link rel="stylesheet" href="assets/plugins/fontawesome/css/all.min.css" />

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css" />
    <link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css" />

    <!-- Daterangepikcer CSS -->
    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css" />

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="assets/plugins/select2/css/select2.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />
</head>

<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <asp:HiddenField ID="HiddenField1" runat="server" />

        <div class="main-wrapper">

            <div class="page-wrapper">

                <div class="content">

                    <!-- Page Header -->
                    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                        <div class="my-auto mb-2">

                            <h2 class="mb-1">Departments</h2>

                            <nav>

                                <ol class="breadcrumb mb-0">

                                    <li class="breadcrumb-item">

                                        <a href="index.html">
                                            <i class="ti ti-smart-home"></i>
                                        </a>

                                    </li>

                                    <li class="breadcrumb-item">Employee
                                    </li>

                                    <li class="breadcrumb-item active" aria-current="page">Departments
                                    </li>

                                </ol>

                            </nav>

                        </div>


                        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                            <!-- Export -->
                            <div class="me-2 mb-2">

                                <div class="dropdown">

                                    <a href="javascript:void(0);"
                                        class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                                        data-bs-toggle="dropdown">

                                        <i class="ti ti-file-export me-1"></i>
                                        Export

                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-3">

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">

                                                <i class="ti ti-file-type-pdf me-1"></i>
                                                Export as PDF

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">

                                                <i class="ti ti-file-type-xls me-1"></i>
                                                Export as Excel

                                            </a>

                                        </li>

                                    </ul>

                                </div>

                            </div>


                            <!-- Add Department -->

                            <div class="mb-2">

                                <a href="#"
                                    data-bs-toggle="modal"
                                    data-bs-target="#exampleModal"
                                    class="btn btn-primary d-flex align-items-center">

                                    <i class="ti ti-circle-plus me-2"></i>

                                    Add Department

                                </a>

                            </div>


                            <!-- Collapse -->

                            <div class="head-icons ms-2">

                                <a href="javascript:void(0);"
                                    data-bs-toggle="tooltip"
                                    data-bs-placement="top"
                                    data-bs-original-title="Collapse"
                                    id="collapse-header">

                                    <i class="ti ti-chevrons-up"></i>

                                </a>

                            </div>

                        </div>

                    </div>


                    <!-- Department List -->

                    <div class="card">

                        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                            <h5>Department List</h5>


                            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                                <!-- Status -->

                                <div class="dropdown me-3">

                                    <a href="javascript:void(0);"
                                        class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                                        data-bs-toggle="dropdown">Status

                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-3">

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Active

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Inactive

                                            </a>

                                        </li>

                                    </ul>

                                </div>


                                <!-- Sort -->

                                <div class="dropdown">

                                    <a href="javascript:void(0);"
                                        class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                                        data-bs-toggle="dropdown">Sort By : Last 7 Days

                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-3">

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Recently Added

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Ascending

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Descending

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Last Month

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Last 7 Days

                                            </a>

                                        </li>

                                    </ul>

                                </div>

                            </div>

                        </div>


                        <!-- Table -->

                        <div class="card-body p-0">

                            <div class="custom-datatable-filter table-responsive">

                                <asp:GridView
                                    ID="GridView1"
                                    runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table"
                                    GridLines="None"
                                    OnRowCommand="GridView1_RowCommand"
                                    EmptyDataText="No departments found.">

                                    <Columns>


                                        <%-- ID --%>

                                        <asp:TemplateField HeaderText="Id">

                                            <ItemTemplate>

                                                <%# Eval("DepartmentId") %>
                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <%--  Department --%>

                                        <asp:TemplateField HeaderText="Department">

                                            <ItemTemplate>

                                                <h6 class="fw-medium mb-0">

                                                    <%# Eval("Name") %>

                                                </h6>

                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <%-- Employees --%>

                                        <asp:TemplateField HeaderText="No of Employees">

                                            <ItemTemplate>

                                                <%# Eval("NoOfEmployee") %>
                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <%--  Status --%>

                                        <asp:TemplateField HeaderText="Status">

                                            <ItemTemplate>

                                                <span class='<%# Eval("Status").ToString() == "Active" ? "badge badge-success d-inline-flex align-items-center badge-xs" : "badge badge-danger d-inline-flex align-items-center badge-xs" %>'>

                                                    <i class="ti ti-point-filled me-1"></i>

                                                    <%# Eval("Status") %>

                                                </span>

                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <%-- Created By --%>

                                        <asp:TemplateField HeaderText="Created By">

                                            <ItemTemplate>

                                                <%# Eval("CreatedBy") %>
                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <%-- Modified By --%>

                                        <asp:TemplateField HeaderText="Modified By">

                                            <ItemTemplate>

                                                <%# Eval("ModifiedBy") %>
                                            </ItemTemplate>

                                        </asp:TemplateField>


                                        <%-- Actions --%>

                                        <asp:TemplateField HeaderText="">

                                            <ItemTemplate>

                                                <div class="action-icon d-inline-flex">


                                                    <%-- Edit --%>

                                                    <asp:LinkButton
                                                        ID="ButtonEdit"
                                                        runat="server"
                                                        CommandName="Upd"
                                                        CommandArgument='<%# Eval("DepartmentId") %>'
                                                        CssClass="me-2"
                                                        ToolTip="Edit">

                                                <i class="ti ti-edit"></i>

                                                    </asp:LinkButton>


                                                    <%-- Delete --%>

                                                    <asp:LinkButton
                                                        ID="ButtonDelete"
                                                        runat="server"
                                                        CommandName="Del"
                                                        CommandArgument='<%# Eval("DepartmentId") %>'
                                                        ToolTip="Delete"
                                                        OnClientClick="return confirm('Are you sure you want to delete this department?');">

                                                <i class="ti ti-trash"></i>

                                                    </asp:LinkButton>


                                                </div>

                                            </ItemTemplate>

                                        </asp:TemplateField>

                                    </Columns>

                                </asp:GridView>

                            </div>

                        </div>

                    </div>

                </div>


                <!-- Footer -->

                <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

                    <p class="mb-0">
                        2014 - 2025 &copy; SmartHR.
                    </p>

                    <p class="mb-0">
                        Designed &amp; Developed By

                <a href="javascript:void(0);"
                    class="text-primary">Dreams

                </a>

                    </p>

                </div>

            </div>


            <!-- ===================================================== -->
            <!-- ADD DEPARTMENT MODAL -->
            <!-- ===================================================== -->

            <!-- Add Department Modal -->
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered modal-md">

                    <div class="modal-content">

                        <!-- Header -->
                        <div class="modal-header">

                            <h4 class="modal-title">Add Department
                            </h4>

                            <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">

                                <i class="ti ti-x"></i>

                            </button>

                        </div>

                        <!-- Body -->
                        <div class="modal-body pb-0">

                            <div class="row">

                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Department Name
                                        </label>

                                        <asp:TextBox
                                            ID="TextBox1"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Enter department name">
                                        </asp:TextBox>

                                    </div>

                                </div>

                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Status
                                        </label>

                                        <asp:DropDownList
                                            ID="DropDownList1"
                                            runat="server"
                                            CssClass="select form-control">

                                            <asp:ListItem
                                                Text="Select"
                                                Value="">
                                            </asp:ListItem>

                                            <asp:ListItem
                                                Text="Active"
                                                Value="Active">
                                            </asp:ListItem>

                                            <asp:ListItem
                                                Text="Inactive"
                                                Value="Inactive">
                                            </asp:ListItem>

                                        </asp:DropDownList>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <%-- Footer --%>
                        <div class="modal-footer">

                            <button type="button"
                                class="btn btn-light me-2"
                                data-bs-dismiss="modal">
                                Cancel

                            </button>

                            <asp:Button
                                ID="Button1"
                                runat="server"
                                Text="Add Department"
                                CssClass="btn btn-primary"
                                OnClick="Button1_Click" />

                        </div>

                    </div>

                </div>

            </div>


            <%-- EDIT DEPARTMENT MODAL --%>

            <!-- Edit Department Modal -->
            <div class="modal fade"
                id="editModal"
                tabindex="-1"
                aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered modal-md">

                    <div class="modal-content">

                        <!-- Header -->
                        <div class="modal-header">

                            <h4 class="modal-title">Edit Department
                            </h4>

                            <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">

                                <i class="ti ti-x"></i>

                            </button>

                        </div>

                        <!-- Body -->
                        <div class="modal-body pb-0">

                            <div class="row">

                                <!-- Department Name -->
                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Department Name
                                        </label>

                                        <asp:TextBox
                                            ID="TextBoxEdit"
                                            runat="server"
                                            CssClass="form-control"
                                            placeholder="Enter department name">
                                        </asp:TextBox>

                                    </div>

                                </div>

                                <!-- Status -->
                                <div class="col-md-12">

                                    <div class="mb-3">

                                        <label class="form-label">
                                            Status
                                        </label>

                                        <asp:DropDownList
                                            ID="DropDownListEdit"
                                            runat="server"
                                            CssClass="select form-control">

                                            <asp:ListItem
                                                Text="Active"
                                                Value="Active">
                                            </asp:ListItem>

                                            <asp:ListItem
                                                Text="Inactive"
                                                Value="Inactive">
                                            </asp:ListItem>

                                        </asp:DropDownList>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <!-- Footer -->
                        <div class="modal-footer">

                            <button type="button"
                                class="btn btn-light me-2"
                                data-bs-dismiss="modal">
                                Cancel

                            </button>

                            <asp:Button
                                ID="Button3"
                                runat="server"
                                Text="Save Department"
                                CssClass="btn btn-primary"
                                OnClick="Button3_Click" />

                        </div>

                    </div>

                </div>

            </div>


            <!-- ===================================================== -->
            <!-- DELETE DEPARTMENT MODAL -->
            <!-- ===================================================== -->

            <div class="modal fade"
                id="delete_modal"
                tabindex="-1"
                aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered">

                    <div class="modal-content">


                        <div class="modal-body text-center">


                            <span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">

                                <i class="ti ti-trash-x fs-36"></i>

                            </span>


                            <h4 class="mb-1">Confirm Delete
                            </h4>


                            <p class="mb-3">
                                You want to delete this department.
                        This can't be undone once you delete.

                            </p>


                            <div class="d-flex justify-content-center">


                                <!-- Cancel -->

                                <button type="button"
                                    class="btn btn-light me-3"
                                    data-bs-dismiss="modal">
                                    Cancel

                                </button>


                                <!-- Confirm Delete -->

                                <asp:LinkButton
                                    ID="ButtonDeleteConfirm"
                                    runat="server"
                                    CssClass="btn btn-danger"
                                    CommandName="ConfirmDelete">

                            Yes, Delete

                                </asp:LinkButton>


                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>


        <!-- ===================================================== -->
        <!-- JAVASCRIPT -->
        <!-- ===================================================== -->

        <!-- jQuery -->
        <script src="assets/js/jquery-3.7.1.min.js"></script>

        <!-- Bootstrap -->
        <script src="assets/js/bootstrap.bundle.min.js"></script>

        <!-- Feather -->
        <script src="assets/js/feather.min.js"></script>

        <!-- Slimscroll -->
        <script src="assets/js/jquery.slimscroll.min.js"></script>

        <!-- Pickr -->
        <script src="assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

        <!-- DataTables -->
        <script src="assets/js/jquery.dataTables.min.js"></script>
        <script src="assets/js/dataTables.bootstrap5.min.js"></script>

        <!-- Moment -->
        <script src="assets/js/moment.js"></script>

        <!-- Date Range Picker -->
        <script src="assets/plugins/daterangepicker/daterangepicker.js"></script>

        <!-- DateTime Picker -->
        <script src="assets/js/bootstrap-datetimepicker.min.js"></script>

        <!-- Select2 -->
        <script src="assets/plugins/select2/js/select2.min.js"></script>

        <!-- Apex Chart -->
        <script src="assets/plugins/apexchart/apexcharts.min.js"></script>
        <script src="assets/plugins/apexchart/chart-data.js"></script>

        <!-- Bootstrap Tags Input -->
        <script src="assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

        <!-- Theme -->
        <script src="assets/js/theme-colorpicker.js"></script>
        <script src="assets/js/script.js"></script>


    </form>

</body>
</html>
