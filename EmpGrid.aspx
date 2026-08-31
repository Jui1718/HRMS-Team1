<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmpGrid.aspx.cs" Inherits="Project360.EmployeesController.EmpGrid" %>

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
    <link rel="shortcut icon" type="/image/x-icon" href="/assets/img/favicon.png" />

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="/assets/img/apple-touch-icon.png" />

    <!-- Theme Script js -->
    <script src="/assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap.min.css" />

    <!-- Feather CSS -->
    <link rel="stylesheet" href="/assets/plugins/icons/feather/feather.css" />

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="/assets/plugins/tabler-icons/tabler-icons.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="/assets/plugins/select2/css/select2.min.css" />

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="/assets/plugins/fontawesome/css/fontawesome.min.css" />
    <link rel="stylesheet" href="/assets/plugins/fontawesome/css/all.min.css" />

    <!-- Color Picker Css -->
    <link rel="stylesheet" href="/assets/plugins/flatpickr/flatpickr.min.css" />
    <link rel="stylesheet" href="/assets/plugins/@simonwep/pickr/themes/nano.min.css" />

    <!-- Daterangepikcer CSS -->
    <link rel="stylesheet" href="/assets/plugins/daterangepicker/daterangepicker.css" />

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="/assets/css/dataTables.bootstrap5.min.css" />

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="/assets/css/bootstrap-datetimepicker.min.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="/assets/plugins/select2/css/select2.min.css" />

    <!-- Bootstrap Tagsinput CSS -->
    <link rel="stylesheet" href="/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="/assets/css/style.css" />
</head>
<body>
    <form id="form1" runat="server">

        <div class="page-wrapper">
            <div class="content">


                <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                    <div class="my-auto mb-2">
                        <h2 class="mb-1">Employee</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="index.html"><i class="ti ti-smart-home"></i></a>
                                </li>
                                <li class="breadcrumb-item">Employee
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">Employee Grid</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
                        <div class="me-2 mb-2">
                            <div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
                                <a href="employees.html" class="btn btn-icon btn-sm me-1"><i class="ti ti-list-tree"></i></a>
                                <a href="employees-grid.html" class="btn btn-icon btn-sm active bg-primary text-white"><i class="ti ti-layout-grid"></i></a>
                            </div>
                        </div>
                        <div class="me-2 mb-2">
                            <div class="dropdown">
                                <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">
                                    <i class="ti ti-file-export me-1"></i>Export
                                </a>
                                <ul class="dropdown-menu  dropdown-menu-end p-3">
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-pdf me-1"></i>Export as PDF</a>
                                    </li>
                                    <li>
                                        <a href="javascript:void(0);" class="dropdown-item rounded-1"><i class="ti ti-file-type-xls me-1"></i>Export as Excel </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="mb-2">
                            <a href="Employee.aspx" data-bs-toggle="modal" data-bs-target="#add_employee" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Employee</a>
                        </div>
                        <div class="head-icons ms-2">
                            <a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
                                <i class="ti ti-chevrons-up"></i>
                            </a>
                        </div>
                    </div>
                </div>



                <div class="row">

                    <!-- Total Plans -->
                    <div class="col-lg-3 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center overflow-hidden">
                                    <div>
                                        <span class="avatar avatar-lg bg-dark rounded-circle"><i class="ti ti-users"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-medium mb-1 text-truncate">Total Employee</p>
                                        <h4 id="TotalEmp" runat="server"><%#Eval("TotalEmployee")%></h4>
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
                    <!-- /Total Plans -->

                    <!-- Total Plans -->
                    <div class="col-lg-3 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center overflow-hidden">
                                    <div>
                                        <span class="avatar avatar-lg bg-success rounded-circle"><i class="ti ti-user-share"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-medium mb-1 text-truncate">Active</p>
                                        <h4 id="Activeemp" runat="server"><%#Eval("ActiveEmployee") %></h4>
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
                    <!-- /Total Plans -->

                    <!-- Inactive Plans -->
                    <div class="col-lg-3 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center overflow-hidden">
                                    <div>
                                        <span class="avatar avatar-lg bg-danger rounded-circle"><i class="ti ti-user-pause"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-medium mb-1 text-truncate">InActive</p>
                                        <h4 id="Inactive" runat="server"><%#Eval("InActiveEmployee") %></h4>
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
                    <!-- /Inactive Companies -->

                    <!-- No of Plans  -->
                    <div class="col-lg-3 col-md-6 d-flex">
                        <div class="card flex-fill">
                            <div class="card-body d-flex align-items-center justify-content-between">
                                <div class="d-flex align-items-center overflow-hidden">
                                    <div>
                                        <span class="avatar avatar-lg bg-info rounded-circle"><i class="ti ti-user-plus"></i></span>
                                    </div>
                                    <div class="ms-2 overflow-hidden">
                                        <p class="fs-12 fw-medium mb-1 text-truncate">New Joiners</p>
                                        <h4 id="Newjoin" runat="server"><%#Eval("NewJoiners") %></h4>
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
                    <!-- /No of Plans -->

                </div>

                <div class="card">
                    <div class="card-body p-3">
                        <div class="d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                            <h5>Employees Grid</h5>
                            <div class="d-flex align-items-center flex-wrap row-gap-3">
                                <div class="dropdown me-3">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Designation </a>
                                    <div class="dropdown me-3">
                                        <ul class="dropdown-menu dropdown-menu-end p-3">

                                            <asp:DataList ID="DataList2" runat="server">

                                                <ItemTemplate>

                                                    <li>
                                                        <asp:LinkButton ID="lnkDesignation"
                                                            runat="server"
                                                            Text='<%# Eval("Name") %>'
                                                            CssClass="dropdown-item rounded-1">

                                                        </asp:LinkButton>
                                                    </li>

                                                </ItemTemplate>

                                            </asp:DataList>

                                        </ul>
                                    </div>
                                </div>

                                <div class="dropdown">
                                    <a href="javascript:void(0);" class="dropdown-toggle btn btn-white d-inline-flex align-items-center" data-bs-toggle="dropdown">Sort By : Last 7 Days
                                    </a>
                                    <ul class="dropdown-menu  dropdown-menu-end p-3">
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Last 7 Days</a>
                                        </li>
                                        <li>
                                            <a href="javascript:void(0);" class="dropdown-item rounded-1">Ascending</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>



                <div class="row">
                    <asp:DataList ID="DataList1" runat="server"
                        RepeatDirection="Horizontal"
                        RepeatLayout="flow">

                        <ItemTemplate>

                            <div style="width: 24%; display: inline-block; vertical-align: central; align-items-end; margin: 0.5%;">
                                <div class="card">
                                    <div class="card-body">

                                        <div class="d-flex justify-content-between align-items-start mb-2">

                                            <div class="form-check form-check-md">
                                                <input class="form-check-input" type="checkbox" />
                                            </div>

                                            <div>
                                                <a href='employee-details.aspx?id=<%# Eval("UserId") %>'
                                                    class="avatar avatar-xl avatar-rounded online border p-1 border-primary rounded-circle">

                                                    <img src='<%#Eval("ProfilePicture") %>'
                                                        class="img-fluid h-auto w-auto"
                                                        alt="Employee" />
                                                </a>
                                            </div>

                                            <div class="dropdown">
                                                <button class="btn btn-icon btn-sm rounded-circle"
                                                    type="button"
                                                    data-bs-toggle="dropdown">

                                                    <i class="ti ti-dots-vertical"></i>

                                                </button>

                                                <ul class="dropdown-menu dropdown-menu-end p-3">

                                                    <li>
                                                        <a class="dropdown-item rounded-1"
                                                            href='employee-edit.aspx?id=<%# Eval("UserId") %>'>

                                                            <i class="ti ti-edit me-1"></i>
                                                            Edit

                                                        </a>
                                                    </li>

                                                    <li>
                                                        <a class="dropdown-item rounded-1"
                                                            href='employee-delete.aspx?id=<%# Eval("UserId") %>'>

                                                            <i class="ti ti-trash me-1"></i>
                                                            Delete

                                                        </a>
                                                    </li>

                                                </ul>
                                            </div>

                                        </div>

                                        <div class="text-center mb-3">

                                            <h6 class="mb-1">
                                                <a href='employee-details.aspx?id=<%# Eval("UserId") %>'>
                                                    <%# Eval("FirstName") %>
                                                </a>
                                            </h6>

                                            <span class="badge badge-purple-transparent fs-10 fw-medium">
                                                <%# Eval("Designation") %>
                                            </span>

                                        </div>

                                        <div class="row text-center">

                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <span class="fs-12">Projects</span>
                                                    <h6 class="fw-medium">
                                                        <%# Eval("Projects") %>
                                                    </h6>
                                                </div>
                                            </div>

                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <span class="fs-12">Done</span>
                                                    <h6 class="fw-medium">
                                                        <%# Eval("Done") %>
                                                    </h6>
                                                </div>
                                            </div>

                                            <div class="col-4">
                                                <div class="mb-3">
                                                    <span class="fs-12">Progress</span>
                                                    <h6 class="fw-medium">
                                                        <%# Eval("Progress") %>
                                                    </h6>
                                                </div>
                                            </div>

                                        </div>

                                        <p class="mb-2 text-center">
                                            Productivity :
                       
                                    <span class="text-purple">'<%# Eval("Productivity") %>%'
                                    </span>
                                        </p>

                                        <div class="progress progress-xs mb-2">

                                            <div class="progress-bar bg-purple"
                                                role="progressbar"
                                                style='<%# "width:" + Eval("Productivity") + "%;" %>'>
                                            </div>

                                        </div>

                                    </div>
                                </div>
                            </div>

                        </ItemTemplate>

                    </asp:DataList>
                </div>

            </div>
        </div>
    </form>

    <!-- jQuery -->
    <script src="/assets/js/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="/assets/js/bootstrap.bundle.min.js"></script>

    <!-- Feather Icon JS -->
    <script src="/assets/js/feather.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="/assets/js/jquery.slimscroll.min.js"></script>

    <!-- Color Picker JS -->
    <script src="/assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Datatable JS -->
    <script src="/assets/js/jquery.dataTables.min.js"></script>
    <script src="/assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Daterangepikcer JS -->
    <script src="/assets/js/moment.js"></script>
    <script src="/assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="/assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Select2 JS -->
    <script src="/assets/plugins/select2/js/select2.min.js"></script>

    <!-- Chart JS -->
    <script src="/assets/plugins/apexchart/apexcharts.min.js"></script>
    <script src="/assets/plugins/apexchart/chart-data.js"></script>

    <!-- Bootstrap Tagsinput JS -->
    <script src="/assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

    <!-- Custom JS -->
    <script src="/assets/js/theme-colorpicker.js"></script>
    <script src="/assets/js/script.js"></script>
</body>
</html>
