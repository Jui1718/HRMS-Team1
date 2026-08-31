<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminTimesheet.aspx.cs" Inherits="ProjectDemo.AdminTimesheet" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Timesheet Management - Pulse360</title>

    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet" />

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Bootstrap Icons & Tabler Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@tabler/icons-webfont@latest/tabler-icons.min.css" />

    <style>
        body {
            font-family: 'Inter', -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background-color: #f8f9fa;
            color: #333;
        }
        .page-header {
            padding: 1.5rem 0 1rem;
        }
        .page-title {
            font-size: 1.5rem;
            font-weight: 700;
            color: #1f2937;
        }
        .card {
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.05);
            background-color: #ffffff;
        }
        .card-header {
            background-color: #ffffff;
            border-bottom: 1px solid #f3f4f6;
            padding: 1rem 1.25rem;
        }
        .card-header h5 {
            font-size: 1.1rem;
            font-weight: 600;
            margin: 0;
            color: #111827;
        }
        .btn-success {
            background-color: #10b981;
            border-color: #10b981;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
        }
        .btn-success:hover {
            background-color: #059669;
            border-color: #059669;
        }
        .btn-danger {
            background-color: #ef4444;
            border-color: #ef4444;
            font-weight: 500;
            padding: 0.5rem 1rem;
            border-radius: 0.5rem;
        }
        .btn-danger:hover {
            background-color: #dc2626;
            border-color: #dc2626;
        }
        .btn-white {
            background-color: #ffffff;
            border: 1px solid #e5e7eb;
            color: #374151;
            font-weight: 500;
            border-radius: 0.5rem;
        }
        .btn-white:hover {
            background-color: #f9fafb;
            color: #111827;
        }
        .form-control, .form-select {
            border-radius: 0.5rem;
            border: 1px solid #d1d5db;
            padding: 0.45rem 0.85rem;
            font-size: 0.875rem;
        }
        .form-control:focus, .form-select:focus {
            border-color: #f97316;
            box-shadow: 0 0 0 0.2rem rgba(249, 115, 22, 0.15);
        }
        .table {
            margin-bottom: 0;
        }
        .table thead th {
            background-color: #f9fafb;
            color: #4b5563;
            font-size: 0.8125rem;
            font-weight: 600;
            text-transform: uppercase;
            letter-spacing: 0.025em;
            padding: 0.875rem 1rem;
            border-bottom: 1px solid #e5e7eb;
        }
        .table tbody td {
            padding: 0.875rem 1rem;
            vertical-align: middle;
            font-size: 0.875rem;
            color: #374151;
            border-bottom: 1px solid #f3f4f6;
        }
        .badge {
            padding: 0.35rem 0.65rem;
            font-weight: 500;
            border-radius: 0.375rem;
            font-size: 0.75rem;
        }
        .badge-approved {
            background-color: #10b981;
            color: #ffffff;
        }
        .badge-rejected {
            background-color: #ef4444;
            color: #ffffff;
        }
        .badge-pending {
            background-color: #f59e0b;
            color: #ffffff;
        }
        .avatar {
            width: 36px;
            height: 36px;
            border-radius: 50%;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            background-color: #e0e7ff;
            color: #4338ca;
            font-weight: 600;
            font-size: 0.875rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid px-4 py-3">

            <!-- Page Header -->
            <div class="d-md-flex align-items-center justify-content-between page-header mb-3">
                <div>
                    <h2 class="page-title mb-0">Admin Timesheet Management</h2>
                </div>
                <div class="d-flex align-items-center gap-2 mt-2 mt-md-0">
                    <div class="dropdown">
                        <button class="btn btn-white dropdown-toggle d-inline-flex align-items-center" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                            <i class="ti ti-file-export me-1"></i> Export
                        </button>
                        <ul class="dropdown-menu dropdown-menu-end shadow-sm">
                            <li><a class="dropdown-item" href="javascript:window.print();"><i class="ti ti-file-type-pdf me-2 text-danger"></i>Export as PDF</a></li>
                            <li><a class="dropdown-item" href="javascript:void(0);"><i class="ti ti-file-type-xls me-2 text-success"></i>Export as Excel</a></li>
                        </ul>
                    </div>
                </div>
            </div>

            <!-- Action Buttons (Approve & Reject) -->
            <div class="d-flex align-items-center gap-2 mb-3">
                <asp:Button ID="ButtonApprove" runat="server" Text="Approve Selected" CssClass="btn btn-success" OnClick="ButtonApprove_Click" />
                <asp:Button ID="ButtonReject" runat="server" Text="Reject Selected" CssClass="btn btn-danger" OnClick="ButtonReject_Click" />
            </div>

            <!-- Timesheet Card -->
            <div class="card">
                <!-- Card Header with Filters -->
                <div class="card-header d-flex flex-wrap align-items-center justify-content-between gap-3">
                    <h5 class="mb-0">Timesheet</h5>

                    <div class="d-flex flex-wrap align-items-center gap-2">
                        <!-- Project Search -->
                        <asp:TextBox ID="TextBoxSearch" runat="server" 
                            CssClass="form-control" 
                            style="width: 220px;" 
                            placeholder="Search by Project Name" 
                            AutoPostBack="true" 
                            OnTextChanged="TextBoxSearch_TextChanged">
                        </asp:TextBox>

                        <!-- Status Filter -->
                        <asp:DropDownList ID="DropDownListStatus" runat="server" 
                            CssClass="form-select" 
                            style="width: 160px;" 
                            AutoPostBack="true" 
                            OnSelectedIndexChanged="DropDownListStatus_SelectedIndexChanged">
                            <asp:ListItem Value="">All Status</asp:ListItem>
                            <asp:ListItem Value="Pending Approval">Pending Approval</asp:ListItem>
                            <asp:ListItem Value="Approved">Approved</asp:ListItem>
                            <asp:ListItem Value="Rejected">Rejected</asp:ListItem>
                        </asp:DropDownList>

                        <!-- Project Dropdown -->
                        <asp:DropDownList ID="DropDownListProject" runat="server" 
                            CssClass="form-select" 
                            style="width: 160px;" 
                            AutoPostBack="true" 
                            OnSelectedIndexChanged="DropDownListProject_SelectedIndexChanged">
                            <asp:ListItem Value="">Projects</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>

                <!-- Card Body with GridView -->
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <asp:GridView ID="GridView1" runat="server" 
                            AutoGenerateColumns="False" 
                            CssClass="table table-hover align-middle mb-0" 
                            GridLines="None">
                            <Columns>
                                <%-- Select Checkbox --%>
                                <asp:TemplateField ItemStyle-Width="40px" HeaderStyle-Width="40px" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                                    <HeaderTemplate>
                                        <input type="checkbox" id="chkSelectAll" class="form-check-input" onclick="toggleSelectAll(this);" />
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <asp:HiddenField ID="HiddenFieldId" runat="server" Value='<%# Eval("TimesheetId") %>' />
                                        <asp:CheckBox ID="CheckBoxSelect" runat="server" CssClass="form-check-input row-checkbox" />
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- Employee --%>
                                <asp:TemplateField HeaderText="Employee">
                                    <ItemTemplate>
                                        <div class="d-flex align-items-center">
                                            <div class="avatar me-2">
                                                <i class="bi bi-person-fill"></i>
                                            </div>
                                            <div>
                                                <span class="fw-medium text-dark"><%# Eval("EmployeeName") %></span>
                                            </div>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- Created At --%>
                                <asp:TemplateField HeaderText="Created At">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelDate" runat="server" Text='<%# Eval("CreatedAt", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- Project --%>
                                <asp:TemplateField HeaderText="Project">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelProject" runat="server" Text='<%# Eval("ProjectName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- Worked Hours --%>
                                <asp:TemplateField HeaderText="Worked Hours">
                                    <ItemTemplate>
                                        <asp:Label ID="LabelHours" runat="server" Text='<%# Eval("WorkHours") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <%-- Status (Badges) --%>
                                <asp:TemplateField HeaderText="Status">
                                    <ItemTemplate>
                                        <span class='badge <%# 
                                            Eval("Status") != null && Eval("Status").ToString() == "Approved" ? "badge-approved" : 
                                            Eval("Status") != null && Eval("Status").ToString() == "Rejected" ? "badge-rejected" : "badge-pending" 
                                        %>'>
                                            <%# Eval("Status") %>
                                        </span>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="text-center py-4 text-muted">
                                    <i class="bi bi-inbox fs-2 d-block mb-1"></i>
                                    No timesheet records found.
                                </div>
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </div>
                </div>
            </div>

        </div>
    </form>

    <!-- Bootstrap 5 Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- Select All Checkboxes Script -->
    <script>
        function toggleSelectAll(source) {
            var checkboxes = document.querySelectorAll('.row-checkbox input[type="checkbox"]');
            for (var i = 0; i < checkboxes.length; i++) {
                checkboxes[i].checked = source.checked;
            }
        }
    </script>
</body>
</html>
