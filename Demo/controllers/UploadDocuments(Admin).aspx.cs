using System;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;
using Demo.Models;
using Demo.Services;

using ModelFileUpload = Demo.Models.FileUpload;

namespace Demo.Controllers
{
    public partial class UploadDocuments_Admin_ : System.Web.UI.Page
    {
        FileUploadService fileUploadService;


        protected void Page_Init(object sender, EventArgs e)
        {
            fileUploadService =
                new FileUploadService();

            int count = 1;

            if (!string.IsNullOrEmpty(
                Request.Form[rowCount.UniqueID]))
            {
                int.TryParse(
                    Request.Form[rowCount.UniqueID],
                    out count
                );

                if (count <= 0)
                {
                    count = 1;
                }
            }

            for (int i = 0; i < count; i++)
            {
                CreateDocumentRow(i);
            }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadUsers();
            }
        }


        // LOAD USERS
        public void LoadUsers()
        {
            ddlUser.DataSource =
                fileUploadService.GetUsersForFileUpload();

            ddlUser.DataTextField =
                "Email";

            ddlUser.DataValueField =
                "UserId";

            ddlUser.DataBind();

            ddlUser.Items.Insert(
                0,
                new ListItem(
                    "-- Select User --",
                    ""
                )
            );
        }


        // CREATE DOCUMENT ROW
        public void CreateDocumentRow(int index)
        {
            Panel row = new Panel();

            row.ID =
                "row" + index;


            DropDownList ddlDocument =
                new DropDownList();

            ddlDocument.ID =
                "ddlDocument" + index;


            ddlDocument.DataSource =
                fileUploadService
                .GetAdminDocumentNames();

            ddlDocument.DataTextField =
                "DocName";

            ddlDocument.DataValueField =
                "Id";

            ddlDocument.DataBind();


            ddlDocument.Items.Insert(
                0,
                new ListItem(
                    "-- Select Document --",
                    ""
                )
            );


            System.Web.UI.WebControls.FileUpload file =
                new System.Web.UI.WebControls.FileUpload();

            file.ID =
                "file" + index;


            row.Controls.Add(
                ddlDocument
            );

            row.Controls.Add(
                new LiteralControl("&nbsp;&nbsp;")
            );

            row.Controls.Add(
                file
            );

            row.Controls.Add(
                new LiteralControl(
                    "&nbsp;&nbsp;"
                )
            );

            row.Controls.Add(
                new LiteralControl(
                    "<br/><br/>"
                )
            );


            pnlDocuments.Controls.Add(
                row
            );
        }


        // SAVE
        protected void btnSave_Click(
            object sender,
            EventArgs e)
        {
            if (ddlUser.SelectedValue == "")
            {
                Response.Write(
                    "<script>alert('Please select a user.');</script>"
                );

                return;
            }


            int userId =
                Convert.ToInt32(
                    ddlUser.SelectedValue
                );


            int count = 1;


            if (!string.IsNullOrEmpty(
                Request.Form[rowCount.UniqueID]))
            {
                int.TryParse(
                    Request.Form[rowCount.UniqueID],
                    out count
                );
            }


            bool uploaded = false;


            for (int i = 0; i < count; i++)
            {
                DropDownList ddlDocument =
                    pnlDocuments.FindControl(
                        "row" + i
                    )?.FindControl(
                        "ddlDocument" + i
                    ) as DropDownList;


                System.Web.UI.WebControls.FileUpload file =
                    pnlDocuments.FindControl(
                        "row" + i
                    )?.FindControl(
                        "file" + i
                    ) as System.Web.UI.WebControls.FileUpload;


                if (ddlDocument == null)
                {
                    continue;
                }


                if (file == null)
                {
                    continue;
                }


                if (ddlDocument.SelectedValue == "")
                {
                    continue;
                }


                if (!file.HasFile)
                {
                    continue;
                }


                // CREATE UPLOAD FOLDER

                string folderPath =
                    Server.MapPath(
                        "~/Uploads/AdminDocuments/"
                    );


                if (!Directory.Exists(folderPath))
                {
                    Directory.CreateDirectory(
                        folderPath
                    );
                }


                // ORIGINAL FILE NAME

                string originalFileName =
                    Path.GetFileName(
                        file.FileName
                    );


                // EXTENSION

                string extension =
                    Path.GetExtension(
                        originalFileName
                    );


                // UNIQUE FILE NAME

                string savedFileName =
                    Guid.NewGuid().ToString()
                    + extension;


                string physicalPath =
                    Path.Combine(
                        folderPath,
                        savedFileName
                    );


                // SAVE FILE

                file.SaveAs(
                    physicalPath
                );


                // DATABASE PATH

                string databasePath =
                    "~/Uploads/AdminDocuments/"
                    + savedFileName;


                // MODEL

                ModelFileUpload upload =
                    new ModelFileUpload();


                upload.FileName =
                    originalFileName;


                upload.FilePath =
                    databasePath;


                upload.UserId =
                    userId;


                upload.DocumentId =
                    Convert.ToInt32(
                        ddlDocument.SelectedValue
                    );


                // INSERT DATABASE

                fileUploadService
                    .AddFileUpload(upload);


                uploaded = true;
            }


            if (uploaded)
            {
                Response.Write(
                    "<script>" +
                    "alert('File uploaded successfully.');" +
                    "window.location='UploadDocuments(Admin).aspx';" +
                    "</script>"
                );
            }
            else
            {
                Response.Write(
                    "<script>" +
                    "alert('Please select file.');" +
                    "</script>"
                );
            }
        }
    }
}