<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Experience.aspx.cs" Inherits="ProjectDemo.Experience" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Company Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="HiddenField1" runat="server" />

            <h3>Company Information</h3>

            Previous Company Name *
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />

            Designation *
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />

            Start Date *
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />

            End Date
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />

            <asp:CheckBox ID="CheckBox1"
                runat="server"
                Text="Check if you working present" />

            <br />
            <br />

            <asp:Button ID="Button2"
                runat="server"
                Text="cancel" />

            &nbsp;

            <asp:Button ID="Button1"
                runat="server"
                OnClick="Button1_Click"
                Text="Add Experience" />

            &nbsp;

            <asp:Button ID="Button3"
                runat="server"
                OnClick="Button3_Click"
                Text="Update" />

            <br />
            <br />

            <h3>Experience</h3>

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="Company">
                        <ItemTemplate>
                            <asp:Label ID="Label1"
                                runat="server"
                                Text='<%# Eval("CompanyName") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Designation">
                        <ItemTemplate>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("DesignationName") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("FromDate", "{0:dd/MM/yyyy}") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <asp:Label ID="Label4"
                                runat="server"
                                Text='<%# Eval("ToDate", "{0:dd/MM/yyyy}") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>
                            <asp:Button ID="ButtonDelete"
                                runat="server"
                                Text="Delete"
                                CommandName="Del"
                                CommandArgument='<%# Eval("ExperienceId") %>'
                                OnClientClick="return confirm('Are You Sure?');" />

                            <asp:Button ID="ButtonEdit"
                                runat="server"
                                Text="Edit"
                                CommandName="Upd"
                                CommandArgument='<%# Eval("ExperienceId") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </form>
</body>
</html>