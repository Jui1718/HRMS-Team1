<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserController.aspx.cs" Inherits="ProjectDemo.UserController" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />
    <meta name="description" content="Smarthr - Bootstrap Admin Template" />
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects" />
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template" />
    <meta name="robots" content="noindex, nofollow" />

    <title>SmartHR - Employees</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png" />

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="assets/img/apple-touch-icon.png" />

    <!-- Theme Script -->
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

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap-datetimepicker.min.css" />

    <!-- Color Picker CSS -->
    <link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css" />
    <link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css" />

    <!-- Daterangepicker CSS -->
    <link rel="stylesheet" href="assets/plugins/daterangepicker/daterangepicker.css" />

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="assets/css/dataTables.bootstrap5.min.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="assets/css/style.css" />

</head>

<body>

    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <!-- Hidden Employee ID -->
        <asp:HiddenField ID="HiddenField1" runat="server" />

        <!-- Main Wrapper -->
        <div class="main-wrapper">

            <!-- Page Wrapper -->
            <div class="page-wrapper">

                <div class="content">

                    <!-- Page Header -->
                    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                        <div class="my-auto mb-2">

                            <h2 class="mb-1">Employee</h2>

                            <nav>

                                <ol class="breadcrumb mb-0">

                                    <li class="breadcrumb-item">

                                        <a href="index.html">
                                            <i class="ti ti-smart-home"></i>
                                        </a>

                                    </li>

                                    <li class="breadcrumb-item">Employee
                                    </li>

                                    <li class="breadcrumb-item active" aria-current="page">Employee List
                                    </li>

                                </ol>

                            </nav>

                        </div>

                        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

                            <!-- List / Grid -->
                            <div class="me-2 mb-2">

                                <div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">

                                    <a href="UserController.aspx"
                                        class="btn btn-icon btn-sm active bg-primary text-white me-1">

                                        <i class="ti ti-list-tree"></i>

                                    </a>

                                    <a href="javascript:void(0);"
                                        class="btn btn-icon btn-sm">

                                        <i class="ti ti-layout-grid"></i>

                                    </a>

                                </div>

                            </div>

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

                            <!-- Add Employee -->
                            <div class="mb-2">

                                <a href="#"
                                    data-bs-toggle="modal"
                                    data-bs-target="#add_employee"
                                    class="btn btn-primary d-flex align-items-center">

                                    <i class="ti ti-circle-plus me-2"></i>
                                    Add Employee

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
                    <!-- /Page Header -->


                    <!-- Employee Cards -->
                    <div class="row">

                        <!-- Total Employee -->
                        <div class="col-lg-3 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body d-flex align-items-center justify-content-between">

                                    <div class="d-flex align-items-center overflow-hidden">

                                        <div>
                                            <span class="avatar avatar-lg bg-dark rounded-circle">
                                                <i class="ti ti-users"></i>
                                            </span>
                                        </div>

                                        <div class="ms-2 overflow-hidden">

                                            <p class="fs-12 fw-medium mb-1 text-truncate">
                                                Total Employee
                                            </p>

                                            <h4>
                                                <asp:Label ID="lblTotalEmployee"
                                                    runat="server"
                                                    Text="0">
                                                </asp:Label>
                                            </h4>

                                        </div>

                                    </div>

                                    <div>

                                        <span class="badge badge-soft-purple badge-sm fw-normal">

                                            <i class="ti ti-arrow-wave-right-down"></i>
                                            +19.01%

                                        </span>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Total Employee -->


                        <!-- Active -->
                        <div class="col-lg-3 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body d-flex align-items-center justify-content-between">

                                    <div class="d-flex align-items-center overflow-hidden">

                                        <div>

                                            <span class="avatar avatar-lg bg-success rounded-circle">

                                                <i class="ti ti-user-share"></i>

                                            </span>

                                        </div>

                                        <div class="ms-2 overflow-hidden">

                                            <p class="fs-12 fw-medium mb-1 text-truncate">
                                                Active
                                            </p>

                                            <h4>
                                                <asp:Label ID="lblActiveEmployee"
                                                    runat="server"
                                                    Text="0">
                                                </asp:Label>
                                            </h4>

                                        </div>

                                    </div>

                                    <div>

                                        <span class="badge badge-soft-primary badge-sm fw-normal">

                                            <i class="ti ti-arrow-wave-right-down"></i>
                                            +19.01%

                                        </span>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Active -->


                        <!-- Inactive -->
                        <div class="col-lg-3 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body d-flex align-items-center justify-content-between">

                                    <div class="d-flex align-items-center overflow-hidden">

                                        <div>

                                            <span class="avatar avatar-lg bg-danger rounded-circle">

                                                <i class="ti ti-user-pause"></i>

                                            </span>

                                        </div>

                                        <div class="ms-2 overflow-hidden">

                                            <p class="fs-12 fw-medium mb-1 text-truncate">
                                                InActive
                                            </p>

                                            <h4>
                                                <asp:Label ID="lblInactiveEmployee"
                                                    runat="server"
                                                    Text="0">
                                                </asp:Label>
                                            </h4>

                                        </div>

                                    </div>

                                    <div>

                                        <span class="badge badge-soft-dark badge-sm fw-normal">

                                            <i class="ti ti-arrow-wave-right-down"></i>
                                            +19.01%

                                        </span>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /Inactive -->


                        <!-- New Joiners -->
                        <div class="col-lg-3 col-md-6 d-flex">

                            <div class="card flex-fill">

                                <div class="card-body d-flex align-items-center justify-content-between">

                                    <div class="d-flex align-items-center overflow-hidden">

                                        <div>

                                            <span class="avatar avatar-lg bg-info rounded-circle">

                                                <i class="ti ti-user-plus"></i>

                                            </span>

                                        </div>

                                        <div class="ms-2 overflow-hidden">

                                            <p class="fs-12 fw-medium mb-1 text-truncate">
                                                New Joiners
                                            </p>

                                            <h4>
                                                <asp:Label ID="lblNewJoiners"
                                                    runat="server"
                                                    Text="0">
                                                </asp:Label>
                                            </h4>

                                        </div>

                                    </div>

                                    <div>

                                        <span class="badge badge-soft-secondary badge-sm fw-normal">

                                            <i class="ti ti-arrow-wave-right-down"></i>
                                            +19.01%

                                        </span>

                                    </div>

                                </div>

                            </div>

                        </div>
                        <!-- /New Joiners -->

                    </div>
                    <!-- /Employee Cards -->


                    <!-- Employee List Card -->
                    <div class="card">

                        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">

                            <h5>Employee List</h5>

                            <div class="d-flex my-xl-auto right-content align-items-center flex-wrap row-gap-3">

                                <!-- Date -->
                                <div class="me-3">

                                    <div class="input-icon-end position-relative">

                                        <input type="text"
                                            class="form-control date-range bookingrange"
                                            placeholder="dd/mm/yyyy - dd/mm/yyyy" />

                                        <span class="input-icon-addon">
                                            <i class="ti ti-chevron-down"></i>
                                        </span>

                                    </div>

                                </div>


                                <!-- Designation -->
                                <div class="dropdown me-3">

                                    <a href="javascript:void(0);"
                                        class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                                        data-bs-toggle="dropdown">Designation

                                    </a>

                                    <ul class="dropdown-menu dropdown-menu-end p-3">

                                        <li>
                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Finance
                                            </a>
                                        </li>

                                        <li>
                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Developer
                                            </a>
                                        </li>

                                        <li>
                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Executive
                                            </a>
                                        </li>

                                    </ul>

                                </div>


                                <!-- Status -->
                                <div class="dropdown me-3">

                                    <a href="javascript:void(0);"
                                        class="dropdown-toggle btn btn-white d-inline-flex align-items-center"
                                        data-bs-toggle="dropdown">Select Status

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
                                                class="dropdown-item rounded-1">Ascending

                                            </a>

                                        </li>

                                        <li>

                                            <a href="javascript:void(0);"
                                                class="dropdown-item rounded-1">Descending

                                            </a>

                                        </li>

                                    </ul>

                                </div>

                            </div>

                        </div>


                        <!-- Table -->
                        <div class="card-body p-0">

                            <div class="custom-datatable-filter table-responsive">

                                <asp:GridView ID="GridView1"
                                    runat="server"
                                    AutoGenerateColumns="False"
                                    CssClass="table datatable"
                                    GridLines="None"
                                    OnRowCommand="GridView1_RowCommand">

                                    <Columns>

                                        <%-- Id --%>
                                        <asp:BoundField
                                            DataField="UserId"
                                            HeaderText="Id" />

                                        <%-- Name --%>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>

                                                <div class="d-flex align-items-center">

                                                    <div class="avatar avatar-md">
                                                        <img src="assets/img/users/user-32.jpg"
                                                            class="img-fluid rounded-circle"
                                                            alt="img">
                                                    </div>

                                                    <div class="ms-2">
                                                        <p class="text-dark mb-0">

                                                            <%# Eval("FirstName") %>
                                                            <%# Eval("LastName") %>
                                                        </p>
                                                    </div>

                                                </div>

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--         Email --%>
                                        <asp:BoundField
                                            DataField="Email"
                                            HeaderText="Email" />

                                        <%--  Number --%>
                                        <asp:BoundField
                                            DataField="PhoneNumber"
                                            HeaderText="Number" />

                                        <%-- Designation --%>
                                        <asp:BoundField
                                            DataField="DesignationName"
                                            HeaderText="Designation" />

                                        <%-- Reporting Manager --%>
                                        <asp:BoundField
                                            DataField="ReportingManagerName"
                                            HeaderText="Reporting manager" />

                                        <%--  DOJ --%>
                                        <asp:BoundField
                                            DataField="DateOfJoining"
                                            HeaderText="DOJ"
                                            DataFormatString="{0:dd MMM yyyy}" />

                                        <%-- Status --%>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>

                                                <span class='<%# Eval("Status").ToString() == "Active" ? "badge badge-success d-inline-flex align-items-center badge-xs" : "badge badge-danger d-inline-flex align-items-center badge-sm" %>'>

                                                    <i class="ti ti-point-filled me-1"></i>

                                                    <%# Eval("Status") %>

                                                </span>

                                            </ItemTemplate>
                                        </asp:TemplateField>

                                        <%--  Created By --%>
                                        <asp:BoundField
                                            DataField="CreatedBy"
                                            HeaderText="CreatedBy" />

                                        <%-- Modified By --%>
                                        <asp:BoundField
                                            DataField="ModifiedBy"
                                            HeaderText="ModifiedBy" />

                                        <%-- Action --%>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>

                                                <div class="action-icon d-inline-flex">

                                                    <asp:LinkButton
                                                        ID="btnEdit"
                                                        runat="server"
                                                        CssClass="me-2"
                                                        CommandName="Upd"
                                                        CommandArgument='<%# Eval("UserId") %>'
                                                        CausesValidation="false">

                        <i class="ti ti-edit"></i>

                                                    </asp:LinkButton>

                                                    <asp:LinkButton
                                                        ID="btnDelete"
                                                        runat="server"
                                                        CssClass="text-danger"
                                                        CommandName="Del"
                                                        CommandArgument='<%# Eval("UserId") %>'
                                                        CausesValidation="false">

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
                    <!-- /Employee List Card -->

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
            <!-- /Page Wrapper -->


            <!-- ===================================================== -->
            <!-- ADD EMPLOYEE MODAL -->
            <!-- ===================================================== -->

            <div class="modal fade"
                id="add_employee"
                tabindex="-1"
                aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered modal-lg">

                    <div class="modal-content">


                        <!-- Header -->
                        <div class="modal-header">

                            <div class="d-flex align-items-center">

                                <h4 class="modal-title me-2">Add New Employee
                                </h4>

                            </div>

                            <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">

                                <i class="ti ti-x"></i>

                            </button>

                        </div>


                        <!-- Tabs -->
                        <div class="contact-grids-tab">

                            <ul class="nav nav-underline"
                                id="myTab"
                                role="tablist">

                                <li class="nav-item"
                                    role="presentation">

                                    <button class="nav-link active"
                                        id="info-tab"
                                        data-bs-toggle="tab"
                                        data-bs-target="#basic-info"
                                        type="button"
                                        role="tab"
                                        aria-selected="true">
                                        Basic Information

                                    </button>

                                </li>

                            </ul>

                        </div>


                        <div class="tab-content"
                            id="myTabContent">

                            <div class="tab-pane fade show active"
                                id="basic-info"
                                role="tabpanel"
                                aria-labelledby="info-tab">

                                <div class="modal-body pb-0">

                                    <div class="row">


                                        <!-- Profile Picture -->
                                        <div class="col-md-12">

                                            <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                                <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">

                                                    <i class="ti ti-photo text-gray-2 fs-16"></i>

                                                </div>

                                                <div class="profile-upload">

                                                    <div class="mb-2">

                                                        <h6 class="mb-1">Upload Profile Image
                                                        </h6>

                                                        <p class="fs-12">
                                                            Image should be below 4 mb
                                                        </p>

                                                    </div>

                                                    <div class="profile-uploader d-flex align-items-center">

                                                        <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                                            Upload

                                                        <asp:FileUpload
                                                            ID="FileUpload1"
                                                            runat="server"
                                                            CssClass="form-control image-sign" />

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- First Name -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    First Name
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox1"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Last Name -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Last Name
                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox2"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Joining Date -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Joining Date
                                                <span class="text-danger">*</span>

                                                </label>

                                                <div class="input-icon-end position-relative">

                                                    <asp:TextBox
                                                        ID="TextBox5"
                                                        runat="server"
                                                        TextMode="Date"
                                                        CssClass="form-control">
                                                    </asp:TextBox>

                                                    <span class="input-icon-addon">

                                                        <i class="ti ti-calendar text-gray-7"></i>

                                                    </span>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Birth Date -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Birth Date
                                                </label>

                                                <div class="input-icon-end position-relative">

                                                    <asp:TextBox
                                                        ID="TextBox6"
                                                        runat="server"
                                                        TextMode="Date"
                                                        CssClass="form-control">
                                                    </asp:TextBox>

                                                    <span class="input-icon-addon">

                                                        <i class="ti ti-calendar text-gray-7"></i>

                                                    </span>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Role -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Role
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList1"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Manager -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Manager
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList3"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Address -->
                                        <div class="col-md-12">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Address
                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox8"
                                                    runat="server"
                                                    CssClass="form-control"
                                                    TextMode="MultiLine"
                                                    Rows="3">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Email -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Email
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox3"
                                                    runat="server"
                                                    TextMode="Email"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Password -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Password
                                                <span class="text-danger">*</span>

                                                </label>

                                                <div class="pass-group">

                                                    <asp:TextBox
                                                        ID="TextBox4"
                                                        runat="server"
                                                        TextMode="Password"
                                                        CssClass="pass-input form-control">
                                                    </asp:TextBox>

                                                    <span class="ti toggle-password ti-eye-off"></span>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Phone -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Phone Number
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox7"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Department -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Department
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList2"
                                                    runat="server"
                                                    CssClass="form-control"
                                                    AutoPostBack="true"
                                                    OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Gender -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Gender
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList5"
                                                    runat="server"
                                                    CssClass="form-control">

                                                    <asp:ListItem
                                                        Text="Select"
                                                        Value="">
                                                    </asp:ListItem>

                                                    <asp:ListItem
                                                        Text="Male"
                                                        Value="Male">
                                                    </asp:ListItem>

                                                    <asp:ListItem
                                                        Text="Female"
                                                        Value="Female">
                                                    </asp:ListItem>

                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Status -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Status
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList6"
                                                    runat="server"
                                                    CssClass="form-control">

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


                                        <!-- Designation -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Designation
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList4"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- About -->
                                        <div class="col-md-12">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    About
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox9"
                                                    runat="server"
                                                    CssClass="form-control"
                                                    TextMode="MultiLine"
                                                    Rows="3">
                                                </asp:TextBox>

                                            </div>

                                        </div>

                                    </div>

                                </div>


                                <!-- Footer -->
                                <div class="modal-footer">

                                    <button type="button"
                                        class="btn btn-outline-light border me-2"
                                        data-bs-dismiss="modal">
                                        Cancel

                                    </button>

                                    <asp:Button
                                        ID="Button1"
                                        runat="server"
                                        Text="Save"
                                        CssClass="btn btn-primary"
                                        OnClick="Button1_Click"
                                        CausesValidation="false" />

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
            <!-- /Add Employee -->


            <!-- ===================================================== -->
            <!-- EDIT EMPLOYEE MODAL -->
            <!-- ===================================================== -->

            <div class="modal fade"
                id="edit_employee"
                tabindex="-1"
                aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered modal-lg">

                    <div class="modal-content">


                        <!-- Header -->
                        <div class="modal-header">

                            <div class="d-flex align-items-center">

                                <h4 class="modal-title me-2">Edit Employee
                                </h4>

                                <span>Employee ID :

                                <asp:Label
                                    ID="lblEmployeeId"
                                    runat="server">
                                </asp:Label>

                                </span>

                            </div>

                            <button type="button"
                                class="btn-close custom-btn-close"
                                data-bs-dismiss="modal"
                                aria-label="Close">

                                <i class="ti ti-x"></i>

                            </button>

                        </div>


                        <!-- Tabs -->
                        <div class="contact-grids-tab">

                            <ul class="nav nav-underline"
                                id="myTab2"
                                role="tablist">

                                <li class="nav-item"
                                    role="presentation">

                                    <button class="nav-link active"
                                        id="info-tab2"
                                        data-bs-toggle="tab"
                                        data-bs-target="#basic-info2"
                                        type="button"
                                        role="tab"
                                        aria-selected="true">
                                        Basic Information

                                    </button>

                                </li>

                            </ul>

                        </div>


                        <div class="tab-content"
                            id="myTabContent2">

                            <div class="tab-pane fade show active"
                                id="basic-info2"
                                role="tabpanel"
                                aria-labelledby="info-tab2">


                                <div class="modal-body pb-0">

                                    <div class="row">


                                        <!-- Profile Picture -->
                                        <div class="col-md-12">

                                            <div class="d-flex align-items-center flex-wrap row-gap-3 bg-light w-100 rounded p-3 mb-4">

                                                <div class="d-flex align-items-center justify-content-center avatar avatar-xxl rounded-circle border border-dashed me-2 flex-shrink-0 text-dark frames">

                                                    <i class="ti ti-photo text-gray-2 fs-16"></i>

                                                </div>

                                                <div class="profile-upload">

                                                    <div class="mb-2">

                                                        <h6 class="mb-1">Upload Profile Image
                                                        </h6>

                                                        <p class="fs-12">
                                                            Image should be below 4 mb
                                                        </p>

                                                    </div>

                                                    <div class="profile-uploader d-flex align-items-center">

                                                        <div class="drag-upload-btn btn btn-sm btn-primary me-2">
                                                            Upload

                                                        <asp:FileUpload
                                                            ID="FileUpload2"
                                                            runat="server"
                                                            CssClass="form-control image-sign" />

                                                        </div>

                                                    </div>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- First Name -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    First Name
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox10"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Last Name -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Last Name
                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox11"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Joining Date -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Joining Date
                                                <span class="text-danger">*</span>

                                                </label>

                                                <div class="input-icon-end position-relative">

                                                    <asp:TextBox
                                                        ID="TextBox12"
                                                        runat="server"
                                                        TextMode="Date"
                                                        CssClass="form-control">
                                                    </asp:TextBox>

                                                    <span class="input-icon-addon">

                                                        <i class="ti ti-calendar text-gray-7"></i>

                                                    </span>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Birth Date -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Birth Date
                                                </label>

                                                <div class="input-icon-end position-relative">

                                                    <asp:TextBox
                                                        ID="TextBox13"
                                                        runat="server"
                                                        TextMode="Date"
                                                        CssClass="form-control">
                                                    </asp:TextBox>

                                                    <span class="input-icon-addon">

                                                        <i class="ti ti-calendar text-gray-7"></i>

                                                    </span>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Role -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Role
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList7"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Manager -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Manager
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList8"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Address -->
                                        <div class="col-md-12">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Address
                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox14"
                                                    runat="server"
                                                    CssClass="form-control"
                                                    TextMode="MultiLine"
                                                    Rows="3">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Email -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Email
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox15"
                                                    runat="server"
                                                    TextMode="Email"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Password -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Password
                                                <span class="text-danger">*</span>

                                                </label>

                                                <div class="pass-group">

                                                    <asp:TextBox
                                                        ID="TextBox16"
                                                        runat="server"
                                                        TextMode="Password"
                                                        CssClass="pass-input form-control">
                                                    </asp:TextBox>

                                                    <span class="ti toggle-password ti-eye-off"></span>

                                                </div>

                                            </div>

                                        </div>


                                        <!-- Phone -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Phone Number
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox17"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:TextBox>

                                            </div>

                                        </div>


                                        <!-- Department -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Department
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList9"
                                                    runat="server"
                                                    CssClass="form-control"
                                                    AutoPostBack="true"
                                                    OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Gender -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Gender
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList10"
                                                    runat="server"
                                                    CssClass="form-control">

                                                    <asp:ListItem
                                                        Text="Select"
                                                        Value="">
                                                    </asp:ListItem>

                                                    <asp:ListItem
                                                        Text="Male"
                                                        Value="Male">
                                                    </asp:ListItem>

                                                    <asp:ListItem
                                                        Text="Female"
                                                        Value="Female">
                                                    </asp:ListItem>

                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- Status -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Status
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList11"
                                                    runat="server"
                                                    CssClass="form-control">

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


                                        <!-- Designation -->
                                        <div class="col-md-6">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    Designation
                                                </label>

                                                <asp:DropDownList
                                                    ID="DropDownList12"
                                                    runat="server"
                                                    CssClass="form-control">
                                                </asp:DropDownList>

                                            </div>

                                        </div>


                                        <!-- About -->
                                        <div class="col-md-12">

                                            <div class="mb-3">

                                                <label class="form-label">
                                                    About
                                                <span class="text-danger">*</span>

                                                </label>

                                                <asp:TextBox
                                                    ID="TextBox18"
                                                    runat="server"
                                                    CssClass="form-control"
                                                    TextMode="MultiLine"
                                                    Rows="3">
                                                </asp:TextBox>

                                            </div>

                                        </div>

                                    </div>

                                </div>


                                <!-- Footer -->
                                <div class="modal-footer">

                                    <asp:Button
                                        ID="Button2"
                                        runat="server"
                                        Text="Cancel"
                                        CssClass="btn btn-outline-light border me-2"
                                        OnClick="Button2_Click"
                                        CausesValidation="false" />

                                    <asp:Button
                                        ID="Button3"
                                        runat="server"
                                        Text="Update"
                                        CssClass="btn btn-primary"
                                        OnClick="Button3_Click"
                                        CausesValidation="false" />

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
            <!-- /Edit Employee -->


            <!-- ===================================================== -->
            <!-- DELETE MODAL -->
            <!-- ===================================================== -->

            <div class="modal fade"
                id="delete_modal"
                tabindex="-1"
                aria-hidden="true">

                <div class="modal-dialog modal-dialog-centered modal-sm">

                    <div class="modal-content">

                        <div class="modal-body text-center">

                            <span class="avatar avatar-xl bg-transparent-danger text-danger mb-3">

                                <i class="ti ti-trash-x fs-36"></i>

                            </span>

                            <h4 class="mb-1">Confirm Delete
                            </h4>

                            <p class="mb-3">
                                You want to delete this employee.
                            This can't be undone once you delete.

                            </p>

                            <div class="d-flex justify-content-center">

                                <button type="button"
                                    class="btn btn-light me-3"
                                    data-bs-dismiss="modal">
                                    Cancel

                                </button>

                                <button type="button"
                                    class="btn btn-danger">
                                    Yes, Delete

                                </button>

                            </div>

                        </div>

                    </div>

                </div>

            </div>
            <!-- /Delete Modal -->


        </div>
        <!-- /Main Wrapper -->


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

        <!-- Color Picker -->
        <script src="assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

        <!-- DataTable -->
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

        <!-- Theme -->
        <script src="assets/js/theme-colorpicker.js"></script>
        <script src="assets/js/script.js"></script>

    </form>

</body>
</html>
