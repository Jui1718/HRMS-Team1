<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TicketRaise.aspx.cs" Inherits="Demo.Controller.TicketRaise" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/assets/css/bootstrap.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/plugins/tabler-icons/tabler-icons.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/dataTables.bootstrap5.min.css" runat="server">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="~/assets/css/style.css" runat="server">
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Tickets</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                            <li class="breadcrumb-item">Tickets</li>
                            <li class="breadcrumb-item active" aria-current="page"> Raise Tickets</li>
                        </ol>
                    </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                    <div class="mb-2">
                        <asp:LinkButton ID="btnAddTicket" runat="server" CssClass="btn btn-primary d-flex align-items-center"
                            OnClick="btnAddTicket_Click">
                            <i class="ti ti-circle-plus me-2"></i>Raise Ticket
                        </asp:LinkButton>
                    </div>
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
                                <asp:GridView ID="gvTicket" runat="server" AutoGenerateColumns="False" OnRowCommand="gvTicket_RowCommand"
                                    CssClass="table datatable"
                                    HeaderStyle-CssClass="thead-light"
                                    GridLines="None" CellSpacing="0" Border="0">
                                    <Columns>
                                        <asp:BoundField DataField="TicketId" HeaderText="Tid" />
                                        <asp:BoundField DataField="TicketTitle" HeaderText="Ticket" />
                                        <asp:BoundField DataField="TicketDetail" HeaderText="Ticket Detail" />
                                        <asp:BoundField DataField="RaisedByName" HeaderText="Raised By" />
                                        <asp:BoundField DataField="CreatedAt" HeaderText="Created At" />
                                        <asp:BoundField DataField="RaisedByName" HeaderText="Raised By" />
                                        <asp:BoundField DataField="CreatedAt" HeaderText="Created At" />
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                                    <%# Eval("Status") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="File">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="lnkDownload" runat="server"
                                                    CommandName="DownloadItem"
                                                    CommandArgument='<%# Eval("TicketId") %>'
                                                    Text='<%# string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "No file" : "Download" %>'
                                                    Enabled='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) %>'>
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <div class="action-icon d-inline-flex align-items-center">
                                                    <asp:HyperLink ID="lnkView" runat="server" CssClass="me-2"
                                                        NavigateUrl='<%# string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "" : "~/Uploads/TicketAttachments/" + Eval("FilePath") %>'
                                                        Enabled='<%# !string.IsNullOrEmpty(Eval("FilePath").ToString()) %>'
                                                        Target="_blank"
                                                        ToolTip='<%# string.IsNullOrEmpty(Eval("FilePath").ToString()) ? "No file" : "View" %>'>
                                                        <i class="bi bi-eye-fill"></i>
                                                    </asp:HyperLink>
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="me-2"
                                                        CommandName="EditItem" CommandArgument='<%# Eval("TicketId") %>'>
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDelete" runat="server"
                                                        CommandName="DeleteItem" CommandArgument='<%# Eval("TicketId") %>'
                                                        OnClientClick="return confirm('Are you sure you want to delete this ticket?');">
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
            <!-- /Ticket List -->

        </div>
    </div>

    <!-- Add / Edit Ticket Modal -->
    <div class="modal fade" id="new_ticket">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        <asp:Literal ID="LitModalTitle" runat="server" Text="Raise Ticket"></asp:Literal>
                    </h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Ticket Title</label>
                                <asp:TextBox ID="txtTicket" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Ticket Detail</label>
                                <asp:TextBox ID="txtTicketDetail" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Attachment</label>
                                <asp:FileUpload ID="fileAttach" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <asp:HiddenField ID="hdnTicketId" runat="server" Value="0" />
                        <asp:HiddenField ID="hdnExistingFile" runat="server" />
                        <asp:HiddenField ID="hdnExistingOriginalName" runat="server" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click" Text="Add" />
                </div>
            </div>
        </div>
    </div>
    <!-- /Add / Edit Ticket Modal -->

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