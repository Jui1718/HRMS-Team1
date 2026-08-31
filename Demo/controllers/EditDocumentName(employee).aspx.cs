using System;
using Demo.Models;
using Demo.Services;

namespace Demo.Controllers
{
    public partial class EditDocumentName_employee_
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

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect(
                        "EmployeeDocumentList.aspx");

                    return;
                }

                int id =
                    Convert.ToInt32(
                        Request.QueryString["id"]);

                EmployeeDocument document =
                    employeeDocumentService
                    .GetEmployeeDocumentById(id);

                if (document == null)
                {
                    Response.Redirect(
                        "EmployeeDocumentList.aspx");

                    return;
                }

                TextBox1.Text =
                    document.DocName;
            }
        }


        protected void btnUpdate_Click(
            object sender,
            EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                return;
            }

            int id =
                Convert.ToInt32(
                    Request.QueryString["id"]);

            EmployeeDocument document =
                new EmployeeDocument();

            document.Id = id;

            document.DocName =
                TextBox1.Text.Trim();

            employeeDocumentService
                .UpdateEmployeeDocument(document);

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