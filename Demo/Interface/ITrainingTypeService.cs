using System;
using Demo.Model;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface ITrainingTypeService
    {
        List<TrainingType> FetchAll();
        TrainingType GetById(int trainingTypeId);
        string Add(TrainingType t);
        string Update(TrainingType t);
        string Delete(int trainingTypeId);
    }
}
