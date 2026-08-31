using System;
using System.Collections.Generic;
using System.Data;

namespace ProjectDemo
{
    public interface ILeaveService
    {
        string SaveLeaveType(MasterLeaveType lt);
        List<MasterLeaveType> FetchLeaveType();
        void DeleteLeaveType(int id);
        string AllocateDepartmentLeave(DepartmentLeaves dl);
        DataTable FetchDepartmentsDropdown();
        DataTable FetchLeaveTypesDropdown();
        List<DepartmentLeaves> FetchDepartmentLeaveDetails();
        void DeleteDepartmentLeave(int id);
        string UpdateLeaveTypeStatus(int leaveTypeId, string status);

    }
}
