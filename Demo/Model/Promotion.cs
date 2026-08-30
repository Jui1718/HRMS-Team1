using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class Promotion
    {
        public int PromotionId { get; set; }

        public int UserID { get; set; }

        public string EmployeeName { get; set; }

        public string DesignationFrom { get; set; }

        public string DesignationTo { get; set; }

        public DateTime PromotionDate { get; set; }

        public string ProfilePicture { get; set; }
    }
}