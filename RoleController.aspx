<%@ Page Title="Roles"
    Language="C#"
    MasterPageFile="~/Admin.Master"
    AutoEventWireup="true"
    CodeBehind="RoleController.aspx.cs"
    Inherits="ProjectDemo.RoleController" %>

<asp:Content
    ID="Content1"
    ContentPlaceHolderID="head"
    runat="server">
</asp:Content>

<asp:Content
    ID="Content2"
    ContentPlaceHolderID="Body"
    runat="server">

    <asp:ScriptManager ID="ScriptManager1" runat="server" />

    <asp:HiddenField ID="HiddenField1" runat="server" />

    <!-- PAGE BREADCRUMB -->

    <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">

        <div class="my-auto mb-2">

            <h2 class="mb-1">Roles</h2>

            <nav>
                <ol class="breadcrumb mb-0">

                    <li class="breadcrumb-item">
                        <a href="<%= ResolveUrl("~/AdminDashboard.aspx") %>">
                            <i class="ti ti-smart-home"></i>
                        </a>
                    </li>

                    <li class="breadcrumb-item">
                        Administration
                    </li>

                    <li class="breadcrumb-item active">
                        Roles
                    </li>

                </ol>
            </nav>

        </div>

        <div class="d-flex my-xl-auto right-content align-items-center flex-wrap">

            <!-- EXPORT -->

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

            <!-- ADD ROLE BUTTON -->

            <div class="mb-2">

                <a href="javascript:void(0);"
                   data-bs-toggle="modal"
                   data-bs-target="#add_role"
                   class="btn btn-primary d-flex align-items-center">

                    <i class="ti ti-circle-plus me-2"></i>
                    Add Roles

                </a>

            </div>

        </div>

    </div>


    <!-- ROLE LIST -->

    <div class="card">

        <div class="card-header d-flex align-items-center justify-content-between">

            <h5>Roles List</h5>

        </div>

        <div class="card-body p-0">

            <div class="table-responsive">

                <asp:GridView
                    ID="GridView1"
                    runat="server"
                    AutoGenerateColumns="False"
                    CssClass="table"
                    GridLines="None"
                    OnRowCommand="GridView1_RowCommand"
                    EmptyDataText="No roles found.">

                    <Columns>

                        <%-- ROLE ID --%>

                        <asp:TemplateField HeaderText="Role ID">

                            <ItemTemplate>

                                <%# Eval("RoleId") %>

                            </ItemTemplate>

                        </asp:TemplateField>


                       <%--  ROLE --%>

                        <asp:TemplateField HeaderText="Role">

                            <ItemTemplate>

                                <h6 class="fw-medium mb-0">
                                    <%# Eval("RoleName") %>
                                </h6>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <%-- CREATED BY --%>

                        <asp:TemplateField HeaderText="Created By">

                            <ItemTemplate>

                                <%# Eval("CreatedBy") %>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <%-- MODIFIED BY --%>

                        <asp:TemplateField HeaderText="Modified By">

                            <ItemTemplate>

                                <%# Eval("ModifiedBy") %>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <%-- STATUS --%>

                        <asp:TemplateField HeaderText="Status">

                            <ItemTemplate>

                                <span class='<%# Eval("Status").ToString() == "Active"
                                    ? "badge badge-success d-inline-flex align-items-center badge-xs"
                                    : "badge badge-danger d-inline-flex align-items-center badge-xs" %>'>

                                    <i class="ti ti-point-filled me-1"></i>

                                    <%# Eval("Status") %>

                                </span>

                            </ItemTemplate>

                        </asp:TemplateField>


                        <%-- ACTIONS --%>

                        <asp:TemplateField HeaderText="">

                            <ItemTemplate>

                                <div class="action-icon d-inline-flex">

                                    <%-- PERMISSION --%>

                                    <a href="permission.html"
                                       class="me-2"
                                       title="Permission">

                                        <i class="ti ti-shield"></i>

                                    </a>


                                     <%--EDIT--%> 

                                    <asp:LinkButton
                                        ID="ButtonEdit"
                                        runat="server"
                                        CommandName="Upd"
                                        CommandArgument='<%# Eval("RoleId") %>'
                                        CssClass="me-2"
                                        ToolTip="Edit">

                                        <i class="ti ti-edit"></i>

                                    </asp:LinkButton>


                                     <%--DELETE--%> 

                                    <asp:LinkButton
                                        ID="ButtonDelete"
                                        runat="server"
                                        CommandName="Del"
                                        CommandArgument='<%# Eval("RoleId") %>'
                                        ToolTip="Delete"
                                        OnClientClick="return confirm('Are you sure you want to delete this role?');">

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


    <!-- ========================= -->
    <!-- ADD ROLE MODAL -->
    <!-- ========================= -->

    <div class="modal fade"
         id="add_role"
         tabindex="-1"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">
                        Add Role
                    </h4>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                    </button>

                </div>


                <div class="modal-body">

                    <!-- ROLE NAME -->

                    <div class="mb-3">

                        <label class="form-label">
                            Role Name
                        </label>

                        <asp:TextBox
                            ID="TextBox1"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter role name">
                        </asp:TextBox>

                    </div>


                    <!-- STATUS -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>

                        <asp:DropDownList
                            ID="DropDownList1"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem
                                Text="Select"
                                Value="" />

                            <asp:ListItem
                                Text="Active"
                                Value="Active" />

                            <asp:ListItem
                                Text="Inactive"
                                Value="Inactive" />

                        </asp:DropDownList>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <asp:Button
                        ID="Button1"
                        runat="server"
                        Text="Add Role"
                        CssClass="btn btn-primary"
                        OnClick="Button1_Click" />

                </div>

            </div>

        </div>

    </div>


    <!-- ========================= -->
    <!-- EDIT ROLE MODAL -->
    <!-- ========================= -->

    <div class="modal fade"
         id="edit_role"
         tabindex="-1"
         aria-hidden="true">

        <div class="modal-dialog modal-dialog-centered">

            <div class="modal-content">

                <div class="modal-header">

                    <h4 class="modal-title">
                        Edit Role
                    </h4>

                    <button type="button"
                            class="btn-close"
                            data-bs-dismiss="modal"
                            aria-label="Close">
                    </button>

                </div>


                <div class="modal-body">

                    <!-- ROLE NAME -->

                    <div class="mb-3">

                        <label class="form-label">
                            Role Name
                        </label>

                        <asp:TextBox
                            ID="TextBoxEdit"
                            runat="server"
                            CssClass="form-control"
                            placeholder="Enter role name">
                        </asp:TextBox>

                    </div>


                    <!-- STATUS -->

                    <div class="mb-3">

                        <label class="form-label">
                            Status
                        </label>

                        <asp:DropDownList
                            ID="DropDownListEdit"
                            runat="server"
                            CssClass="form-control">

                            <asp:ListItem
                                Text="Select"
                                Value="" />

                            <asp:ListItem
                                Text="Active"
                                Value="Active" />

                            <asp:ListItem
                                Text="Inactive"
                                Value="Inactive" />

                        </asp:DropDownList>

                    </div>

                </div>


                <div class="modal-footer">

                    <button type="button"
                            class="btn btn-light"
                            data-bs-dismiss="modal">

                        Cancel

                    </button>

                    <asp:Button
                        ID="Button3"
                        runat="server"
                        Text="Update Role"
                        CssClass="btn btn-primary"
                        OnClick="Button3_Click" />

                </div>

            </div>

        </div>

    </div>


    <!-- FOOTER -->

    <div class="footer d-sm-flex align-items-center justify-content-between border-top bg-white p-3">

        <p class="mb-0">
            2014 - 2025 &copy; SmartHR.
        </p>

        <p class="mb-0">

            Designed &amp; Developed By

            <a href="javascript:void(0);"
               class="text-primary">

                Dreams

            </a>

        </p>

    </div>

</asp:Content>
