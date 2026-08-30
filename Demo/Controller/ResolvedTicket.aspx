<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResolvedTicket.aspx.cs" Inherits="Demo.Controller.ResolvedTicket" %>

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
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">My Assigned Tickets</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                            <li class="breadcrumb-item">Help &amp; Support</li>
                            <li class="breadcrumb-item active" aria-current="page">My Assigned Tickets</li>
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
                            <h5 class="d-flex align-items-center">Assigned Tickets</h5>
                            <div class="d-flex align-items-center flex-wrap row-gap-3">
                                <div class="me-2">
                                    <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="form-select"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
                                        <asp:ListItem Text="Sort By: Newest First" Value="desc"></asp:ListItem>
                                        <asp:ListItem Text="Sort By: Oldest First" Value="asc"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                                <div>
                                    <asp:DropDownList ID="ddlFilterByStatus" runat="server" CssClass="form-select"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlFilterByStatus_SelectedIndexChanged">
                                        <asp:ListItem Text="Filter By Status: All" Value="all"></asp:ListItem>
                                        <asp:ListItem Text="Pending" Value="pending"></asp:ListItem>
                                        <asp:ListItem Text="Resolved" Value="Resolved"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="custom-datatable-filter table-responsive">
                                <asp:GridView ID="gvMyTickets" runat="server" AutoGenerateColumns="False"
                                    OnRowCommand="gvMyTickets_RowCommand"
                                    ShowHeaderWhenEmpty="True" EmptyDataText="No tickets assigned to you yet"
                                    CssClass="table datatable"
                                    HeaderStyle-CssClass="thead-light"
                                    GridLines="None" CellSpacing="0" Border="0">
                                    <Columns>
                                        <asp:BoundField DataField="TicketId" HeaderText="Tid" />
                                        <asp:BoundField DataField="TicketTitle" HeaderText="Ticket Title" />
                                        <asp:BoundField DataField="TicketDetail" HeaderText="Description" />
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
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                                    <%# Eval("Status") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Action">
                                                    <itemtemplate>
                                                        <asp:LinkButton ID="lnkClose" runat="server"
                                                            CssClass="btn btn-primary btn-sm"
                                                            Text="Resolve"
                                                            CommandName="CloseItem"
                                                            CommandArgument='<%# Eval("TicketId") %>'
                                                            Visible='<%# Eval("Status").ToString() != "Resolved" %>'>
                                                        </asp:LinkButton>
                                                        <asp:Label ID="lblClosed" runat="server" Text="Closed"
                                                            Visible='<%# Eval("Status").ToString() == "Resolved" %>'></asp:Label>
                                                    </itemtemplate>
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

    <!-- Resolve Ticket Modal -->
    <div class="modal fade" id="resolve_ticket">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        Resolve Ticket #<asp:Literal ID="litTicketId" runat="server"></asp:Literal>
                    </h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Solution</label>
                                <asp:TextBox ID="txtSolution" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Attachment</label>
                                <asp:FileUpload ID="fileSolution" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <asp:HiddenField ID="hdnResolveTicketId" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <asp:Button ID="btnCancel" runat="server" CssClass="btn btn-white border me-2" Text="Cancel" OnClick="btnCancel_Click" CausesValidation="false" />
                    <asp:Button ID="btnDone" runat="server" CssClass="btn btn-primary" Text="Done" OnClick="btnDone_Click" />
                </div>
            </div>
        </div>
    </div>
    <!-- /Resolve Ticket Modal -->

    </form>

    <script src="<%= ResolveUrl("~/assets/js/jquery-3.7.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap.bundle.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/jquery.dataTables.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/dataTables.bootstrap5.min.js") %>"></script>

    <script>

$(document).ready(function() {

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