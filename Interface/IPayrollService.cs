using System;
using System.Collections.Generic;
using System.Data;

namespace ProjectDemo
{
    public interface IPayrollService
    {
        DataTable FetchUsersDropdown();
        List<EarningItemModel> FetchEarningsList();
        List<DeductionItemModel> FetchDeductionsList();
        int SaveEmployeeSalary(int userId, decimal totalSalary, decimal netSalary);
    }
}
