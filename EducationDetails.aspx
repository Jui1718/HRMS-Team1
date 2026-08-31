<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EducationDetails.aspx.cs" Inherits="ProjectDemo.EducationDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Education Information</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HiddenField ID="HiddenField1" runat="server" />

            <h3>Education Information</h3>

            Institution Name *
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />

            Course *
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />

            Start Date *
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />

            End Date *
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Date"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="Button2" runat="server" Text="cancel" />
            &nbsp;
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Education Details" />
            &nbsp;
            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Update" />

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
                                Text='<%# Eval("EducationDetailsId") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Institution Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("UniversityName") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Course">
                        <ItemTemplate>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("EducationType") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Start Date">
                        <ItemTemplate>
                            <asp:Label ID="Label4"
                                runat="server"
                                Text='<%# Eval("startdate", "{0:dd/MM/yyyy}") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="End Date">
                        <ItemTemplate>
                            <asp:Label ID="Label5"
                                runat="server"
                                Text='<%# Eval("enddate", "{0:dd/MM/yyyy}") %>'>
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
                                CommandArgument='<%# Eval("EducationDetailsId") %>'
                                OnClientClick="return confirm('Are You Sure?');" />

                            <asp:Button ID="ButtonEdit"
                                runat="server"
                                Text="Edit"
                                CommandName="Upd"
                                CommandArgument='<%# Eval("EducationDetailsId") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </form>
</body>
</html>