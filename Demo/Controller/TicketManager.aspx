<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketManager.aspx.cs" Inherits="Demo.Controller.TicketManager" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/assets/css/bootstrap.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/plugins/tabler-icons/tabler-icons.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/dataTables.bootstrap5.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/style.css" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Manage Tickets</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                            <li class="breadcrumb-item">Help &amp; Support</li>
                            <li class="breadcrumb-item active" aria-current="page">Manage Tickets</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Ticket List -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                            <h5 class="d-flex align-items-center">Ticket List</h5>
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
                                <asp:GridView ID="gvTicket" runat="server" AutoGenerateColumns="False"
                                    OnRowCommand="gvTicket_RowCommand" OnRowDataBound="gvTicket_RowDataBound"
                                    CssClass="table datatable"
                                    HeaderStyle-CssClass="thead-light"
                                    GridLines="None" CellSpacing="0" Border="0">
                                    <Columns>
                                        <asp:BoundField DataField="TicketId" HeaderText="Tid" />
                                        <asp:BoundField DataField="TicketTitle" HeaderText="Title" />
                                        <asp:BoundField DataField="TicketDetail" HeaderText="Description" />
                                        <asp:BoundField DataField="RaisedByName" HeaderText="Raised By" />
                                        <asp:BoundField DataField="AssignedToName" HeaderText="Raised To" />
                                        <asp:TemplateField HeaderText="File">
                                            <ItemTemplate>
                                                <asp:HyperLink ID="lnkView" runat="server"
                                                    NavigateUrl='<%# string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "" : "~/Uploads/TicketAttachments/" + Eval("FilePath") %>'
                                                    Enabled='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) %>'
                                                    Target="_blank"
                                                    ToolTip='<%# string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "No file" : "View" %>'>
                                                    <i class="bi bi-eye-fill"></i>
                                                </asp:HyperLink>
                                                &nbsp;
                                                <asp:LinkButton ID="lnkDownload" runat="server"
                                                    CommandName="DownloadItem"
                                                    CommandArgument='<%# Eval("TicketId") %>'
                                                    Text='<%# string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "No file" : "Download" %>'
                                                    Enabled='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) %>'>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="CreatedAt" HeaderText="Created At" />
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                                    <%# Eval("Status") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <div class="d-flex align-items-center gap-2">
                                                    <asp:DropDownList ID="ddlAssignTo" runat="server" CssClass="form-select form-select-sm"></asp:DropDownList>
                                                    <asp:Button ID="btnAssign" runat="server" CssClass="btn btn-primary btn-sm"
                                                        Text="Assign" CommandName="AssignItem" CommandArgument='<%# Eval("TicketId") %>' />
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
            <!-- /Ticket List -->

        </div>
    </div>
    </form>

    <script src="<%= ResolveUrl("~/assets/js/jquery-3.7.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap.bundle.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/dataTables.bootstrap5.min.js") %>"></script>

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

        });

        $.fn.dataTable.ext.errMode = 'none';
    </script>
</body>
</html>