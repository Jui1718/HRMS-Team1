using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface ITicketRaiseService
    {
        string Add(TicketRaise t);
        string Update(TicketRaise t);
        string Delete(int ticketId);
        List<TicketRaise> FetchAll();
        TicketRaise GetById(int ticketId);
        string AssignTicket(int ticketId, int assignedTo);
        string ResolveTicket(int ticketId, string solution, string solutionFilePath, string solutionOriginalFileName);
    }
}
