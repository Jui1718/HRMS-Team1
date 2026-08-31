using Demo.Services;
using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controllers
{
    public partial class FetchUploadedDocuments_Admin_ : Page
    {
        FileUploadService fileUploadService;

        protected void Page_Load(object sender, EventArgs e)
        {
            fileUploadService = new FileUploadService();

            if (!IsPostBack)
            {
                //LoadDocuments();
            }
        }

        //private void LoadDocuments()
        //{
        //    GridView1.DataSource = fileUploadService.GetUploadedDocuments();
        //    GridView1.DataBind();
        //}

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int id = Convert.ToInt32(e.CommandArgument);

            if (e.CommandName == "ViewDocument")
            {
                string filePath = fileUploadService.GetFilePath(id);

                Response.Redirect(filePath);
            }

            else if (e.CommandName == "DownloadDocument")
            {
                string filePath = fileUploadService.GetFilePath(id);

                Response.Redirect(filePath);
            }

            else if (e.CommandName == "DeleteDocument")
            {
            //    fileUploadService.DeleteDocument(id);

            //    LoadDocuments();
            }
        }
    }
}