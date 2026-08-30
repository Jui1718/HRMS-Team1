using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface ITrainingService
    {
        string Add(Training training);

        List<Training> FetchAll();

        Training GetById(int trainingId);

        string Update(Training training);

        string Delete(int trainingId);
    }
}
