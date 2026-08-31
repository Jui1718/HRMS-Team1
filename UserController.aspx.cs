    using System;
    using System.Collections.Generic;
    using System.Web.UI;
    using System.Web.UI.WebControls;

    namespace ProjectDemo
    {
        public partial class UserController : System.Web.UI.Page
        {
            IUser service;

            protected void Page_Load(object sender, EventArgs e)
            {
                service = new UserService();

            if (!IsPostBack)
            {
                RoleList();
                DepartmentList();
                ManagerList();

                FeatchUser();
            }
        }

            public void FeatchUser()
            {
                var users = service.FeatchUser();

                GridView1.DataSource = users;
                GridView1.DataBind();
            }

            public void RoleList()
            {
                var roles = service.FetchRoles();

                DropDownList1.DataSource = roles;
                DropDownList1.DataTextField = "RoleName";
                DropDownList1.DataValueField = "RoleId";
                DropDownList1.DataBind();

                DropDownList1.Items.Insert(0, new ListItem("Select", ""));
            }

            public void DepartmentList()
            {
                var departments = service.FetchDepartments();

                DropDownList2.DataSource = departments;
                DropDownList2.DataTextField = "Name";
                DropDownList2.DataValueField = "DepartmentId";
                DropDownList2.DataBind();

                DropDownList2.Items.Insert(0, new ListItem("Select", ""));
            }

            public void ManagerList()
            {
                var managers = service.FetchManagers();

                DropDownList3.DataSource = managers;
                DropDownList3.DataTextField = "FirstName";
                DropDownList3.DataValueField = "UserId";
                DropDownList3.DataBind();

                DropDownList3.Items.Insert(0, new ListItem("Select", ""));
            }


        public void DesignationList(int departmentId)
            {
                var designations = service.FetchDesignations(departmentId);

                DropDownList4.DataSource = designations;
                DropDownList4.DataTextField = "Name";
                DropDownList4.DataValueField = "DesignationId";
                DropDownList4.DataBind();

                DropDownList4.Items.Insert(0, new ListItem("Select", ""));
            }

            public void AddUser()
            {
                User u = new User()
                {
                    FirstName = TextBox1.Text,
                    LastName = TextBox2.Text,
                    Email = TextBox3.Text,
                    PasswordHash = TextBox4.Text,

                    DateOfJoining = DateTime.Parse(TextBox5.Text),
                    DateOfBirth = DateTime.Parse(TextBox6.Text),

                    RoleId = int.Parse(DropDownList1.SelectedValue),
                    DepartmentId = int.Parse(DropDownList2.SelectedValue),
                    ReportingManager = string.IsNullOrEmpty(DropDownList3.SelectedValue)
                    ? (int?)null
                    : Convert.ToInt32(DropDownList3.SelectedValue),
                    DesignationtId = int.Parse(DropDownList4.SelectedValue),

                    PhoneNumber = TextBox7.Text,
                    Address = TextBox8.Text,
                    Gender = DropDownList5.SelectedValue,
                    Status = DropDownList6.SelectedValue,
                    AboutEmployee = TextBox9.Text
                };

                if (FileUpload1.HasFile)
                {
                    u.ProfilePicture = FileUpload1.FileName;
                }

                string msg = service.AddUser(u);

                FeatchUser();

                Response.Write($"<script>alert('{msg}')</script>");
            }

            protected void Button1_Click(object sender, EventArgs e)
            {
                AddUser();
            }

            protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
            {
                if (e.CommandName == "Del")
                {
                    int id = int.Parse(e.CommandArgument.ToString());

                    service.DeleteUser(id);

                    FeatchUser();

                    Response.Write(
                        "<script>alert('User Deleted Successfully')</script>");
                }

                if (e.CommandName == "Upd")
                {
                    int id = int.Parse(e.CommandArgument.ToString());

                    var obj = service.FetchUserByID(id);

                    HiddenField1.Value = obj.UserId.ToString();

                    TextBox1.Text = obj.FirstName;
                    TextBox2.Text = obj.LastName;
                    TextBox3.Text = obj.Email;
                    TextBox4.Text = obj.PasswordHash;

                    TextBox5.Text = obj.DateOfJoining.ToString("yyyy-MM-dd");
                    TextBox6.Text = obj.DateOfBirth.ToString("yyyy-MM-dd");

                    DropDownList1.SelectedValue = obj.RoleId.ToString();

                    if (obj.DepartmentId != null)
                    {
                        DropDownList2.SelectedValue = obj.DepartmentId.ToString();

                        DesignationList((int)obj.DepartmentId);
                    }

                    if (obj.DesignationtId != null)
                    {
                        DropDownList4.SelectedValue = obj.DesignationtId.ToString();
                    }

                    if (obj.ReportingManager != null)
                    {
                        DropDownList3.SelectedValue = obj.ReportingManager.ToString();
                    }
                    else
                    {
                        DropDownList3.SelectedIndex = 0;
                    }
                    TextBox7.Text = obj.PhoneNumber;
                        TextBox8.Text = obj.Address;

                        DropDownList5.SelectedValue = obj.Gender;
                        DropDownList6.SelectedValue = obj.Status;

                        TextBox9.Text = obj.AboutEmployee;

                        Button3.Visible = true;

                // Only open Modal

                //ScriptManager.RegisterStartupScript(
                //    this,
                //    GetType(),
                //    "ShowEditModal",
                //    "var modal = new bootstrap.Modal(document.getElementById('edit_employee')); modal.show();",
                //    true);





                //insert data but not open Modal
                ScriptManager.RegisterStartupScript(
                this,
                GetType(),
                "ShowEditModal",
                "var modal = new bootstrap.Modal(document.getElementById('edit_employee')); modal.show();",
                true);





            }
        }

            public void UpdateUser()
            {
                User u = new User()
                {
                    UserId = int.Parse(HiddenField1.Value),

                    FirstName = TextBox1.Text,
                    LastName = TextBox2.Text,
                    Email = TextBox3.Text,

                    DateOfJoining = DateTime.Parse(TextBox5.Text),
                    DateOfBirth = DateTime.Parse(TextBox6.Text),

                    RoleId = int.Parse(DropDownList1.SelectedValue),
                    DepartmentId = int.Parse(DropDownList2.SelectedValue),
                    ReportingManager = string.IsNullOrEmpty(DropDownList3.SelectedValue)
                    ? (int?)null
                    : Convert.ToInt32(DropDownList3.SelectedValue),
                    DesignationtId = int.Parse(DropDownList4.SelectedValue),

                    PhoneNumber = TextBox7.Text,
                    Address = TextBox8.Text,
                    Gender = DropDownList5.SelectedValue,
                    Status = DropDownList6.SelectedValue,
                    AboutEmployee = TextBox9.Text
                };

                if (FileUpload1.HasFile)
                {
                    u.ProfilePicture = FileUpload1.FileName;
                }

                service.UpdateUser(u);

                FeatchUser();

                Response.Write(
                    "<script>alert('User Updated Successfully')</script>");
            }

            protected void Button3_Click(object sender, EventArgs e)
            {
                UpdateUser();
            }

            protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
            {
                if (DropDownList2.SelectedValue != "")
                {
                    int departmentId = int.Parse(DropDownList2.SelectedValue);

                    DesignationList(departmentId);
                }
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
                TextBox6.Text = "";
                TextBox7.Text = "";
                TextBox8.Text = "";
                TextBox9.Text = "";

                DropDownList1.SelectedIndex = 0;
                DropDownList2.SelectedIndex = 0;
                DropDownList3.SelectedIndex = 0;
                DropDownList4.Items.Clear();
                DropDownList5.SelectedIndex = 0;
                DropDownList6.SelectedIndex = 0;
            }
        }
    }