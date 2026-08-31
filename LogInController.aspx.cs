using System;
using System.Security.Policy;
using System.Web.UI.WebControls;

namespace ProjectDemo.Controllers
{
    public partial class LogInController : System.Web.UI.Page
    {
        AuthService service = new AuthService();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click1(object sender, EventArgs e)
        {
            userLogin();
        }


        public void userLogin()
        {
            string email = TextBox1.Text;
            string password = TextBox2.Text;

            Login user = service.Login(email, password);

            if (user != null)
            {
                Session["id"] = user.UserId;
                Response.Write("<script>alert('UserId = " + user.UserId + "')</script>");
                Session["us"] = user.UserName;

                if (user.RoleName == "Admin")
                {
                    Response.Redirect("AdminDashboard.aspx");
                }
                else if (user.RoleName == "Manager")
                {
                    Response.Redirect("ManagerD.aspx");
                }
                else if (user.RoleName == "Employee")
                {
                    Response.Redirect("UserController.aspx");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Email or Password')</script>");
            }
        }

        protected void btnGoogleLogin_Click(object sender, EventArgs e)
        {
            // Google login logic will be implemented later.
        }

        
    }
}


