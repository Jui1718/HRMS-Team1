using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class RoleController : System.Web.UI.Page
    {
        RoleService service = new RoleService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeatchRole();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                service.DeleteRole(id);
                FeatchRole();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                Role obj = service.FetchRoleByID(id);

                if (obj != null)
                {
                    HiddenField1.Value = obj.RoleId.ToString();
                    TextBoxEdit.Text = obj.RoleName;
                    DropDownListEdit.SelectedValue = obj.Status;

                    ScriptManager.RegisterStartupScript(
                    this,
                    GetType(),
                    "ShowEdit",
                    "document.getElementById('edit_role').classList.add('show'); document.getElementById('edit_role').style.display='block'; document.body.classList.add('modal-open'); var backdrop=document.createElement('div'); backdrop.className='modal-backdrop fade show'; document.body.appendChild(backdrop);",
                    true
                );


                }
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddRole();
        }

        public void AddRole()
        {
            string name = TextBox1.Text;
            string status = DropDownList1.SelectedValue;

            var r = new Role
            {
                RoleName = name,
                Status = status
            };

            string msg = service.AddRole(r);

            FeatchRole();

            TextBox1.Text = "";
            DropDownList1.SelectedIndex = 0;

            Response.Write("<script>alert('" + msg + "')</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateRole();
        }

        public void UpdateRole()
        {
            string name = TextBoxEdit.Text;
            string status = DropDownListEdit.SelectedValue;
            int id = int.Parse(HiddenField1.Value);

            var r = new Role
            {
                RoleId = id,
                RoleName = name,
                Status = status
            };

            service.UpdateRole(r);

            FeatchRole();

            HiddenField1.Value = "";
            TextBoxEdit.Text = "";
            DropDownListEdit.SelectedIndex = 0;

            Response.Write("<script>alert('Updated Successfully')</script>");
        }

        public void FeatchRole()
        {
            var roles = service.FeatchRole();

            GridView1.DataSource = roles;
            GridView1.DataBind();
        }
    }
}
