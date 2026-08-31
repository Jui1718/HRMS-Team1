using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project360.EmployeesController
{
    public partial class EmpGrid : System.Web.UI.Page
    {
        UserService service;
        protected void Page_Load(object sender, EventArgs e)
        {
            service = new UserService();
            if (!IsPostBack)
            {
                FetchEmp();
                LoadEmp();
                FetchDesignation();
            }
        }

        public void FetchEmp()
        {
            var obj = service.FetchEmployeeCard();
            DataList1.DataSource = obj;
            DataList1.DataBind();

        }

        public void LoadEmp()
        {
            var obj = service.GetEmployeeDashboardCount();
            TotalEmp.InnerText = obj.TotalEmployee.ToString();
            Activeemp.InnerText = obj.ActiveEmployee.ToString();
            Inactive.InnerText = obj.InActiveEmployee.ToString();
            Newjoin.InnerText = obj.NewJoiners.ToString();

        }

        public void FetchDesignation()
        {
            var obj = service.GetDesignationlist();
            DataList2.DataSource = obj;
            DataList2.DataBind();
        }


    }
}