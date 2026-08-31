using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class EmployeeFamilyDetails : System.Web.UI.Page
    {
        EmployeeFamilyDetailService service = new EmployeeFamilyDetailService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeatchEmployeeFamilyDetail();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                int userid = int.Parse(HiddenField1.Value);
                service.DeleteEmployeeFamilyDetail(id, userid);
                FeatchEmployeeFamilyDetail();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                EmployeeFamilyDetail obj = service.FetchEmployeeFamilyDetailByID(id);
                if (obj != null)
                {
                    HiddenField1.Value = obj.FamilyDetailId.ToString();
                    TextBox1.Text = obj.Name;
                    TextBox2.Text = obj.Relation;
                    TextBox3.Text = obj.phone;
                    TextBox4.Text = obj.DateOfBirth.Value.ToString("yyyy-MM-dd");
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            AddEmployeeFamilyDetail();
        }
        public void AddEmployeeFamilyDetail()
        {
            string name = TextBox1.Text;
            string relation = TextBox2.Text;
            string phone = TextBox3.Text;
            DateTime dateofbirth = DateTime.Parse(TextBox4.Text);
            int userid = 1;
            var f = new EmployeeFamilyDetail
            {
                Name = name,
                Relation = relation,
                phone = phone,
                DateOfBirth = dateofbirth,
                UserId = userid
            };
            string msg = service.AddEmployeeFamilyDetail(f);
            FeatchEmployeeFamilyDetail();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Write("<script>alert('" + msg + "')</script>");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateEmployeeFamilyDetail();
        }
        public void UpdateEmployeeFamilyDetail()
        {
            string name = TextBox1.Text;
            string relation = TextBox2.Text;
            string phone = TextBox3.Text;
            DateTime dateofbirth = DateTime.Parse(TextBox4.Text);
            int id = int.Parse(HiddenField1.Value);
            int userid = 1;
            var f = new EmployeeFamilyDetail
            {
                FamilyDetailId = id,
                Name = name,
                Relation = relation,
                phone = phone,
                DateOfBirth = dateofbirth,
                UserId = userid
            };
            service.UpdateEmployeeFamilyDetail(f);
            FeatchEmployeeFamilyDetail();
            HiddenField1.Value = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Write("<script>alert('Updated Successfully')</script>");
        }
        public void FeatchEmployeeFamilyDetail()
        {
            var gw = service.FetchEmployeeFamilyDetail();
            GridView1.DataSource = gw;
            GridView1.DataBind();
        }
    }
}