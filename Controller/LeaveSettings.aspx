<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LeaveSettings.aspx.cs" Inherits="ProjectDemo.ManageLeaveSettings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Leave Settings</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Manage Leave Settings</h2>

            <div style="text-align:right;">
                Search:
                <asp:TextBox ID="TextBoxSearch" runat="server" AutoPostBack="true" OnTextChanged="TextBoxSearch_TextChanged"></asp:TextBox>
            </div>
            <br />

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="Status Toggle">
                        <ItemTemplate>
                            <asp:HiddenField ID="HiddenFieldId" runat="server" Value='<%# Eval("LeaveTypeId") %>' />
                            <asp:CheckBox ID="CheckBoxStatus"
                                runat="server"
                                AutoPostBack="true"
                                Checked='<%# Eval("Status") != null && Eval("Status").ToString() == "Active" %>'
                                OnCheckedChanged="CheckBoxStatus_CheckedChanged" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Leave Type">
                        <ItemTemplate>
                            <asp:Label ID="LabelLeaveType"
                                runat="server"
                                Text='<%# Eval("LeaveType") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Status">
                        <ItemTemplate>
                            <asp:Label ID="LabelStatus"
                                runat="server"
                                Text='<%# Eval("Status") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButtonCustomPolicy"
                                runat="server"
                                Text="Custom Policy"
                                CommandName="CustomPolicy"
                                CommandArgument='<%# Eval("LeaveTypeId") %>'>
                            </asp:LinkButton>
                            &nbsp;|&nbsp;
                            <asp:LinkButton ID="LinkButtonSettings"
                                runat="server"
                                Text="Settings"
                                CommandName="Settings"
                                CommandArgument='<%# Eval("LeaveTypeId") %>'>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>
        </div>
    </form>
</body>
</html>
