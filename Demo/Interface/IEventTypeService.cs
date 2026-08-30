using Demo.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Demo.Interface
{
    internal interface IEventTypeService
    {
        string AddEventType(EventType e);
        List<EventType> FetchEventType();
        EventType EventTypeGetById(int id);
        string EventTypeDel(int id);
        string EventTypeUp(EventType et);
    }
}
