using System;
using System.Linq;
using Demo.Services;

namespace Demo.Controllers
{
    public partial class EmployeeDocumentList : System.Web.UI.Page
    {
        EmployeeDocumentService employeeDocumentService;

        protected void Page_Load(object sender, EventArgs e)
        {
            employeeDocumentService =
                new EmployeeDocumentService();

            if (!IsPostBack)
            {
                GridView1.PageSize = 5;

                GetDocuments();
            }
        }


        // FETCH ALL DOCUMENTS
        public void GetDocuments()
        {
            var documents =
                employeeDocumentService.GetEmployeeDocuments();

            string search =
                TextBox1.Text.Trim();

            if (search != "")
            {
                documents = documents
                    .Where(x =>
                        x.DocName.ToLower()
                        .Contains(search.ToLower()))
                    .ToList();
            }

            GridView1.DataSource = documents;

            GridView1.DataBind();
        }


        // ADD
        protected void btnAddDocument_Click(
            object sender,
            EventArgs e)
        {
            Response.Redirect(
                "AddDocumentName(employee).aspx");
        }


        // SEARCH
        protected void TextBox1_TextChanged(
            object sender,
            EventArgs e)
        {
            GridView1.PageIndex = 0;

            GetDocuments();
        }


        // ROW PER PAGE
        protected void DropDownList1_SelectedIndexChanged(
            object sender,
            EventArgs e)
        {
            GridView1.PageSize =
                Convert.ToInt32(
                    DropDownList1.SelectedValue);

            GridView1.PageIndex = 0;

            GetDocuments();
        }


        // PAGINATION
        protected void GridView1_PageIndexChanging(
            object sender,
            System.Web.UI.WebControls.GridViewPageEventArgs e)
        {
            GridView1.PageIndex =
                e.NewPageIndex;

            GetDocuments();
        }


        // EDIT / DELETE
        protected void GridView1_RowCommand(
            object sender,
            System.Web.UI.WebControls.GridViewCommandEventArgs e)
        {
            int id =
                Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "EditDocument")
            {
                Response.Redirect(
                    "EditDocumentName(employee).aspx?id=" + id);
            }

            if (e.CommandName == "DeleteDocument")
            {
                employeeDocumentService
                    .DeleteEmployeeDocument(id);

                GetDocuments();
            }
        }
    }
}