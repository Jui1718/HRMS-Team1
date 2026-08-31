<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeFamilyDetails.aspx.cs" Inherits="ProjectDemo.EmployeeFamilyDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Family Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:HiddenField ID="HiddenField1" runat="server" />

            <h3>Family Information</h3>

            Name *
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />

            Relationship
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />

            Phone
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />

            Date Of Birth *
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="Button2"
                runat="server"
                Text="cancel" />

            &nbsp;

            <asp:Button ID="Button1"
                runat="server"
                OnClick="Button1_Click"
                Text="Add Family Details" />

            &nbsp;

            <asp:Button ID="Button3"
                runat="server"
                OnClick="Button3_Click"
                Text="Update" />

            <br />
            <br />

            <asp:GridView ID="GridView1"
                runat="server"
                AutoGenerateColumns="False"
                OnRowCommand="GridView1_RowCommand">

                <Columns>

                    <asp:TemplateField HeaderText="ID">
                        <ItemTemplate>
                            <asp:Label ID="Label1"
                                runat="server"
                                Text='<%# Eval("FamilyDetailId") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("Name") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Relationship">
                        <ItemTemplate>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("Relation") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Phone">
                        <ItemTemplate>
                            <asp:Label ID="Label4"
                                runat="server"
                                Text='<%# Eval("phone") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Date Of Birth">
                        <ItemTemplate>
                            <asp:Label ID="Label5"
                                runat="server"
                                Text='<%# Eval("DateOfBirth", "{0:dd/MM/yyyy}") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="User ID">
                        <ItemTemplate>
                            <asp:Label ID="Label6"
                                runat="server"
                                Text='<%# Eval("UserId") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Actions">
                        <ItemTemplate>

                            <asp:Button ID="ButtonDelete"
                                runat="server"
                                Text="Delete"
                                CommandName="Del"
                                CommandArgument='<%# Eval("FamilyDetailId") %>'
                                OnClientClick="return confirm('Are You Sure?');" />

                            <asp:Button ID="ButtonEdit"
                                runat="server"
                                Text="Edit"
                                CommandName="Upd"
                                CommandArgument='<%# Eval("FamilyDetailId") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </form>
</body>
</html>