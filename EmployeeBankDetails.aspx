<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeBankDetails.aspx.cs" Inherits="ProjectDemo.EmployeeBankDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bank Details</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <asp:HiddenField ID="HiddenField1" runat="server" />

            <h3>Bank Details</h3>

            Bank Details *
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <br />

            Bank account No
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
            <br />

            IFSC Code
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
            <br />
            <br />

            Branch Address
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
            <br />
            <br />

            <asp:Button ID="Button2"
                runat="server"
                Text="cancel" />

            &nbsp;

            <asp:Button ID="Button1"
                runat="server"
                OnClick="Button1_Click"
                Text="Add Bank Details" />

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
                                Text='<%# Eval("BankDetailId") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Bank Name">
                        <ItemTemplate>
                            <asp:Label ID="Label2"
                                runat="server"
                                Text='<%# Eval("BankName") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Account Number">
                        <ItemTemplate>
                            <asp:Label ID="Label3"
                                runat="server"
                                Text='<%# Eval("AccountNumber") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="IFSC Code">
                        <ItemTemplate>
                            <asp:Label ID="Label4"
                                runat="server"
                                Text='<%# Eval("IFSCCode") %>'>
                            </asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Branch Name">
                        <ItemTemplate>
                            <asp:Label ID="Label5"
                                runat="server"
                                Text='<%# Eval("BranchName") %>'>
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
                                CommandArgument='<%# Eval("BankDetailId") %>'
                                OnClientClick="return confirm('Are You Sure?');" />

                            <asp:Button ID="ButtonEdit"
                                runat="server"
                                Text="Edit"
                                CommandName="Upd"
                                CommandArgument='<%# Eval("BankDetailId") %>' />

                        </ItemTemplate>
                    </asp:TemplateField>

                </Columns>

            </asp:GridView>

        </div>
    </form>
</body>
</html>