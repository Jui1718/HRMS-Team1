using System;
using Demo.Models;
using Demo.Services;

namespace Demo.Controllers
{
    public partial class AddDocumentName_employee_
        : System.Web.UI.Page
    {
        EmployeeDocumentService
            employeeDocumentService;

        protected void Page_Load(
            object sender,
            EventArgs e)
        {
            employeeDocumentService =
                new EmployeeDocumentService();
        }

        protected void btnSave_Click(
            object sender,
            EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                return;
            }

            EmployeeDocument document =
                new EmployeeDocument();

            document.DocName =
                TextBox1.Text.Trim();

            employeeDocumentService
                .AddEmployeeDocument(document);

            Response.Redirect(
                "EmployeeDocumentList.aspx");
        }

        protected void btnCancel_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "EmployeeDocumentList.aspx");
        }
    }
}