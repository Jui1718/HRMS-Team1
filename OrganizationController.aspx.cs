using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class OrganizationController : System.Web.UI.Page
    {
        IOrganization service;

        protected void Page_Load(object sender, EventArgs e)
        {
            service = new OrganizationService();

            if (!IsPostBack)
            {
                FeatchOrganization();
            }
        }

        public void FeatchOrganization()
        {
            var organizations = service.FeatchOrganization();

            GridView1.DataSource = organizations;
            GridView1.DataBind();
        }

        public void AddOrganization()
        {
            Organization o = new Organization()
            {
                OrganizationName = TextBox1.Text,
                OrganizationPhone = TextBox2.Text,
                OrganizationAddress = TextBox3.Text,
                OrganizationEmail = TextBox4.Text,
                OrganizationDescription = TextBox5.Text
            };

            if (FileUpload1.HasFile)
            {
                o.OrganizationLogo = FileUpload1.FileName;
            }

            string msg = service.AddOrganization(o);

            FeatchOrganization();

            Clear();

            Response.Write($"<script>alert('{msg}')</script>");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            AddOrganization();
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Del")
            {
                int id = int.Parse(e.CommandArgument.ToString());

                service.DeleteOrganization(id);

                FeatchOrganization();

                Response.Write(
                    "<script>alert('Organization Deleted Successfully')</script>");
            }

            if (e.CommandName == "Upd")
            {
                int id = int.Parse(e.CommandArgument.ToString());

                var obj = service.FetchOrganizationByID(id);

                HiddenField1.Value = obj.OrganizationId.ToString();

                TextBox1.Text = obj.OrganizationName;
                TextBox2.Text = obj.OrganizationPhone;
                TextBox3.Text = obj.OrganizationAddress;
                TextBox4.Text = obj.OrganizationEmail;
                TextBox5.Text = obj.OrganizationDescription;

                Button3.Visible = true;
            }
        }

        public void UpdateOrganization()
        {
            Organization o = new Organization()
            {
                OrganizationId = int.Parse(HiddenField1.Value),

                OrganizationName = TextBox1.Text,
                OrganizationPhone = TextBox2.Text,
                OrganizationAddress = TextBox3.Text,
                OrganizationEmail = TextBox4.Text,
                OrganizationDescription = TextBox5.Text
            };

            if (FileUpload1.HasFile)
            {
                o.OrganizationLogo = FileUpload1.FileName;
            }

            service.UpdateOrganization(o);

            FeatchOrganization();

            Clear();

            Response.Write(
                "<script>alert('Organization Updated Successfully')</script>");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            UpdateOrganization();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Clear();
        }

        public void Clear()
        {
            HiddenField1.Value = "";

            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox3.Text = "";
            TextBox4.Text = "";
            TextBox5.Text = "";

            FileUpload1.Attributes.Clear();
        }
    }
}