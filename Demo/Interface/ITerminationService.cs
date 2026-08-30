using Demo.Model;
using System;
using System.Collections.Generic;

namespace Demo.Interface
{
    public interface ITerminationService
    {
        List<Demo.Model.Termination> FetchAll();
        Demo.Model.Termination FetchById(int tId);
        string Add(Demo.Model.Termination t);
        string Update(Demo.Model.Termination ter);
        string Delete(int tId);
    }
}