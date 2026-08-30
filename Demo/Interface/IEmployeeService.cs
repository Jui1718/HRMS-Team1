using Demo.Model;
using System.Collections.Generic;

namespace Demo.Interface
{
    public interface IEmployeeService
    {
        List<Employee> FetchAll();
    }
}