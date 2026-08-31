using System;
using System.Collections.Generic;
using System.Data;

namespace ProjectDemo
{
    public interface ITimesheetService
    {
        List<AdminTimesheetModel> FetchAdminTimesheets();
        string UpdateTimesheetStatus(int timesheetId, string status);
        DataTable FetchProjectsDropdown();
    }
}
