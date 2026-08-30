using Demo.Service;
using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo.Controller
{
    public partial class TrainingTypePage : System.Web.UI.Page
    {
        TrainingTypeService service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new TrainingTypeService();

            if (!IsPostBack)
            {
                FetchTrainingType();
            }
            Pagination();
        }

        public void Pagination()
        {
            if (gvTrainingType.Rows.Count > 0)
            {
                gvTrainingType.UseAccessibleHeader = true;
                gvTrainingType.HeaderRow.TableSection = TableRowSection.TableHeader;
                foreach (GridViewRow row in gvTrainingType.Rows)
                {
                    row.TableSection = TableRowSection.TableBody;
                }
            }
        }

        public void FetchTrainingType()
        {
            var trainingType = service.FetchAll();

            if (ddlSortBy.SelectedValue == "desc")
            {
                trainingType = trainingType.OrderByDescending(t => t.TrainingTypeName).ToList();
            }
            else
            {
                trainingType = trainingType.OrderBy(t => t.TrainingTypeName).ToList();
            }

            gvTrainingType.DataSource = trainingType;
            gvTrainingType.DataBind();
            Pagination();
        }

        public void SaveTrainingType()
        {
            string trainingTypeName = txtTrainingTypeName.Text;
            string description = txtDescription.Text;
            string status = ddlStatus.SelectedValue;

            var t = new Demo.Model.TrainingType()
            {
                TrainingTypeName = trainingTypeName,
                Description = description,
                Status = status
            };

            string msg;

            int trainingTypeId = int.Parse(hdnTrainingTypeId.Value);

            if (trainingTypeId > 0)
            {
                t.TrainingTypeId = trainingTypeId;
                msg = service.Update(t);
                btnAdd.Text = "Add";
            }
            else
            {
                msg = service.Add(t);
            }

            ClearForm();
            FetchTrainingType();

            Response.Write($"<script>alert('{msg}')</script>");
        }

        private void ClearForm()
        {
            txtTrainingTypeName.Text = "";
            txtDescription.Text = "";
            ddlStatus.ClearSelection();
            hdnTrainingTypeId.Value = "0";
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            SaveTrainingType();
        }

        protected void btnAddTrainingType_Click(object sender, EventArgs e)
        {
            ClearForm();
            btnAdd.Text = "Add";
            LitModalTitle.Text = "Add Training Type";

            ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_trainingtype')); m.show(); };</script>");
        }

        protected void gvTrainingType_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            int trainingTypeId = int.Parse(e.CommandArgument.ToString());

            if (e.CommandName == "EditItem")
            {
                var obj = service.GetById(trainingTypeId);

                txtTrainingTypeName.Text = obj.TrainingTypeName;
                txtDescription.Text = obj.Description;

                ddlStatus.ClearSelection();
                ddlStatus.Items.FindByText(obj.Status).Selected = true;

                hdnTrainingTypeId.Value = trainingTypeId.ToString();
                btnAdd.Text = "Update";
                LitModalTitle.Text = "Edit Training Type";

                ClientScript.RegisterStartupScript(this.GetType(), "openModal",
                    "<script>window.onload = function(){ var m = new bootstrap.Modal(document.getElementById('new_trainingtype')); m.show(); };</script>");
            }
            else if (e.CommandName == "DeleteItem")
            {
                string msg = service.Delete(trainingTypeId);

                FetchTrainingType();

                Response.Write($"<script>alert('{msg}')</script>");
            }
        }

        protected void ddlSortBy_SelectedIndexChanged(object sender, EventArgs e)
        {
            FetchTrainingType();
        }

        public string GetStatusBadgeClass(string status)
        {
            switch (status)
            {
                case "Active":
                    return "bg-success";
                case "Inactive":
                    return "bg-danger";
                default:
                    return "bg-secondary";
            }
        }
    }
}