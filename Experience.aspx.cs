using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class Experience : System.Web.UI.Page
    {
        ExperienceService service = new ExperienceService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeatchExperience();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                int userid = 1;
                service.DeleteExperience(id, userid);
                FeatchExperience();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                EmployeeExperience obj = service.FetchExperienceByID(id);
                if (obj != null)
                {
                    HiddenField1.Value = obj.ExperienceId.ToString();
                    TextBox1.Text = obj.CompanyName;
                    TextBox2.Text = obj.DesignationName;
                    TextBox3.Text = obj.FromDate.ToString("yyyy-MM-dd");

                    if (obj.ToDate.HasValue)
                    {
                        TextBox4.Text = obj.ToDate.Value.ToString("yyyy-MM-dd");
                        CheckBox1.Checked = false;
                    }
                    else
                    {
                        TextBox4.Text = "";
                        CheckBox1.Checked = true;
                    }
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            AddExperience();
        }
        public void AddExperience()
        {
            string companyname = TextBox1.Text;
            string designationname = TextBox2.Text;
            DateTime fromdate = DateTime.Parse(TextBox3.Text);
            DateTime? todate = null;

            if (!CheckBox1.Checked && TextBox4.Text != "")
            {
                todate = DateTime.Parse(TextBox4.Text);
            }

            int userid = 1;

            var e = new EmployeeExperience
            {
                CompanyName = companyname,
                DesignationName = designationname,
                FromDate = fromdate,
                ToDate = todate,
                UserId = userid
            };

            string msg = service.AddExperience(e);
            FeatchExperience();

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            CheckBox1.Checked = false;

            Response.Write("<script>alert('" + msg + "')</script>");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateExperience();
        }
        public void UpdateExperience()
        {
            string companyname = TextBox1.Text;
            string designationname = TextBox2.Text;
            DateTime fromdate = DateTime.Parse(TextBox3.Text);
            DateTime? todate = null;

            if (!CheckBox1.Checked && TextBox4.Text != "")
            {
                todate = DateTime.Parse(TextBox4.Text);
            }

            int id = int.Parse(HiddenField1.Value);
            int userid = 1;

            var e = new EmployeeExperience
            {
                ExperienceId = id,
                CompanyName = companyname,
                DesignationName = designationname,
                FromDate = fromdate,
                ToDate = todate,
                UserId = userid
            };

            service.UpdateExperience(e);
            FeatchExperience();

            HiddenField1.Value = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            CheckBox1.Checked = false;

            Response.Write("<script>alert('Updated Successfully')</script>");
        }
        public void FeatchExperience()
        {
            int userid = 1;

            var gw = service.FetchExperience(userid);

            GridView1.DataSource = gw;
            GridView1.DataBind();
        }
    }
}