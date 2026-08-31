using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class DepartmentController : System.Web.UI.Page
    {
        DepartmentService service = new DepartmentService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeatchDepartment();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                service.DeleteDepartment(id);
                FeatchDepartment();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());

                Department obj = service.FetchDepartmentByID(id);

                if (obj != null)
                {
                    HiddenField1.Value = obj.DepartmentId.ToString();

                    TextBoxEdit.Text = obj.Name;

                    if (DropDownListEdit.Items.FindByValue(obj.Status) != null)
                    {
                        DropDownListEdit.SelectedValue = obj.Status;
                    }

                    ScriptManager.RegisterStartupScript(
                        this,
                        GetType(),
                        "ShowEditModal",
                        "var editModal = new bootstrap.Modal(document.getElementById('editModal')); editModal.show();",
                        true
                    );

                    //ScriptManager.RegisterStartupScript(/.'

                    //    this,
                    //    GetType(),
                    //    "ShowEdit",
                    //    "document.getElementById('editModal').classList.add('show'); document.getElementById('editModal').style.display='block'; document.body.classList.add('modal-open'); var backdrop=document.createElement('div'); backdrop.className='modal-backdrop fade show'; document.body.appendChild(backdrop);",
                    //    true
                    //);

                }
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddDepartment();
        }

        public void AddDepartment()
        {
            string name = TextBox1.Text;
            string status = DropDownList1.SelectedValue;

            var d = new Department
            {
                Name = name,
                Status = status
            };

            string msg = service.AddDepartment(d);

            FeatchDepartment();

            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0;

            Response.Write("<script>alert('" + msg + "')</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateDepartment();
        }

        public void UpdateDepartment()
        {
            string name = TextBoxEdit.Text;
            string status = DropDownListEdit.SelectedValue;
            int id = int.Parse(HiddenField1.Value);

            var d = new Department
            {
                DepartmentId = id,
                Name = name,
                Status = status
            };

            service.UpdateDepartment(d);

            FeatchDepartment();

            HiddenField1.Value = "";
            TextBoxEdit.Text = "";
            DropDownListEdit.SelectedIndex = 0;

            Response.Write("<script>alert('Updated Successfully')</script>");
        }

        public void FeatchDepartment()
        {
            var departments = service.FeatchDepartment();
            GridView1.DataSource = departments;
            GridView1.DataBind();
        }
    }
}

