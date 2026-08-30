using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface IEventService
    {
        string AddEvent(Event ev);
        List<Event> FetchEvents();
        Event FindEventById(int id);
        string DelEvent(int id);
        string UpEvent(Event ev);
    }
}
