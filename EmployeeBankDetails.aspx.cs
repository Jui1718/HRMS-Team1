using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class EmployeeBankDetails : System.Web.UI.Page
    {
        EmployeeBankDetailsService service = new EmployeeBankDetailsService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                FeatchEmployeeBankDetails();
            }
        }
        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                int userid = int.Parse(HiddenField1.Value);
                service.DeleteEmployeeBankDetails(id, userid);
                FeatchEmployeeBankDetails();
                Response.Write("<script>alert('Deleted Successfully')</script>");
            }
            else if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());
                EmployeeBankDetail obj = service.FetchEmployeeBankDetailsByID(id);
                if (obj != null)
                {
                    HiddenField1.Value = obj.BankDetailId.ToString();
                    TextBox1.Text = obj.BankName;
                    TextBox2.Text = obj.AccountNumber;
                    TextBox3.Text = obj.IFSCCode;
                    TextBox4.Text = obj.BranchName;
                }
            }
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            AddEmployeeBankDetails();
        }
        public void AddEmployeeBankDetails()
        {
            string bankname = TextBox1.Text;
            string accountnumber = TextBox2.Text;
            string ifsccode = TextBox3.Text;
            string branchname = TextBox4.Text;
            int userid = 1;
            var b = new EmployeeBankDetail
            {
                BankName = bankname,
                AccountNumber = accountnumber,
                IFSCCode = ifsccode,
                BranchName = branchname,
                UserId = userid
            };
            string msg = service.AddEmployeeBankDetails(b);
            FeatchEmployeeBankDetails();
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Write("<script>alert('" + msg + "')</script>");
        }
        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateEmployeeBankDetails();
        }
        public void UpdateEmployeeBankDetails()
        {
            string bankname = TextBox1.Text;
            string accountnumber = TextBox2.Text;
            string ifsccode = TextBox3.Text;
            string branchname = TextBox4.Text;
            int id = int.Parse(HiddenField1.Value);
            int userid = 1;
            var b = new EmployeeBankDetail
            {
                BankDetailId = id,
                BankName = bankname,
                AccountNumber = accountnumber,
                IFSCCode = ifsccode,
                BranchName = branchname,
                UserId = userid
            };
            service.UpdateEmployeeBankDetails(b);
            FeatchEmployeeBankDetails();
            HiddenField1.Value = "";
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            Response.Write("<script>alert('Updated Successfully')</script>");
        }
        public void FeatchEmployeeBankDetails()
        {
            var gw = service.FetchEmployeeBankDetails();
            GridView1.DataSource = gw;
            GridView1.DataBind();
        }
    }
}