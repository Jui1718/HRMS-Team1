using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Demo.Models;

namespace Demo.Interfaces
{
    public interface EmployeeDocumentInterface
    {
        List<EmployeeDocument> GetEmployeeDocuments();

        EmployeeDocument GetEmployeeDocumentById(int id);

        void AddEmployeeDocument(EmployeeDocument document);

        void UpdateEmployeeDocument(EmployeeDocument document);

        void DeleteEmployeeDocument(int id);
    }
}
