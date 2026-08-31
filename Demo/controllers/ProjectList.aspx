<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectList.aspx.cs" Inherits="Demo.Controllers.ProjectList" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0">
<meta name="description" content="Smarthr - Bootstrap Admin Template">
<meta name="keywords" content="admin, estimates, bootstrap, business, html5, responsive, Projects">
<meta name="author" content="Dreams technologies - Bootstrap Admin Template">
<meta name="robots" content="noindex, nofollow">
<title>Project List</title>

    <style>
    /* ================================
       PROJECT GRIDVIEW - SAME TEMPLATE UI
       ================================ */

    /* GridView main table */
    .project-grid {
        width: 100% !important;
        margin-bottom: 0 !important;
        border-collapse: separate !important;
        border-spacing: 0 !important;
        color: #5b626b;
        font-size: 14px;
    }

    /* Header */
    .project-grid th {
        background-color: #f8f9fa !important;
        color: #5b626b !important;
        font-weight: 600 !important;
        font-size: 13px !important;
        padding: 12px 20px !important;
        border-bottom: 1px solid #e9ecef !important;
        border-top: 0 !important;
        text-align: left !important;
        white-space: nowrap;
    }

    /* Rows */
    .project-grid td {
        padding: 15px 20px !important;
        vertical-align: middle !important;
        border-bottom: 1px solid #e9ecef !important;
        border-top: 0 !important;
        background-color: #ffffff !important;
    }

    /* Hover */
    .project-grid tr:hover td {
        background-color: #fafafa !important;
    }

    /* Project ID */
    .project-grid .project-id {
        color: #0d6efd;
        font-weight: 500;
        text-decoration: none;
    }

    /* Project Name */
    .project-grid .project-name {
        font-weight: 500;
        color: #212529;
    }

    /* Team Members */
    .project-grid .team-members {
        color: #5b626b;
    }

    /* Deadline */
    .project-grid .deadline {
        color: #5b626b;
        white-space: nowrap;
    }

    /* Priority badge */
    .priority-badge {
        display: inline-flex;
        align-items: center;
        padding: 6px 10px;
        border: 1px solid #e5e7eb;
        border-radius: 4px;
        background: #fff;
        font-size: 13px;
        font-weight: 400;
        white-space: nowrap;
    }

    .priority-dot {
        width: 8px;
        height: 8px;
        border-radius: 50%;
        display: inline-block;
        margin-right: 7px;
    }

    .priority-high .priority-dot {
        background-color: #f04438;
    }

    .priority-medium .priority-dot {
        background-color: #f7b84b;
    }

    .priority-low .priority-dot {
        background-color: #22c55e;
    }

    /* Status */
    .status-badge {
        display: inline-flex;
        align-items: center;
        padding: 4px 9px;
        border-radius: 4px;
        font-size: 12px;
        font-weight: 500;
    }

    .status-dot {
        width: 6px;
        height: 6px;
        border-radius: 50%;
        margin-right: 5px;
    }

    .status-active {
        background-color: #e8f8ef;
        color: #16a34a;
    }

    .status-active .status-dot {
        background-color: #16a34a;
    }

    .status-inactive {
        background-color: #fdecec;
        color: #dc3545;
    }

    .status-inactive .status-dot {
        background-color: #dc3545;
    }

    /* Action buttons */
    .grid-action {
        display: inline-flex;
        align-items: center;
        gap: 8px;
    }

    .grid-action .edit-btn,
    .grid-action .delete-btn {
        border: 0 !important;
        background: transparent !important;
        padding: 4px !important;
        min-width: auto !important;
        font-size: 0 !important;
        cursor: pointer;
    }

    .grid-action .edit-btn::before {
        content: "\f4c7";
        font-family: "tabler-icons";
        font-size: 18px;
        color: #6c757d;
    }

    .grid-action .delete-btn::before {
        content: "\f5b4";
        font-family: "tabler-icons";
        font-size: 18px;
        color: #6c757d;
    }

    .grid-action .edit-btn:hover::before {
        color: #0d6efd;
    }

    .grid-action .delete-btn:hover::before {
        color: #dc3545;
    }

    /* Remove default GridView borders */
    .project-grid,
    .project-grid td,
    .project-grid th {
        border-left: 0 !important;
        border-right: 0 !important;
    }

    /* Responsive */
    .project-grid-wrapper {
        width: 100%;
        overflow-x: auto;
    }
</style>

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="../assets/img/favicon.png">

<!-- Apple Touch Icon -->
<link rel="apple-touch-icon" sizes="180x180" href="../assets/img/apple-touch-icon.png">

<!-- Theme Script js -->
<script src="../assets/js/theme-script.js"></script>

<!-- Bootstrap CSS -->
<link rel="stylesheet" href="../assets/css/bootstrap.min.css">

<!-- Feather CSS -->
<link rel="stylesheet" href="../assets/plugins/icons/feather/feather.css">

<!-- Tabler Icon CSS -->
<link rel="stylesheet" href="../assets/plugins/tabler-icons/tabler-icons.css">

<!-- Select2 CSS -->
<link rel="stylesheet" href="../assets/plugins/select2/css/select2.min.css">

<!-- Fontawesome CSS -->
<link rel="stylesheet" href="../assets/plugins/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="../assets/plugins/fontawesome/css/all.min.css">

 <!-- Color Picker Css -->
<link rel="stylesheet" href="assets/plugins/flatpickr/flatpickr.min.css">
<link rel="stylesheet" href="assets/plugins/@simonwep/pickr/themes/nano.min.css">

<!-- Daterangepikcer CSS -->
<link rel="stylesheet" href="../assets/plugins/daterangepicker/daterangepicker.css">

<!-- Datatable CSS -->
<link rel="stylesheet" href="../assets/css/dataTables.bootstrap5.min.css">

<!-- Datetimepicker CSS -->
<link rel="stylesheet" href="../assets/css/bootstrap-datetimepicker.min.css">

<!-- Summernote CSS -->
<link rel="stylesheet" href="../assets/plugins/summernote/summernote-lite.min.css">

<!-- Select2 CSS -->
<link rel="stylesheet" href="../assets/plugins/select2/css/select2.min.css">

<!-- Bootstrap Tagsinput CSS -->
<link rel="stylesheet" href="../assets/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css">

<!-- Main CSS -->
<link rel="stylesheet" href="../assets/css/style.css">
   
</head>

<body>
    <form id="form1" runat="server">
        	<div class="page-wrapper">
		<div class="content">
        <!-- Breadcrumb -->
<div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
				<div class="my-auto mb-2">
					<h2 class="mb-1">Projects</h2>
					<nav>
						<ol class="breadcrumb mb-0">
							<li class="breadcrumb-item">
								<a href="index.html"><i class="ti ti-smart-home"></i></a>
							</li>
							<li class="breadcrumb-item">
								Employee
							</li>
							<li class="breadcrumb-item active" aria-current="page">Projects List</li>
                            <li class="breadcrumb-item active" aria-current="page"></li>
						</ol>
					</nav>
				</div>
				<div class="d-flex my-xl-auto right-content align-items-center flex-wrap ">
					<div class="me-2 mb-2">
						<div class="d-flex align-items-center border bg-white rounded p-1 me-2 icon-list">
							<a href="projects.html" class="btn btn-icon btn-sm active bg-primary text-white me-1"><i class="ti ti-list-tree"></i></a>
							<a href="projects-grid.html" class="btn btn-icon btn-sm"><i class="ti ti-layout-grid"></i></a>
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
						<a href="#" data-bs-toggle="modal" data-bs-target="#add_project" class="btn btn-primary d-flex align-items-center"><i class="ti ti-circle-plus me-2"></i>Add Project</a>
					</div>
					<div class="ms-2 head-icons">
						<a href="javascript:void(0);" class="" data-bs-toggle="tooltip" data-bs-placement="top" data-bs-original-title="Collapse" id="collapse-header">
							<i class="ti ti-chevrons-up"></i>
						</a>
					</div>
				</div>
</div>
<!-- /Breadcrumb -->

        <div>

           <asp:Button ID="Button1" runat="server"
    Text="Add Project"
    OnClick="Button1_Click" />
            <br />
            <br />

            Search
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>

            <br />
            <br />

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="Project ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1"
                                runat="server"
                                Text='<%# Eval("ProjectId") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Project Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("ProjectName") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Team Members">
                        <ItemTemplate>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("TeamMembers") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Deadline">
                        <ItemTemplate>
                            <asp:Label ID="Label4"
                                runat="server"
                                Text='<%# Eval("Deadline") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Priority">
                        <ItemTemplate>
                            <asp:Label ID="Label5"
                                runat="server"
                                Text='<%# Eval("Priority") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="Label6"
                                runat="server"
                                Text='<%# Eval("Status") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>


                    <asp:TemplateField HeaderText="Action">
                        <ItemTemplate>

                            <asp:Button ID="Button2"
                                runat="server"
                                Text="Edit"
                                CommandName="EditProject"
                                CommandArgument='<%# Eval("ProjectId") %>' />

                            <asp:Button ID="Button3"
                                runat="server"
                                Text="Delete"
                                CommandName="DeleteProject"
                                CommandArgument='<%# Eval("ProjectId") %>'
                                OnClientClick="return confirm('Are you sure you want to delete this project?');" />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
            </div></div>
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

	<!-- Daterangepikcer JS -->
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
	<script src="../assets/js/theme-colorpicker.js"></script>
	<script src="../assets/js/script.js"></script>
</body>
</html>