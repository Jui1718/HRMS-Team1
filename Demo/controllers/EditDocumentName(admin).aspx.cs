using System;
using Demo.Models;
using Demo.Services;

namespace Demo.Controllers
{
    public partial class EditDocumentName_admin_ : System.Web.UI.Page
    {
        DocumentService documentService;

        protected void Page_Load(object sender, EventArgs e)
        {
            documentService = new DocumentService();

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] == null)
                {
                    Response.Redirect("AdminDocumentList.aspx");
                    return;
                }

                int id = Convert.ToInt32(Request.QueryString["id"]);

                Document document =
                    documentService.GetAdminDocumentById(id);

                if (document == null)
                {
                    Response.Redirect("AdminDocumentList.aspx");
                    return;
                }

                TextBox1.Text = document.DocName;
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                return;
            }

            int id = Convert.ToInt32(Request.QueryString["id"]);

            Document document = new Document();

            document.Id = id;
            document.DocName = TextBox1.Text.Trim();

            documentService.UpdateAdminDocument(document);

            Response.Redirect("AdminDocumentList.aspx");
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDocumentList.aspx");
        }
    }
}