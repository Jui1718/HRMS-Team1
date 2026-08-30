<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TrainingType.aspx.cs" Inherits="Demo.Controller.TrainingTypePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="~/assets/css/bootstrap.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/plugins/tabler-icons/tabler-icons.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/dataTables.bootstrap5.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/style.css" runat="server">
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Training Type</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                            <li class="breadcrumb-item">Performance</li>
                            <li class="breadcrumb-item active" aria-current="page">Training Type</li>
                        </ol>
                    </nav>
                </div>
                <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">
                    <div class="mb-2">
                        <asp:LinkButton ID="btnAddTrainingType" runat="server" CssClass="btn btn-primary d-flex align-items-center"
                            OnClick="btnAddTrainingType_Click">
                            <i class="ti ti-circle-plus me-2"></i>Add Training Type
                        </asp:LinkButton>
                    </div>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <!-- Training Type List -->
            <div class="row">
                <div class="col-sm-12">
                    <div class="card">
                        <div class="card-header d-flex align-items-center justify-content-between flex-wrap row-gap-3">
                            <h5 class="d-flex align-items-center">Training Type List</h5>
                            <div class="d-flex align-items-center flex-wrap row-gap-3">
                                <div class="me-2">
                                    <asp:DropDownList ID="ddlSortBy" runat="server" CssClass="form-select"
                                        AutoPostBack="true" OnSelectedIndexChanged="ddlSortBy_SelectedIndexChanged">
                                        <asp:ListItem Text="Sort By: Ascending" Value="asc"></asp:ListItem>
                                        <asp:ListItem Text="Sort By: Descending" Value="desc"></asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                        </div>
                        <div class="card-body p-0">
                            <div class="custom-datatable-filter table-responsive">
                                <asp:GridView ID="gvTrainingType" runat="server" AutoGenerateColumns="False" OnRowCommand="gvTrainingType_RowCommand"
                                    CssClass="table datatable"
                                    HeaderStyle-CssClass="thead-light"
                                    GridLines="None" CellSpacing="0" Border="0">
                                    <Columns>
                                        <asp:BoundField DataField="TrainingTypeName" HeaderText="Training Type Name" />
                                        <asp:BoundField DataField="Description" HeaderText="Description" />
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <span class='badge <%# GetStatusBadgeClass(Eval("Status").ToString()) %>'>
                                                    <%# Eval("Status") %>
                                                </span>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <div class="action-icon d-inline-flex">
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="me-2" Text="Edit"
                                                        CommandName="EditItem" CommandArgument='<%# Eval("TrainingTypeId") %>'>
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDelete" runat="server" Text="Delete"
                                                        CommandName="DeleteItem" CommandArgument='<%# Eval("TrainingTypeId") %>'
                                                        OnClientClick="return confirm('Are you sure you want to delete this training type?');">
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
            <!-- /Training Type List -->

        </div>
    </div>

    <!-- Add / Edit Training Type Modal -->
    <div class="modal fade" id="new_trainingtype">
        <div class="modal-dialog modal-dialog-centered modal-md">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">
                        <asp:Literal ID="LitModalTitle" runat="server" Text="Add Training Type"></asp:Literal>
                    </h4>
                    <button type="button" class="btn-close custom-btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <i class="ti ti-x"></i>
                    </button>
                </div>
                <div class="modal-body pb-0">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Training Type Name</label>
                                <asp:TextBox ID="txtTrainingTypeName" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Description</label>
                                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <div class="mb-3">
                                <label class="form-label">Status</label>
                                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select">
                                    <asp:ListItem Text="Active" Value="Active" />
                                    <asp:ListItem Text="Inactive" Value="Inactive" />
                                </asp:DropDownList>
                            </div>
                        </div>
                        <asp:HiddenField ID="hdnTrainingTypeId" runat="server" Value="0" />
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-white border me-2" data-bs-dismiss="modal">Cancel</button>
                    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click" Text="Add" />
                </div>
            </div>
        </div>
    </div>
    <!-- /Add / Edit Training Type Modal -->

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