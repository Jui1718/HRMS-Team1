<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="OrganizationController.aspx.cs" Inherits="ProjectDemo.OrganizationController" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Organization</title>
</head>

<body>
    <form id="form1" runat="server">

        <div>

            <asp:HiddenField ID="HiddenField1" runat="server" />

            Organization Name
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />

            Organization Contact
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />

            Organization Address
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />

            Organization Email
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />

            Organization Logo
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />

            Organization Description
            <asp:TextBox ID="TextBox5" runat="server"
                TextMode="MultiLine"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="Button2"
                runat="server"
                Text="Cancel" />

            &nbsp;

            <asp:Button ID="Button1"
                runat="server"
                Text="Add Organization"
                OnClick="Button1_Click" />

            &nbsp;

            <asp:Button ID="Button3"
                runat="server"
                Text="Update"
                OnClick="Button3_Click" />

            <br />
            <br />

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="Organization Name">
                        <ItemTemplate>
                            <asp:Label ID="Label1"
                                runat="server"
                                Text='<%# Eval("OrganizationName") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Organization Address">
                        <ItemTemplate>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("OrganizationAddress") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Organization Phone">
                        <ItemTemplate>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("OrganizationPhone") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Organization Email">
                        <ItemTemplate>
                            <asp:Label ID="Label4"
                                runat="server"
                                Text='<%# Eval("OrganizationEmail") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Organization Logo">
                        <ItemTemplate>
                            <asp:Image ID="Image1"
                                runat="server"
                                ImageUrl='<%# Eval("OrganizationLogo") %>'
                                Width="80px"
                                Height="80px" />
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:Button ID="ButtonDelete"
                                runat="server"
                                Text="Delete"
                                CommandName="Del"
                                CommandArgument='<%# Eval("OrganizationId") %>'
                                OnClientClick="return confirm('Are You Sure?');" />

                            <asp:Button ID="ButtonEdit"
                                runat="server"
                                Text="Edit"
                                CommandName="Upd"
                                CommandArgument='<%# Eval("OrganizationId") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>

    </form>
</body>
</html>