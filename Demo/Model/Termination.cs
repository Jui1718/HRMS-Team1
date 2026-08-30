using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace Demo.Model
{
    public class Termination
    {
        public int TerminationId { get; set; }
        public int UserID { get; set; }
        public string TerminationType { get; set; }
        public DateTime NoticeDate { get; set; }
        public DateTime ResignDate { get; set; }
        public string Reason { get; set; }

        public string EmployeeName { get; set; }
        public string ProfilePicture { get; set; }
        public string AttachmentPath { get; set; }

    }
}