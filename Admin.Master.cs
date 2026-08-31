using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProjectDemo
{
    public partial class Admin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["us"] != null)
            {
                Label1.Text = Session["us"].ToString();
            }
            else
            {
                Response.Write("<script>alert('Need TO Login');window.location.href='/LoginController.aspx';</script>");
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Session.Abandon();
            Response.Redirect("<script>alert('Logout Successfully');window.location.href='~/LoginController.aspx';</script>");
            Response.Redirect("<script>alert('Logout Successfully');window.location.href='~/LoginController.aspx';</script>");
        }
    }
}