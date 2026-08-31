using System;

namespace ProjectDemo
{
    public class LeaveRequestModel
    {
        public int LeaveRequestId { get; set; }
        public string LeaveType { get; set; }
        public string EmployeeName { get; set; }
        public string ApprovedBy { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string Reason { get; set; }
        public int NumberOfDays { get; set; }
        public string Status { get; set; }
    }
}
