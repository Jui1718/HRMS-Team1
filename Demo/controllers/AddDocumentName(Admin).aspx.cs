using Demo.Models;
using Demo.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class AddDocumentName_Admin_1 : System.Web.UI.Page
    {
        DocumentService documentService;

        protected void Page_Load(object sender, EventArgs e)
        {
            documentService = new DocumentService();
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (TextBox1.Text.Trim() == "")
            {
                return;
            }

            Document document = new Document();

            document.DocName = TextBox1.Text.Trim();

            documentService.AddAdminDocument(document);

            Response.Redirect("AdminDocumentList.aspx");
        }


        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("AdminDocumentList.aspx");
        }
    }
}