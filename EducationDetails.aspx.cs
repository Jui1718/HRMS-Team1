using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class EducationDetails : System.Web.UI.Page
    {
        EducationDetailService service = new EducationDetailService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeatchEducationDetail();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                int userid = int.Parse(HiddenField1.Value);
                service.DeleteEducationDetail(id, userid);
                FeatchEducationDetail();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                EducationDetail obj = service.FetchEducationDetailByID(id);
                if (obj != null)
                {
                    HiddenField1.Value = obj.EducationDetailsId.ToString();
                    TextBox1.Text = obj.UniversityName;
                    TextBox2.Text = obj.EducationType;
                    TextBox3.Text = obj.startdate.Value.ToString("yyyy-MM-dd");
                    TextBox4.Text = obj.enddate.Value.ToString("yyyy-MM-dd");
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            AddEducationDetail();
        }
        public void AddEducationDetail()
        {
            string institutionname = TextBox1.Text;
            string course = TextBox2.Text;
            DateTime startdate = DateTime.Parse(TextBox3.Text);
            DateTime enddate = DateTime.Parse(TextBox4.Text);
            int userid = 1;
            var e = new EducationDetail
            {
                UniversityName = institutionname,
                EducationType = course,
                startdate = startdate,
                enddate = enddate,
                UserId = userid
            };
            string msg = service.AddEducationDetail(e);
            FeatchEducationDetail();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Write("<script>alert('" + msg + "')</script>");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateEducationDetail();
        }
        public void UpdateEducationDetail()
        {
            string institutionname = TextBox1.Text;
            string course = TextBox2.Text;
            DateTime startdate = DateTime.Parse(TextBox3.Text);
            DateTime enddate = DateTime.Parse(TextBox4.Text);
            int id = int.Parse(HiddenField1.Value);
            int userid = 1;
            var e = new EducationDetail
            {
                EducationDetailsId = id,
                UniversityName = institutionname,
                EducationType = course,
                startdate = startdate,
                enddate = enddate,
                UserId = userid
            };
            service.UpdateEducationDetail(e);
            FeatchEducationDetail();
            HiddenField1.Value = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Write("<script>alert('Updated Successfully')</script>");
        }
        public void FeatchEducationDetail()
        {
            var gw = service.FetchEducationDetail();
            GridView1.DataSource = gw;
            GridView1.DataBind();
        }
    }
}