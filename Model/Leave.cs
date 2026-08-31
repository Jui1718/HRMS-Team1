using System;

namespace ProjectDemo
{
    public class MasterLeaveType
    {
        public int LeaveTypeId { get; set; }
        public string LeaveType { get; set; }
        public string Status { get; set; }
        public bool IsActive => string.Equals(Status, "Active", StringComparison.OrdinalIgnoreCase);
    }

    public class DepartmentLeaves
    {
        public int DepartmentLeavesId { get; set; }
        public int DepartmentId { get; set; }
        public string DepartmentName { get; set; }
        public int LeaveTypeId { get; set; }
        public string LeaveType { get; set; }     
        public int LeavesCount { get; set; }
        public string Status { get; set; }
    }
}
