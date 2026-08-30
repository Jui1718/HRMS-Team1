<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EventType.aspx.cs" Inherits="Demo.Controller.EventType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Event Types</title>
    <link rel="stylesheet" href="~/assets/css/bootstrap.min.css" runat="server">
    <link rel="stylesheet" href="~/assets/plugins/tabler-icons/tabler-icons.css" runat="server">
    <link rel="stylesheet" href="~/assets/css/style.css" runat="server">
</head>
<body>
    <form id="form1" runat="server">
    <div class="page-wrapper">
        <div class="content">

            <!-- Breadcrumb -->
            <div class="d-md-flex d-block align-items-center justify-content-between page-breadcrumb mb-3">
                <div class="my-auto mb-2">
                    <h2 class="mb-1">Holidays</h2>
                    <nav>
                        <ol class="breadcrumb mb-0">
                            <li class="breadcrumb-item"><a href="#"><i class="ti ti-smart-home"></i></a></li>
                            <li class="breadcrumb-item">Event</li>
                            <li class="breadcrumb-item active" aria-current="page">Holidays List</li>
                        </ol>
                    </nav>
                </div>
            </div>
            <!-- /Breadcrumb -->

            <div class="row">
                <!-- Add Event Type -->
                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            <h5>Add Event Type</h5>
                        </div>
                        <div class="card-body">
                            <div class="mb-3">
                                <label class="form-label">Event Type Name</label>
                                <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Color</label>
                                <br />
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="Color" CssClass="form-control form-control-color" style="width: 60px; height: 40px; padding: 4px;"></asp:TextBox>
                                <div class="form-text">Choose a color for this event type</div>
                            </div>
                            <asp:HiddenField ID="HiddenField1" runat="server" Value="0" />
                            <asp:Button ID="Button1" runat="server" CssClass="btn btn-primary" OnClick="Button1_Click" Text="Add Event Type" />
                        </div>
                    </div>
                </div>
                <!-- /Add Event Type -->

                <!-- Existing Event Types -->
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header">
                            <h5>Existing Event Types</h5>
                        </div>
                        <div class="card-body p-0">
                            <div class="table-responsive">
                                <asp:GridView ID="GvEventType" runat="server" AutoGenerateColumns="False"
                                    DataKeyNames="Id" OnRowCommand="GvEventType_RowCommand"
                                    CssClass="table"
                                    HeaderStyle-CssClass="thead-light"
                                    GridLines="None" CellSpacing="0" Border="0">
                                    <Columns>
                                        <asp:BoundField DataField="Name" HeaderText="Name" />
                                        <asp:BoundField DataField="Color" HeaderText="Color" />
                                        <asp:TemplateField HeaderText="Sample">
                                            <ItemTemplate>
                                                <div style='width: 24px; height: 24px; border-radius: 4px; background-color: <%# Eval("Color") %>;'></div>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                            <ItemTemplate>
                                                <div class="action-icon d-inline-flex">
                                                    <asp:LinkButton ID="lnkEdit" runat="server" CssClass="me-2"
                                                        CommandName="EditRow" CommandArgument='<%# Eval("Id") %>'>
                                                        <i class="ti ti-edit"></i>
                                                    </asp:LinkButton>
                                                    <asp:LinkButton ID="lnkDelete" runat="server"
                                                        CommandName="DeleteRow" CommandArgument='<%# Eval("Id") %>'
                                                        OnClientClick="return confirm('Delete this event type?');">
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
                <!-- /Existing Event Types -->
            </div>

        </div>
    </div>
    </form>

    <script src="<%= ResolveUrl("~/assets/js/jquery-3.7.1.min.js") %>"></script>
    <script src="<%= ResolveUrl("~/assets/js/bootstrap.bundle.min.js") %>"></script>
</body>
</html>