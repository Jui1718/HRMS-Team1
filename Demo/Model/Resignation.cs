using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class Resignation
    {
        public int ResignationId { get; set; }

        public int UserID { get; set; }

        public string EmployeeName { get; set; }

        public int DepartmentId { get; set; }

        public string DepartmentName { get; set; }

        public DateTime NoticeDate { get; set; }

        public DateTime ResignDate { get; set; }

        public string Reason { get; set; }
    }
}