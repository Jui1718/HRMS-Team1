using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface IPromotionService
    {
        List<Promotion> FetchAll();
        Promotion GetById(int pId);
        string Add(Promotion p);
        string Update(Promotion p);
        string Delete(int pId);
        List<Employee> All();

    }
}
