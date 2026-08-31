using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class DesignationController : System.Web.UI.Page
    {
        DesignationService service = new DesignationService();
        DepartmentService departmentService = new DepartmentService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadDepartments();
                FeatchDesignation();
            }
        }

        public void LoadDepartments()
        {
            var departments = departmentService.FeatchDepartment();

            DropDownListDepartment.DataSource = departments;
            DropDownListDepartment.DataTextField = "Name";
            DropDownListDepartment.DataValueField = "DepartmentId";
            DropDownListDepartment.DataBind();
            DropDownListDepartment.Items.Insert(0, new ListItem("Select Department", "")); //gpt work

            DropDownListDepartmentEdit.DataSource = departments;
            DropDownListDepartmentEdit.DataTextField = "Name";
            DropDownListDepartmentEdit.DataValueField = "DepartmentId";
            DropDownListDepartmentEdit.DataBind();
            DropDownListDepartmentEdit.Items.Insert(0, new ListItem("Select Department", "")); //gpt work
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                service.DeleteDesignation(id);
                FeatchDesignation();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Designation obj = service.FetchDesignationByID(id);

                if (obj != null)
                {
                    HiddenField1.Value = obj.DesignationId.ToString();
                    TextBoxEdit.Text = obj.Name;
                    DropDownListEdit.SelectedValue = obj.status;

                    if (obj.DepartmentId.HasValue)
                    {
                        DropDownListDepartmentEdit.SelectedValue =
                            obj.DepartmentId.Value.ToString();
                    }

                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "ShowEdit",
                        "var modal = new bootstrap.Modal(document.getElementById('editModal')); modal.show();",
                        true
                    );

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddDesignation();
        }

        public void AddDesignation()
        {
            string name = TextBox1.Text;
            string departmentId = DropDownListDepartment.SelectedValue;
            string status = DropDownList1.SelectedValue;

            var d = new Designation
            {
                Name = name,
                DepartmentId = int.Parse(departmentId),
                status = status,
                NoOfEmployee = 0
            };

            string msg = service.AddDesignation(d);

            FeatchDesignation();

            TextBox1.Text = "";
            DropDownListDepartment.SelectedIndex = 0;
            DropDownList1.SelectedIndex = 0;

            Response.Write("<script>alert('" + msg + "')</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateDesignation();
        }

        public void UpdateDesignation()
        {
            string name = TextBoxEdit.Text;
            string departmentId = DropDownListDepartmentEdit.SelectedValue;
            string status = DropDownListEdit.SelectedValue;
            int id = int.Parse(HiddenField1.Value);

            var d = new Designation
            {
                DesignationId = id,
                Name = name,
                DepartmentId = int.Parse(departmentId),
                status = status
            };

            service.UpdateDesignation(d);

            FeatchDesignation();

            HiddenField1.Value = "";
            TextBoxEdit.Text = "";
            DropDownListDepartmentEdit.SelectedIndex = 0;
            DropDownListEdit.SelectedIndex = 0;

            Response.Write("<script>alert('Updated Successfully')</script>");
        }

        public void FeatchDesignation()
        {
            var designations = service.FeatchDesignation();
            GridView1.DataSource = designations;
            GridView1.DataBind();
        }

    }
}
