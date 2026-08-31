using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class AddEmployeeSalary : System.Web.UI.Page
    {
        PayrollService service = new PayrollService();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindDropdown();
                BindEarningsAndDeductions();
            }
        }

        private void BindDropdown()
        {
            DataTable dt = service.FetchUsersDropdown();
            DropDownListEmployee.DataSource = dt;
            DropDownListEmployee.DataTextField = "FullName";
            DropDownListEmployee.DataValueField = "UserId";
            DropDownListEmployee.DataBind();
            DropDownListEmployee.Items.Insert(0, new ListItem("-- Select Employee --", ""));
        }

        private void BindEarningsAndDeductions()
        {
            RepeaterEarnings.DataSource = service.FetchEarningsList();
            RepeaterEarnings.DataBind();

            RepeaterDeductions.DataSource = service.FetchDeductionsList();
            RepeaterDeductions.DataBind();
        }

        protected void TextBoxTotalSalary_TextChanged(object sender, EventArgs e)
        {
            decimal totalSalary;
            if (decimal.TryParse(TextBoxTotalSalary.Text.Trim(), out totalSalary))
            {
                // Calculate Earnings
                foreach (RepeaterItem item in RepeaterEarnings.Items)
                {
                    HiddenField hfPct = (HiddenField)item.FindControl("HiddenFieldEarningsPercentage");
                    TextBox txtAmount = (TextBox)item.FindControl("TextBoxEarningAmount");

                    if (hfPct != null && txtAmount != null)
                    {
                        decimal pct = decimal.Parse(hfPct.Value);
                        decimal amount = (totalSalary * pct) / 100;
                        txtAmount.Text = amount.ToString("0.00");
                    }
                }

                // Calculate Deductions
                foreach (RepeaterItem item in RepeaterDeductions.Items)
                {
                    HiddenField hfPct = (HiddenField)item.FindControl("HiddenFieldDeductionPercentage");
                    TextBox txtAmount = (TextBox)item.FindControl("TextBoxDeductionAmount");

                    if (hfPct != null && txtAmount != null)
                    {
                        decimal pct = decimal.Parse(hfPct.Value);
                        decimal amount = (totalSalary * pct) / 100;
                        txtAmount.Text = amount.ToString("0.00");
                    }
                }
            }
        }

        protected void ButtonSave_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(DropDownListEmployee.SelectedValue) || string.IsNullOrEmpty(TextBoxTotalSalary.Text.Trim()))
            {
                Response.Write("<script>alert('Please select employee and enter total salary');</script>");
                return;
            }

            int userId = int.Parse(DropDownListEmployee.SelectedValue);
            decimal totalSalary = decimal.Parse(TextBoxTotalSalary.Text.Trim());

            decimal totalEarnings = 0;
            decimal totalDeductions = 0;

            foreach (RepeaterItem item in RepeaterEarnings.Items)
            {
                TextBox txtAmount = (TextBox)item.FindControl("TextBoxEarningAmount");
                decimal amt;
                if (txtAmount != null && decimal.TryParse(txtAmount.Text, out amt))
                {
                    totalEarnings += amt;
                }
            }

            foreach (RepeaterItem item in RepeaterDeductions.Items)
            {
                TextBox txtAmount = (TextBox)item.FindControl("TextBoxDeductionAmount");
                decimal amt;
                if (txtAmount != null && decimal.TryParse(txtAmount.Text, out amt))
                {
                    totalDeductions += amt;
                }
            }

            decimal netSalary = totalEarnings - totalDeductions;

            int salaryId = service.SaveEmployeeSalary(userId, totalSalary, netSalary);

            if (salaryId > 0)
            {
                DropDownListEmployee.SelectedIndex = 0;
                TextBoxTotalSalary.Text = "";
                BindEarningsAndDeductions();
                Response.Write("<script>alert('Salary Added Successfully!');</script>");
            }
            else
            {
                Response.Write("<script>alert('Failed to save salary.');</script>");
            }
        }
    }
}
