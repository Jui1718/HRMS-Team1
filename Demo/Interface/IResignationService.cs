using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface IResignationService
    {
        string Add(Resignation r);

        string Update(Resignation r);

        string Delete(int resignationId);

        List<Resignation> FetchAll();

        Resignation GetById(int resignationId);
    }
}
