using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface ITrainerService
    {
        string Add(Trainer t);

        string Update(Trainer t);

        string Delete(int trainerId);

        List<Trainer> FetchAll();

        Trainer GetById(int trainerId);
    }
}
