using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Demo.Model
{
    public class TicketRaise
    {
        public int TicketId { get; set; }
        public string TicketTitle { get; set; }
        public string TicketDetail { get; set; }
        public int RaisedBy { get; set; }
        public string RaisedByName { get; set; }
        public string FilePath { get; set; }
        public string OriginalFileName { get; set; }
        public int? AssignedTo { get; set; }
        public string AssignedToName { get; set; }
        public string Status { get; set; }
        public string Solution { get; set; }
        public string SolutionFilePath { get; set; }
        public string SolutionOriginalFileName { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}