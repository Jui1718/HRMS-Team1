using System;

namespace ProjectDemo
{
    public class AdminTimesheetModel
    {
        public int TimesheetId { get; set; }
        public string EmployeeName { get; set; }
        public DateTime CreatedAt { get; set; }
        public string ProjectName { get; set; }
        public int WorkHours { get; set; }
        public string Status { get; set; }
    }
}
