<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Resignation.aspx.cs" Inherits="Demo.Controller.Resignation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/assets/css/bootstrap.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/plugins/tabler-icons/tabler-icons.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/dataTables.bootstrap5.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/bootstrap-datetimepicker.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/style.css" runat="server">
</head>
<body>
    <form id="form1" runat="server">
        <div class="page-wrapper">
            <div class="content">

                <!-- Breadcrumb -->
                <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                    <div class="my-auto mb-2">
                        <h2 class="mb-1">Resignation</h2>
                        <nav>
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                                <li class="breadcrumb-item">Performance</li>
                                <li class="breadcrumb-item active" aria-current="page">Resignation</li>
                            </ol>
                        </nav>
                    </div>
                    <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                        <div class="mb-2">
                            <asp:LinkButton ID="btnAddResignation" runat="server" CssClass="btn btn-primary d-flex align-items-center"
                                OnClick="btnAddResignation_Click">
                                <i class="ti ti-circle-plus me-2"></i>Add Resignation
                            </asp:LinkButton>
                        </div>
                    </div>
                </div>
                <!-- /Breadcrumb -->

                <!-- Resignation List -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="card">
                            <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                                <h5 class="d-flex align-items-center">Resignation List</h5>
                                <div class="d-flex align-items-center flex-wrap row-gap-3">
                                    <div class="me-2">
                                        <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="form-select"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
                                            <asp:ListItem Text="Sort By: Ascending" Value="asc"></asp:ListItem>
                                            <asp:ListItem Text="Sort By: Descending" Value="desc"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div>
                                        <asp:DropDownList ID="ddlFilterByDate" runat="server" CssClass="form-select"
                                            AutoPostBack="true" OnSelectedIndexChanged="ddlFilterByDate_SelectedIndexChanged">
                                            <asp:ListItem Text="Filter By Date: All Records" Value="all"></asp:ListItem>
                                            <asp:ListItem Text="Today" Value="today"></asp:ListItem>
                                            <asp:ListItem Text="Last 7 Days" Value="last7days"></asp:ListItem>
                                            <asp:ListItem Text="Last Month" Value="lastmonth"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>
                            <div class="card-body p-0">
                                <div class="custom-datatable-filter table-responsive">
                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                                        CssClass="table datatable"
                                        HeaderStyle-CssClass="thead-light"
                                        GridLines="None" CellSpacing="0" Border="0">
                                        <Columns>
                                            <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />
                                            <asp:BoundField DataField="DepartmentName" HeaderText="Department" />
                                            <asp:BoundField DataField="NoticeDate" HeaderText="Notice Date" />
                                            <asp:BoundField DataField="ResignDate" HeaderText="Resign Date" />
                                            <asp:BoundField DataField="Reason" HeaderText="Reason" />
                                            <asp:TemplateField HeaderText="Action">
                                                <ItemTemplate>
                                                    <div class="action-icon d-inline-flex">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="me-2" Text="Edit"
                                                            CommandName="EditRow" CommandArgument='<%# Eval("ResignationId") %>'>
                                                            <i class="ti ti-edit"></i>
                                                        </asp:LinkButton>
                                                        <asp:LinkButton ID="LinkButton2" runat="server" Text="Delete"
                                                            CommandName="DeleteRow" CommandArgument='<%# Eval("ResignationId") %>'
                                                            OnClientClick="return confirm('Are you sure you want to delete this resignation?');">
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
                </div>
                <!-- /Resignation List -->

            </div>

            <!-- Footer -->
            <div class="footer d-sm-flex align-items-center justify-content-between bg-white border-top p-3">
                <p class="mb-0">2014 - 2025 &copy; SmartHR.</p>
                <p>Designed &amp; Developed By <a href="#" class="text-primary">Dreams</a></p>
            </div>
            <!-- /Footer -->
        </div>

        <!-- Add / Edit Resignation Modal -->
        <div class="modal fade" id="new_resignation">
            <div class="modal-dialog modal-dialog-centered modal-md">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">
                            <asp:Literal ID="LitModalTitle" runat="server" Text="Add Resignation"></asp:Literal>
                        </h4>
                        <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                            <i class="ti ti-x"></i>
                        </button>
                    </div>
                    <div class="modal-body pb-0">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Employee</label>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Department</label>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-select"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Notice Date</label>
                                    <div class="input-icon-end position-relative">
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control datetimepicker" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        <span class="input-icon-addon">
                                            <i class="ti ti-calendar text-gray-7"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Resign Date</label>
                                    <div class="input-icon-end position-relative">
                                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control datetimepicker" placeholder="dd/mm/yyyy"></asp:TextBox>
                                        <span class="input-icon-addon">
                                            <i class="ti ti-calendar text-gray-7"></i>
                                        </span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12">
                                <div class="mb-3">
                                    <label class="form-label">Reason</label>
                                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                                </div>
                            </div>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">Cancel</button>
                        <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Add" />
                    </div>
                </div>
            </div>
        </div>
        <!-- /Add / Edit Resignation Modal -->

    </form>

    <script src="<%= ResolveUrl("~/assets/js/jquery-3.7.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap.bundle.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/dataTables.bootstrap5.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/plugins/moment/moment.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap-datetimepicker.min.js") %>"></script>

    <script>

        $(document).ready(function () {

            if ($.fn.DataTable.isDataTable('.datatable')) {
                $('.datatable').DataTable().destroy();
            }

            $('.datatable').DataTable({
                "info": false,
                "searching": true,
                "ordering": true,
                "order": [],
                "paging": true,
                "pageLength": 10,
                "lengthChange": false
            });

            $('.datetimepicker').datetimepicker({
                format: 'DD/MM/YYYY',
                showClose: true,
                showClear: true,
                showTodayButton: true
            });

        });

        $.fn.dataTable.ext.errMode = 'none';
    </script>
</body>
</html>