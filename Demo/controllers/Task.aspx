<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Task.aspx.cs" Inherits="Demo.Controllers.Task" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">

    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0" />

    <meta name="description" content="Smarthr - Bootstrap Admin Template" />
    <meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects" />
    <meta name="author" content="Dreams technologies - Bootstrap Admin Template" />
    <meta name="robots" content="noindex, nofollow" />

    <title>Task</title>

    <!-- Favicon -->
    <link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png" />

    <!-- Apple Touch Icon -->
    <link rel="apple-touch-icon" sizes="180x180" href="../assets/img/apple-touch-icon.png" />

    <!-- Theme Script -->
    <script src="../assets/js/theme-script.js"></script>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="../assets/css/bootstrap.min.css" />

    <!-- Feather CSS -->
    <link rel="stylesheet" href="../assets/plugins/icons/feather/feather.css" />

    <!-- Tabler Icon CSS -->
    <link rel="stylesheet" href="../assets/plugins/tabler-icons/tabler-icons.css" />

    <!-- Select2 CSS -->
    <link rel="stylesheet" href="../assets/plugins/select2/css/select2.min.css" />

    <!-- Fontawesome CSS -->
    <link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css" />
    <link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css" />

    <!-- Color Picker CSS -->
    <link rel="stylesheet" href="../assets/plugins/flatpickr/flatpickr.min.css" />
    <link rel="stylesheet" href="../assets/plugins/@simonwep/pickr/themes/nano.min.css" />

    <!-- Daterangepicker CSS -->
    <link rel="stylesheet" href="../assets/plugins/daterangepicker/daterangepicker.css" />

    <!-- Datatable CSS -->
    <link rel="stylesheet" href="../assets/css/dataTables.bootstrap5.min.css" />

    <!-- Datetimepicker CSS -->
    <link rel="stylesheet" href="../assets/css/bootstrap-datetimepicker.min.css" />

    <!-- Summernote CSS -->
    <link rel="stylesheet" href="../assets/plugins/summernote/summernote-lite.min.css" />

    <!-- Bootstrap Tagsinput CSS -->
    <link rel="stylesheet" href="../assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css" />

    <!-- Main CSS -->
    <link rel="stylesheet" href="../assets/css/style.css" />

</head>

<body>

    <form id="form1" runat="server">

        <!-- Sidebar -->
        <div id="sidebar-placeholder">
        </div>


        <!-- MAIN PAGE CONTENT -->
        <div class="page-wrapper">

            <div class="content">

                <!-- Breadcrumb -->
                <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

                    <div class="my-auto mb-2">

                        <h2 class="mb-1">Tasks</h2>

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
                                    Tasks
                                </li>

                            </ol>

                        </nav>

                    </div>


                    <div class="my-xl-auto right-content d-flex">

                        <div class="mb-2">

                            <asp:Button
                                ID="Button1"
                                runat="server"
                                Text="Add Task"
                                CssClass="btn btn-primary d-flex align-items-center"
                                OnClick="Button1_Click" />

                        </div>

                    </div>

                </div>
                <!-- /Breadcrumb -->


                <!-- FILTER SECTION -->

                <div class="row">

                    <!-- Search / Date -->

                    <div class="col-md-6">

                        <div>

                            <label class="form-label fw-semibold">
                                Search by Date
                            </label>

                            <div class="d-flex">

                                <asp:TextBox
                                    ID="TextBox1"
                                    runat="server"
                                    CssClass="form-control"
                                    TextMode="Date"
                                    Width="199px">
                                </asp:TextBox>

                                <asp:Button
                                    ID="Button6"
                                    runat="server"
                                    Text="Search"
                                    CssClass="btn btn-primary ms-2"
                                    OnClick="Button6_Click" />

                            </div>

                        </div>

                    </div>


                    <!-- Priority -->

                    <div class="col-md-6">

                        <div>

                            <label class="form-label fw-semibold">
                                Priority
                            </label>

                            <div class="btn-group" role="group">

                                <asp:Button
                                    ID="Button2"
                                    runat="server"
                                    Text="All"
                                    CssClass="btn btn-outline-secondary"
                                    OnClick="Button2_Click" />

                                <asp:Button
                                    ID="Button3"
                                    runat="server"
                                    Text="High"
                                    CssClass="btn btn-outline-secondary"
                                    OnClick="Button3_Click" />

                                <asp:Button
                                    ID="Button4"
                                    runat="server"
                                    Text="Medium"
                                    CssClass="btn btn-outline-secondary"
                                    OnClick="Button4_Click" />

                                <asp:Button
                                    ID="Button5"
                                    runat="server"
                                    Text="Low"
                                    CssClass="btn btn-outline-secondary"
                                    OnClick="Button5_Click" />

                            </div>

                        </div>

                    </div>

                </div>

                <!-- /FILTER SECTION -->


                <br />


                <!-- TASK CONTENT -->

                <div class="row">

                    <div class="col-xl-12">

                        <div class="card">

                            <div class="card-body">

                                <div class="table-responsive">

                                    <div class="row">

    <asp:Repeater ID="Repeater1" runat="server">

        <ItemTemplate>

            <div class="col-xl-4 col-md-6 d-flex">

                <div class="card flex-fill">

                    <div class="card-body">

                        <!-- Task Header -->
                        <div class="d-flex align-items-center justify-content-between mb-3">

                            <div>
                                <span class="badge bg-light text-dark">
                                    Task #<%# Eval("TaskId") %>
                                </span>
                            </div>

                            <span class="badge bg-primary">
                                <%# Eval("Priority") %>
                            </span>

                        </div>


                        <!-- Project -->
                        <h5 class="mb-2">
                            <%# Eval("ProjectName") %>
                        </h5>


                        <!-- Task Title -->
                        <h6 class="mb-3 text-dark">
                            <%# Eval("Title") %>
                        </h6>


                        <!-- Members -->
                        <div class="mb-3">

                            <span class="text-muted d-block mb-1">
                                Members
                            </span>

                            <span class="text-dark">
                                <%# Eval("Members") %>
                            </span>

                        </div>


                        <!-- Deadline -->
                        <div class="mb-3">

                            <span class="text-muted d-block mb-1">
                                Deadline
                            </span>

                            <span class="text-dark">
                                <%# Eval("Deadline") %>
                            </span>

                        </div>


                        <!-- Bottom -->
                        <div class="d-flex align-items-center justify-content-between pt-3 border-top">

                            <div>

                                <span class="text-muted d-block mb-1">
                                    Status
                                </span>

                                <span class="badge bg-success">
                                    <%# Eval("Status") %>
                                </span>

                            </div>

                            <div>
                                <i class="ti ti-chevron-right"></i>
                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </ItemTemplate>

    </asp:Repeater>

</div>

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

                <!-- /TASK CONTENT -->


            </div>

        </div>

    </form>


    <!-- jQuery -->
    <script src="../assets/js/jquery-3.7.1.min.js"></script>

    <!-- Bootstrap Core JS -->
    <script src="../assets/js/bootstrap.bundle.min.js"></script>

    <!-- Feather Icon JS -->
    <script src="../assets/js/feather.min.js"></script>

    <!-- Slimscroll JS -->
    <script src="../assets/js/jquery.slimscroll.min.js"></script>

    <!-- Color Picker JS -->
    <script src="../assets/plugins/@simonwep/pickr/pickr.es5.min.js"></script>

    <!-- Datatable JS -->
    <script src="../assets/js/jquery.dataTables.min.js"></script>
    <script src="../assets/js/dataTables.bootstrap5.min.js"></script>

    <!-- Daterangepicker JS -->
    <script src="../assets/js/moment.js"></script>
    <script src="../assets/plugins/daterangepicker/daterangepicker.js"></script>
    <script src="../assets/js/bootstrap-datetimepicker.min.js"></script>

    <!-- Select2 JS -->
    <script src="../assets/plugins/select2/js/select2.min.js"></script>

    <!-- Summernote JS -->
    <script src="../assets/plugins/summernote/summernote-lite.min.js"></script>

    <!-- Bootstrap Tagsinput JS -->
    <script src="../assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>

    <!-- Custom JS -->
    <script src="../assets/js/todo.js"></script>
    <script src="../assets/js/theme-colorpicker.js"></script>
    <script src="../assets/js/script.js"></script>

</body>

</html>